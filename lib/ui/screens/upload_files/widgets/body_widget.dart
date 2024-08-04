import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/providers.dart';
import '../../../../utils/utils.dart';
import '../../../widgets/widgets.dart';
import 'widgets.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final providerState = context.watch<UploadFilesProvider>();
    if (providerState.files.isEmpty) {
      return Center(
          child: TextButton(
              onPressed: () => providerState.uploadType == UploadType.videos
                  ? providerState.getVideos()
                  : providerState.getPhotos(),
              child: const Text('Choose Files')));
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      itemBuilder: (context, int index) {
        final file = providerState.files[index];
        final progress = providerState.progresses[file.path];
        final uploaded = providerState.uploaded[file.path];
        return Column(
          children: [
            Builder(
              builder: (context) {
                if (providerState.uploadType == UploadType.videos) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ThumbnailWidget(
                        path: file.path!,
                        onGenerateThumbnail: (thumnail) => providerState
                            .thumbnailGenerated(file.path!, thumnail)),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageWidget(
                    path: file.path!,
                  ),
                );
              },
            ),
            Builder(
              builder: (context) {
                if (uploaded == true) {
                  return Container(
                    height: 3,
                    color: Colors.green,
                    width: double.infinity,
                  );
                }
                if (progress != null) {
                  return UploadProgressWidget(percentage: progress);
                }
                return Container();
              },
            ),
          ],
        );
      },
      itemCount: providerState.files.length,
    );
  }
}
