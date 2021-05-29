import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {


  final String text;

  final TextAlign align;

  final double fontSize;

  final FontWeight fontWeight;

  const MyText({Key key, this.text, this.align = TextAlign.left, this.fontSize = 14, this.fontWeight = FontWeight.normal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        key: key,
        textAlign: align,
        style: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontFamily: 'Roboto',
          fontSize: fontSize,
          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
          fontWeight: fontWeight,
          height: 1,
        )
    );
  }
}
