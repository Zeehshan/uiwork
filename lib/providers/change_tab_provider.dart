import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class ChangeTabProvider with ChangeNotifier {
  StreamTabType _streamTabType = StreamTabType.first;

  StreamTabType get streamTabType => _streamTabType;

  List<IconData> tabOList = [];

  bool isLeftSwithcEnable = false;

  String header = 'Header';

  String? selectedItem;

  String title = '';
  String description = '';

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

  int participants = 0;
  switchChanged() {
    isLeftSwithcEnable = !isLeftSwithcEnable;
    notifyListeners();
  }

  void changeTab(StreamTabType tabType) {
    _streamTabType = tabType;
    notifyListeners();
  }

  addTabOListItem(IconData icon) {
    tabOList.insert(0, icon);
    notifyListeners();
  }

  menuItemSelected(String v) {
    selectedItem = v;
    notifyListeners();
  }

  setTitleAndDescription(String titleValue, String decriptionValue) {
    title = titleValue.isNotEmpty ? titleValue : title;
    description = decriptionValue.isNotEmpty ? decriptionValue : description;
  }
}
