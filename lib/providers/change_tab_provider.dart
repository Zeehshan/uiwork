import 'package:flutter/cupertino.dart';

import '../utils/utils.dart';

class ChangeTabProvider with ChangeNotifier {
  StreamTabType _streamTabType = StreamTabType.first;

  StreamTabType get streamTabType => _streamTabType;

  List<IconData> tabOList = [];

  bool isLeftSwithcEnable = false;

  String header = 'Header';

  String addParticipant = 'Add Participent';
  switchChanged(bool v) {
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
}
