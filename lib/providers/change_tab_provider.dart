import 'package:flutter/cupertino.dart';

import '../utils/utils.dart';

class ChangeTabProvider with ChangeNotifier {
  StreamTabType _streamTabType = StreamTabType.first;

  StreamTabType get streamTabType => _streamTabType;

  void changeTab(StreamTabType tabType) {
    _streamTabType = tabType;
    notifyListeners();
  }
}
