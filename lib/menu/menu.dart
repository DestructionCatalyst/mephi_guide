
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mephi_guide/data/menu/menu_bloc.dart';

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
  final MenuBloc _bloc = MenuBloc();

  Container _menu;

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
                child: StreamBuilder<List<MenuTile>>(
                  stream: _bloc.outData,
                  builder: (BuildContext context, AsyncSnapshot<List<MenuTile>> snapshot){

                    if(snapshot.hasData) {

                      return ListView.separated(
                        padding: EdgeInsets.zero,//const EdgeInsets.all(8),
                        itemCount: snapshot.data.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) =>
                          snapshot.data[index],
                        separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      );
                    }
                    else{
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
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

  factory MenuTile.fromMap(Map<String, dynamic> map)
  {
    return MenuTile(
        name: map['name'],
        icon: ImageIcon(
          AssetImage(map['icon']),
          color: Colors.white,
        ),
        page: map['page']
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 360,
        height: 55,
        child: InkWell(
          child: Stack(
            children: <Widget>[
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
          ),
          onTap: () => print(page),
        )
    );
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MenuTile{name: $name, icon: $icon, page: $page}';
  }


}




