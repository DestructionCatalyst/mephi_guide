import 'package:flutter/material.dart';

import 'menu.dart';

class FloatingMenuButton extends StatefulWidget {

  final MenuController controller;

  const FloatingMenuButton({Key key, this.controller}) : super(key: key);

  @override
  _FloatingMenuButtonState createState() => _FloatingMenuButtonState(controller);
}

class _FloatingMenuButtonState extends State<FloatingMenuButton> {

  static const openMenuIcon = ImageIcon(
    AssetImage('assets/images/icons/align-right-1.png')
  );
  static const closeMenuIcon = ImageIcon(
      AssetImage('assets/images/icons/close.png')
  );

  final MenuController controller;

  _FloatingMenuButtonState(this.controller){
    controller.addCallback(() => setState(() => {}));
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => controller.showOrHide(),
      tooltip: 'Navigation',
      child: controller.shown ? closeMenuIcon : openMenuIcon
    );
  }
}
