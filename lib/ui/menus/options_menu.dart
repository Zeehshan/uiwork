import 'dart:ui';

import 'package:flutter/material.dart';

class OptionsMnue {
  static Future<int?> showPopupMenu({
    required BuildContext context,
    required List<MenuItemModel> menus,
    required Offset offset,
    bool showIconInRight = false,
  }) async {
    Offset offs = offset;
    final RenderBox button = context.findRenderObject()! as RenderBox;
    final RenderBox overlay =
        Navigator.of(context).overlay!.context.findRenderObject()! as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(offs, ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero) + offs,
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    final menuItems = menus;
    bool dark = Theme.of(context).brightness == Brightness.dark;
    List<Color> colors = [];
    if (dark) {
      colors = [
        Colors.white.withOpacity(.10),
        Colors.black.withOpacity(0.2),
        const Color(0xff2A2929),
      ];
    } else {
      colors = [
        Colors.black.withOpacity(.10),
        Colors.black.withOpacity(0.2),
        Colors.black.withOpacity(0.1),
      ];
    }
    return await showMenu<int?>(
        context: context,
        position: position,
        elevation: 0,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        items: [
          PopupMenuItem(
            padding: const EdgeInsets.only(left: 20),
            onTap: null,
            enabled: false,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Opacity(
                  opacity: 0.8,
                  child: Container(
                      width: 250,
                      decoration: BoxDecoration(
                        color: colors[2],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Material(
                        color: Colors.transparent,
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            primary: true,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    Navigator.pop(context, index);
                                    Future.value(index);
                                  },
                                  child: SizedBox(
                                    height: 44,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Row(
                                        children: [
                                          if (!showIconInRight &&
                                              menuItems[index].icon != null)
                                            Icon(
                                              menuItems[index].icon!,
                                              size: 8,
                                            ),
                                          if (!showIconInRight)
                                            const SizedBox(width: 11),
                                          Text(
                                            menuItems[index].label,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    color:
                                                        menuItems[index].color,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w400),
                                          ),
                                          if (showIconInRight &&
                                              menuItems[index].icon != null)
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Icon(
                                                  menuItems[index].icon!,
                                                  size: 8,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            separatorBuilder: (context, index) => Divider(
                                  height: 0,
                                  color: Theme.of(context).dividerColor,
                                ),
                            itemCount: menuItems.length),
                      )),
                ),
              ),
            ),
          ),
        ]);
  }
}

class MenuItemModel {
  final String label;
  final IconData? icon;
  final Color color;
  MenuItemModel({
    required this.label,
    this.icon,
    required this.color,
  });
}
