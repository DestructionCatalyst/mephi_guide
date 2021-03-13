import 'package:flutter/material.dart';
import 'package:mephi_guide/reminders/rem.dart';

class MenuController{

  Map<String, Function> navigationMap =
  {
    "news" : () => Container(),
    "reminders" : () => RemindersTab(),
    "navigation" : () => Container(),
    "qrcode" : () => Container(),
    "about" : () => Container()
  };

  bool _shown = false;
  List<Function> onChangedCallbacks = [];

  get shown => _shown;

  void addCallback(Function callback) =>
      onChangedCallbacks.add(callback);


  void showOrHide() {

    _shown = !_shown;

    onChangedCallbacks.forEach((element) => element());
    print(_shown ? "Menu shown" : "Menu hidden");
  }

}

