import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../providers/providers.dart';
import '../../../../utils/utils.dart';
import '../../../widgets/widgets.dart';

class GallaryPhotosWidget extends StatelessWidget {
  const GallaryPhotosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tabC = context.watch<TabCProvider>();
    if (tabC.files.isEmpty) {
      return Container();
    }
    return SizedBox(
        height: 110,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 8),
          scrollDirection: Axis.horizontal,
          children: tabC.files.keys
              .map((fileId) => Padding(
                    padding: const EdgeInsets.only(right: 9),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: SizedBox(
                          width: 114,
                          height: 110,
                          child: Stack(
                            children: [
                              Builder(builder: (context) {
                                final item = tabC.files[fileId]!;
                                if (item.filetype == AttachementType.video) {
                                  return Positioned.fill(
                                    child: GallaryVideoWidget(
                                      path: item.file,
                                      onGenerateThumbnail: (thumnail) => tabC
                                          .thumbnailGenerated(fileId, thumnail),
                                    ),
                                  );
                                }
                                return Positioned.fill(
                                  child: Image.file(
                                    File(item.file),
                                    fit: BoxFit.cover,
                                  ),
                                );
                              }),
                              Positioned(
                                right: 4,
                                top: 4,
                                child: CrossButtonWidget(
                                  onTap: () => tabC.removeFile(fileId),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ))
              .toList(),
        ));
  }
}
