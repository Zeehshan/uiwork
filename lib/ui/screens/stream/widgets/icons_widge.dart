import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/providers.dart';

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
                onPressed: () => tabState.addTabOListItem(e), icon: Icon(e)))
            .toList(),
      ),
    );
  }
}
