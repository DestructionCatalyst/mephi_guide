import 'package:flutter/material.dart';

import 'menu/floating_menu_button.dart';
import 'menu/menu.dart';
import 'menu/menu_controller.dart';

class MyPage extends StatefulWidget {

  final Widget content;

  const MyPage({Key key, this.content}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState(content);
}

class _MyPageState extends State<MyPage> {

  final Widget content;

  static final MenuController menuController = MenuController.getInstance();

  _MyPageState(this.content);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Stack(
          children: <Widget>[
            content,
            Menu(
              controller: menuController,
            ),
          ],
        )
        ),
        floatingActionButton: FloatingMenuButton(
          controller: menuController,
        )
    );
  }
}
