import 'package:flutter/material.dart';

import '../Colored.dart';
import '../GroupManager.dart';

class RoundedToggleButton extends StatelessWidget implements Colored{

  final String text;
  final double width;
  final double height;
  final double cornerRadius;

  final Color enabledColor;
  final Color enabledTextColor;
  final Color disabledBorderColor;
  final Color disabledTextColor;

  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final double textHeight;

  final Function onTap;

  final GroupManager buttonGroup;
  final int idInGroup;

  bool pressed;

  RoundedToggleButton({
    Key key,
    this.width,
    this.height,
    this.text,
    this.cornerRadius = 30,
    this.enabledColor = Colored.blue,
    this.enabledTextColor = Colored.white,
    this.disabledBorderColor = Colored.purple,
    this.disabledTextColor = Colored.purple,
    this.fontFamily = 'Roboto',
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.textHeight = 1.7142857142857142,
    this.pressed = false,
    this.onTap,
    this.buttonGroup, this.idInGroup,
  }) ;



  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
