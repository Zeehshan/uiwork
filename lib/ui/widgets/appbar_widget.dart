import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget> actions;
  final double toolbarHeight;
  final Color? backgroundColor, leadingIconColor;
  final VoidCallback? backButtonCallback;
  final bool? centerTitle;
  final double elevation;

  const AppBarWidget(
      {super.key,
      this.title,
      this.actions = const [],
      this.toolbarHeight = kToolbarHeight,
      this.backgroundColor,
      this.backButtonCallback,
      this.leadingIconColor,
      this.centerTitle,
      this.elevation = 0});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      primary: true,
      elevation: elevation,
      leadingWidth: 60,
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,
      toolbarHeight: toolbarHeight,
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      titleSpacing: 0,
      leading: (backButtonCallback != null)
          ? InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: backButtonCallback,
              child: const Icon(
                Icons.arrow_back_ios,
                size: 18,
              ))
          : null,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
