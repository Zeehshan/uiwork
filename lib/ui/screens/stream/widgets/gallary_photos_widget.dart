import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../providers/providers.dart';
import '../../../../utils/utils.dart';
import '../../../widgets/widgets.dart';
import 'package:path/path.dart' as p;

class GallaryPhotosWidget extends StatelessWidget {
  const GallaryPhotosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tabC = context.watch<TabCProvider>();
    logger.i(tabC.files.length);
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
                      child: Builder(builder: (context) {
                        final item = tabC.files[fileId]!;
                        if (item.filetype == AttachementType.file) {
                          return SizedBox(
                            width: 180,
                            height: 110,
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    child: ListTile(
                                      dense: true,
                                      horizontalTitleGap: 8,
                                      minLeadingWidth: 0,
                                      minVerticalPadding: 0,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8),
                                      leading: FileIconWidget(
                                        extension: p.extension(item.file),
                                      ),
                                      title: Text(
                                        item.name,
                                        maxLines: 2,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                color: Colors.white,
                                                fontSize: 14),
                                      ),
                                      subtitle: Text(
                                          Tools.getFileSizeString(
                                              bytes: item.size),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  color: Colors.white54,
                                                  fontSize: 12)),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 4,
                                  top: 4,
                                  child: CrossButtonWidget(
                                    onTap: () => tabC.removeFile(fileId),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        return SizedBox(
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
                                        onGenerateThumbnail: (thumnail) =>
                                            tabC.thumbnailGenerated(
                                                fileId, thumnail),
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
                            ));
                      }),
                    ),
                  ))
              .toList(),
        ));
  }
}
