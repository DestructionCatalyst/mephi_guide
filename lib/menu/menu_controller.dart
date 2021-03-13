

import 'dart:math';

class MenuController{

  int id = Random().nextInt(1000000000);

  static MenuController instance;

  MenuController._();

  factory MenuController.getInstance(){
    return instance ?? (instance = MenuController._());
  }

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

