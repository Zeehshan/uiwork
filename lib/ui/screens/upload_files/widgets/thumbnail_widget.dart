import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../../providers/upload_files_provider.dart';
import '../../../../utils/utils.dart';

class ThumbnailWidget extends StatefulWidget {
  final String path;
  final Function(String thumbnail) onGenerateThumbnail;
  const ThumbnailWidget({
    super.key,
    required this.path,
    required this.onGenerateThumbnail,
  });

  @override
  State<ThumbnailWidget> createState() => _ThumbnailWidgetState();
}

class _ThumbnailWidgetState extends State<ThumbnailWidget> {
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
            final thumbnail = snapshot.data as Uint8List;
            return GallaryVideoThumbnailWidget(
              path: thumbnail,
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
  final Function(String thumbnail) onGenerateThumbnail;
  const GallaryVideoThumbnailWidget({
    super.key,
    required this.path,
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
        File('${dir.path}/${DateTime.now().millisecondsSinceEpoch}.jpeg')
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
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          offset: Offset(0, 0),
          color: Colors.grey,
          spreadRadius: 1,
          blurRadius: 10,
        )
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.memory(
          widget.path,
          height: 100,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
