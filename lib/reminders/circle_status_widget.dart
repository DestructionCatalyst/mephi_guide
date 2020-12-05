import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircleStatusWidget extends StatelessWidget {
  const CircleStatusWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 157,
        height: 157,

        child: Stack(
            children: <Widget>[
              Positioned(
                  top: 0,
                  left: 0,
                  child:  SvgPicture.asset(
                      'assets/images/circles.svg',
                      semanticsLabel: 'circles'
                  )
              ),
            ]
        )
    );
  }
}

