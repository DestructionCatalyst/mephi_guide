
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mephi_guide/data/menu/menu_bloc.dart';
import 'package:mephi_guide/news/news.dart';
import 'package:mephi_guide/page.dart';
import 'package:mephi_guide/phonebook/phonebook.dart';
import 'package:mephi_guide/reminders/rem.dart';

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
                          GestureDetector(
                            child: snapshot.data[index],
                            onTap: () {
                              print("pressed on menu item");
                              },
                          ),
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

  static final Map<String, _MenuAction> menuActionMap =
  {
    "news" : _NavigateMenuAction((context) => MyPage(content: NewsTab())),
    "reminders" : _NavigateMenuAction((context) => MyPage(content: RemindersTab())),
    "navigation" : _NavigateMenuAction((context) => MyPage(content: Container())),
    "qrcode" : _DialogMenuAction(),
    "phonebook" : _NavigateMenuAction((context) => MyPage(content: PhoneBookTab())),
    "about" : _DialogMenuAction(
      title: "О приложении",
      text: "Приложение «Путеводитель по НИЯУ МИФИ»\n" +
          "Версия " + "1.0" + "\n\n"+
          "©\n" +
          "Национальный исследовательский ядерный университет «МИФИ»,\n" +
          "Институт Интеллектуальных Кибернетических Систем (ИИКС)\n" +
          "Кафедра №22 «Кибернетика»\n" +
          "Разработано в рамках курса «Проектная практика»\n" +
          "Руководитель проекта: Немешаев Сергей\n" +
          "Куратор проекта: Дадтеев Казбек\n" +
          "Дизайнер: Петрова Мария\n" +
          "Разработчик: Комза Владислав\n"
    )
  };

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
          onTap: () {
            MenuController.getInstance().showOrHide();
            menuActionMap[page].perform(context);
          }
        )
    );
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MenuTile{name: $name, icon: $icon, page: $page}';
  }

}

abstract class _MenuAction{

  void perform(BuildContext context);
}

class _NavigateMenuAction extends _MenuAction{

  final Function builder;

  _NavigateMenuAction(this.builder);

  @override
  void perform(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: builder));
  }

}

class _DialogMenuAction extends _MenuAction{

  final String title;
  final String text;

  _DialogMenuAction({this.title, this.text});

  @override
  void perform(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(text),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}




