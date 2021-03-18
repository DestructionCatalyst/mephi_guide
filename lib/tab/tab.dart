import 'package:flutter/material.dart';
import 'package:mephi_guide/tab/tab_header.dart';


class MyTab extends StatelessWidget {

  final String name;
  final List<Widget> children;

  final TabHeader header;

  final double titleTop;

  const MyTab({Key key, this.name, this.children, this.header = const TabHeader(), this.titleTop = 228}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 360,
        height: 640,
        decoration: BoxDecoration(
          color : Color.fromRGBO(250, 250, 250, 1),
        ),
        child: Stack(
            children: <Widget>[
              buildWhiteFilling(),
              header,

              buildTabTitle(),
              buildLineAndDotNearTitle(),
              //buildAnotherDotNearTitle(),

              Positioned(
                  child: Stack(
                      children: children,
                  ),
              ),

            ]
        )
    );
  }

  Positioned buildWhiteFilling() {
    return Positioned(
        top: -7,
        left: -8,
        child: Container(
            width: 373,
            height: 228,
            decoration: BoxDecoration(
              color : Color.fromRGBO(250, 250, 250, 1),
            )
        )
    );
  }

  Positioned buildTabTitle() {
    return Positioned(
        top: titleTop,
        left: 16,
        child: Text(name, textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(46, 31, 112, 1),
            fontFamily: 'Roboto',
            fontSize: 20,
            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.bold,
            height: 1
        ),)
    );
  }

  Positioned buildLineAndDotNearTitle() {
    return Positioned(
        top: titleTop + 10,
        left: (20 + 25 + 10 * name.length).toDouble(),
        child: Container(
            width: 65,
            height: 4,

            child: Stack(
                children: <Widget>[
                  Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                          width: 25,
                          height: 2.666656494140625,
                          decoration: BoxDecoration(
                            borderRadius : BorderRadius.only(
                              topLeft: Radius.circular(3),
                              topRight: Radius.circular(3),
                              bottomLeft: Radius.circular(3),
                              bottomRight: Radius.circular(3),
                            ),
                            color : Color.fromRGBO(76, 207, 211, 1),
                          )
                      )
                  ),Positioned(
                      top: 0,
                      left: 39,
                      child: Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            borderRadius : BorderRadius.only(
                              topLeft: Radius.circular(3),
                              topRight: Radius.circular(3),
                              bottomLeft: Radius.circular(3),
                              bottomRight: Radius.circular(3),
                            ),
                            color : Color.fromRGBO(185, 191, 202, 1),
                          )
                      )
                  ),
                  Positioned(
                      top: 0,
                      left: 60,
                      child: Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            borderRadius : BorderRadius.only(
                              topLeft: Radius.circular(3),
                              topRight: Radius.circular(3),
                              bottomLeft: Radius.circular(3),
                              bottomRight: Radius.circular(3),
                            ),
                            color : Color.fromRGBO(185, 191, 202, 1),
                          )
                      )
                  ),
                ]
            )
        )
    );
  }

}
