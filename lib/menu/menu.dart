
import 'package:flutter/material.dart';

import 'menu_controller.dart';


class Menu extends StatefulWidget {

  final MenuController controller;

  const Menu({Key key, this.controller}) : super(key: key);

  void showOrHide() {
    controller.showOrHide();
  }

  @override
  _MenuState createState() => _MenuState(controller);

}

class _MenuState extends State<Menu> {

  final MenuController controller;

  _MenuState(this.controller) {
    controller.addCallback(() => setState(() => {}));
  }


  @override
  Widget build(BuildContext context) {


    if(controller.shown)
      return Container(
      width: 360,
      height: 640,
      decoration: BoxDecoration(
        color : Color.fromRGBO(14, 5, 47, 0.85),
      ),
        child: OutlinedButton(
          onPressed: () => controller.showOrHide(),
          child: Container(
            width: 100,
            height: 100,
          ),
        ),
    );
    else return Container();
  }

}



