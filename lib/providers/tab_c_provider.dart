import 'package:flutter/foundation.dart';

class TabCProvider extends ChangeNotifier {
  String title = 'sdfsdfsafdsdf';
  String? selectedItem;
  String description = 'asdfasdfsdfsfd';
  bool isLeftSwithcEnable = false;

  List<Map<String, dynamic>> menus = [
    {
      'id': '0',
      'label': 'Item 1',
    },
    {
      'id': '1',
      'label': 'Item 2',
    },
    {
      'id': '2',
      'label': 'Item 3',
    },
    {
      'id': '3',
      'label': 'Item 4',
    },
    {
      'id': '4',
      'label': 'Settings',
    },
  ];

  switchChanged() {
    isLeftSwithcEnable = !isLeftSwithcEnable;
    notifyListeners();
  }

  menuItemSelected(String v) {
    selectedItem = v;
    notifyListeners();
  }

  setTitleAndDescription(String titleValue, String decriptionValue) {
    title = titleValue;
    description = decriptionValue;
    notifyListeners();
  }
}
