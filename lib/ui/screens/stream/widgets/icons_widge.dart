import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../providers/providers.dart';
import '../../../../utils/utils.dart';
import '../../screens.dart';

class IconsWidget extends StatelessWidget {
  const IconsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tabState = Provider.of<ChangeTabProvider>(context);
    List<IconData> icons = [
      CupertinoIcons.smiley,
      CupertinoIcons.smiley_fill,
      CupertinoIcons.sun_dust,
      CupertinoIcons.sunset,
    ];
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      height: 40,
      child: Row(
        children: icons
            .map((e) => IconButton(
                onPressed: () async {
                  switch (e) {
                    case CupertinoIcons.smiley:
                      final files = await Navigator.of(context)
                          .push<List<XFile?>>(MaterialPageRoute(
                              builder: (context) => const CameraScreen(
                                    initialCaptureMode: CaptureMode.photo,
                                  )));
                      if (files != null) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UploadFilesScreen(
                                  uploadType: UploadType.videos,
                                  files: files,
                                )));
                      }
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => const UploadFilesScreen(
                      //           uploadType: UploadType.images,
                      //         )));
                      break;
                    case CupertinoIcons.smiley_fill:
                      final files = await Navigator.of(context)
                          .push<List<XFile?>>(MaterialPageRoute(
                              builder: (context) => const CameraScreen(
                                    initialCaptureMode: CaptureMode.video,
                                  )));
                      if (files != null) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UploadFilesScreen(
                                  uploadType: UploadType.videos,
                                  files: files,
                                )));
                      }

                      //  Navigator.of(context).push(MaterialPageRoute(
                      //       builder: (context) => UploadFilesScreen(
                      //             uploadType: UploadType.videos,
                      //           )));

                      break;
                    default:
                      tabState.addTabOListItem(e);
                  }
                },
                icon: Icon(e)))
            .toList(),
      ),
    );
  }
}
