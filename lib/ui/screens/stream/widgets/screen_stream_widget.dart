import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/providers.dart';
import '../../screens.dart';

class ScreenStreamWidget extends StatelessWidget {
  const ScreenStreamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tacProvider = Provider.of<TabCProvider>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () => tacProvider.switchChanged(),
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: tacProvider.isLeftSwithcEnable
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          PopupMenuButton<String>(
            onSelected: (String result) {
              switch (result) {
                case '4':
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SettingsScreen()));
                  break;
                default:
                  tacProvider.menuItemSelected(result);
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              ...tacProvider.menus.map(
                (e) => CheckedPopupMenuItem(
                  checked: tacProvider.selectedItem == e['id'],
                  value: e['id'],
                  child: Text(
                    e['label'],
                  ),
                ),
              )

              // ...other items listed here
            ],
          ),
          const SizedBox(width: 30),
        ],
      ),
    );
  }
}
