

class MenuController{

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