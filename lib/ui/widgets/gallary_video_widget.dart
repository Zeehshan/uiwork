import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../utils/utils.dart';

class GallaryVideoWidget extends StatefulWidget {
  final String path;
  final Function(String thumbnail) onGenerateThumbnail;
  const GallaryVideoWidget(
      {super.key, required this.path, required this.onGenerateThumbnail});

  @override
  State<GallaryVideoWidget> createState() => _GallaryVideoWidgetState();
}

class _GallaryVideoWidgetState extends State<GallaryVideoWidget> {
  late Future<Uint8List?> _future;
  @override
  void initState() {
    super.initState();
    _future = videoService.generateVideoThumbnail(
      video: widget.path,
      quality: 50,
      imageFormat: ImageFormat.JPEG,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Container();
          } else if (snapshot.hasData) {
            logger.i(snapshot.hasData);
            final thumbnail = snapshot.data as Uint8List;
            return GallaryVideoThumbnailWidget(
              path: thumbnail,
              videoPath: widget.path,
              onGenerateThumbnail: widget.onGenerateThumbnail,
            );
          } else {
            return Container();
          }
        }
        return Container();
      },
    );
  }
}

class GallaryVideoThumbnailWidget extends StatefulWidget {
  final Uint8List path;
  final String videoPath;
  final Function(String thumbnail) onGenerateThumbnail;
  const GallaryVideoThumbnailWidget({
    super.key,
    required this.path,
    required this.videoPath,
    required this.onGenerateThumbnail,
  });

  @override
  State<GallaryVideoThumbnailWidget> createState() =>
      _GallaryVideoThumbnailWidgetState();
}

class _GallaryVideoThumbnailWidgetState
    extends State<GallaryVideoThumbnailWidget> {
  @override
  initState() {
    super.initState();
    try {
      getTemporaryDirectory().then((dir) {
        File('${dir.path}/${widget.videoPath.hashCode}.jpeg')
            .create()
            .then((onValue) {
          onValue.writeAsBytesSync(widget.path);
          widget.onGenerateThumbnail(onValue.path);
        }).catchError((err) {
          logger.e(err);
        });
      }).catchError((onError) {
        logger.e(onError);
      });
    } catch (e) {
      logger.e(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Image.memory(
      widget.path,
      fit: BoxFit.cover,
    );
  }
}
