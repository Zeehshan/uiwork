import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class ChangeTabProvider with ChangeNotifier {
  StreamTabType _streamTabType = StreamTabType.first;

  StreamTabType get streamTabType => _streamTabType;

  List<IconData> tabOList = [];
  String header = 'Header';
  void changeTab(StreamTabType tabType) {
    _streamTabType = tabType;
    notifyListeners();
  }

  addTabOListItem(IconData icon) {
    tabOList.insert(0, icon);
    notifyListeners();
  }
}
