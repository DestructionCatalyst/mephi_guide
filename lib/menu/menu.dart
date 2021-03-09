
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


    if(controller.shown) {
      return Container(
          width: 360,
          height: 640,
          decoration: BoxDecoration(
            color: Color.fromRGBO(14, 5, 47, 0.85),
          ),
          child: Stack(children: <Widget>[
            Positioned(
              top: 77,
              left: 0,
              child: Container(
                width: 360,
                height: 563,
                child: ListView(padding: EdgeInsets.zero, children: <Widget>[
                  MenuTile(
                    name: "Новости",
                    icon: ImageIcon(
                      AssetImage('assets/images/icons/globe.png'),
                      color: Colors.white,
                    ),
                  ),
                ]),
              ),
            ),
          ]));
    } else return Container();
  }

}

class MenuTile extends StatelessWidget {

  final String name;
  final ImageIcon icon;
  final String page;

  const MenuTile({Key key, this.name, this.icon, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 360,
        height: 55,
        child: Stack(
          children: <Widget>[
            //341 77
            Positioned(
              top: 15,
              right: 92,
                child: Text(
                  name,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Roboto',
                      fontSize: 15.36344051361084,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1.4999999689628662),
                )
            ),
            Positioned(
                top: 0,
                right: 19,
                child: Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.3),
                      borderRadius: BorderRadius.all(Radius.elliptical(55, 55)),
                    ),
                    child: icon,
                )
            )
          ],
        ));
  }
}




