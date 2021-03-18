import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class TabHeader extends StatelessWidget {

  final String wigglyRectangleAsset;
  final String fancyLinesAsset;
  final double mephiTop;
  final double mephiLeft;
  final double mephiFontSize;

  const TabHeader({
    Key key,
    this.wigglyRectangleAsset = 'assets/images/Placeholder.svg',
    this.fancyLinesAsset = 'assets/images/vector1.svg',
    this.mephiTop = 32,
    this.mephiLeft = 16,
    this.mephiFontSize = 35,
  }) : super(key: key);

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

              buildWigglyRectangle(),
              buildFancyLines(),
              buildMephiTitle(),

            ]
        )
    );
  }

  Positioned buildWigglyRectangle() {
    return Positioned(
        top: 0,
        left: 0,
        child: SvgPicture.asset(
            wigglyRectangleAsset,
            semanticsLabel: 'Placeholder'
        )
    );
  }

  Positioned buildFancyLines() {
    return Positioned(
        top: -7,
        left: 44,
        child: SvgPicture.asset(
            fancyLinesAsset,
            semanticsLabel: 'vector1'
        )
    );
  }

  Positioned buildMephiTitle() {
    return Positioned(
        top: mephiTop,
        left: mephiLeft,
        child: Text('MEPhI', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontFamily: 'Roboto',
            fontSize: mephiFontSize,
            letterSpacing: -1,
            fontWeight: FontWeight.normal,
            height: 1.3714285714285714
        ),)
    );
  }
}
