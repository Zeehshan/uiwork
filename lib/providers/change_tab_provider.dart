import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class ChangeTabProvider with ChangeNotifier {
  StreamTabType _streamTabType = StreamTabType.first;

  StreamTabType get streamTabType => _streamTabType;

  List<IconData> tabOList = [];

  bool blurrEnable = false;

  late AnimationController blurrAnimationController;
  late AnimationController optionsAnimationController;

  String header = 'Header';
  void changeTab(StreamTabType tabType) {
    _streamTabType = tabType;
    notifyListeners();
  }

  addTabOListItem(IconData icon) {
    tabOList.insert(0, icon);
    notifyListeners();
  }

  blurrChanged(bool v) {
    if (v) {
      blurrEnable = v;
      notifyListeners();
    } else {
      Future.delayed(const Duration(milliseconds: 250), () {
        blurrEnable = v;
        notifyListeners();
      });
    }
    if (v) {
      blurrAnimationController.forward();
      optionsAnimationController.forward();
    } else {
      blurrAnimationController.reverse();
      optionsAnimationController.reverse();
    }
  }

  updateAnimationController(AnimationController controller) {
    blurrAnimationController = controller;
  }

  updatesOptionsAnimatedcontroller(AnimationController controller) {
    optionsAnimationController = controller;
  }
}
