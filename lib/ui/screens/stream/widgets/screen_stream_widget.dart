import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/providers.dart';
import '../../../menus/menus.dart';
import '../../screens.dart';

class ScreenStreamWidget extends StatelessWidget {
  const ScreenStreamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final metaState = Provider.of<ChangeTabProvider>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CupertinoSwitch(
            onChanged: metaState.switchChanged,
            value: metaState.isLeftSwithcEnable,
          ),
          IconButton(
              onPressed: () => OptionsMnue.showPopupMenu(
                      context: context,
                      offset: Offset(1, (MediaQuery.of(context).size.height)),
                      menus: [
                        MenuItemModel(
                          icon: Icons.circle,
                          label: 'Item 1',
                          color: Colors.black,
                        ),
                        MenuItemModel(
                          icon: Icons.circle,
                          label: 'Item 2',
                          color: Colors.black,
                        ),
                        MenuItemModel(
                          icon: Icons.circle,
                          label: 'Item 3',
                          color: Colors.black,
                        ),
                        MenuItemModel(
                          icon: Icons.circle,
                          label: 'Item 4',
                          color: Colors.black,
                        ),
                        MenuItemModel(
                          icon: Icons.settings,
                          label: 'Setting',
                          color: Theme.of(context).primaryColor,
                        ),
                      ]).then((value) {
                    switch (value) {
                      case 4:
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SettingsScreen()));
                        break;
                    }
                  }),
              icon: const Icon(
                Icons.menu,
              )),
          const SizedBox(width: 30),
        ],
      ),
    );
  }
}
