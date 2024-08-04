import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                onPressed: () {
                  switch (e) {
                    case CupertinoIcons.smiley:
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => const CameraScreen(
                      //           initialCaptureMode: CaptureMode.photo,
                      //         )));
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const UploadFilesScreen(
                                uploadType: UploadType.images,
                              )));
                      break;
                    case CupertinoIcons.smiley_fill:
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => const CameraScreen(
                      //           initialCaptureMode: CaptureMode.video,
                      //         )));
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const UploadFilesScreen(
                                uploadType: UploadType.videos,
                              )));
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
