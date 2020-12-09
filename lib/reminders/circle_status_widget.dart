import 'dart:math';

import 'package:flutter/material.dart';

class CircleStatusWidget extends StatelessWidget {

  final List<int> displayedValues;
  final List<Color> colors;

  final double width;
  final double height;

  const CircleStatusWidget({
    Key key,
    this.displayedValues, this.width, this.height, this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {//16, 96
    return Container(
        width: width,//157
        height: height,//157

        child: CustomPaint(
          painter: StatusCirclePainter.fromIntegers(
            displayedValues,
            width: width,
            height: height,
            colors: colors,
          )
        )
    );
  }
}

class StatusCirclePainter extends CustomPainter{

  List<double> _values;
  final List<Color> colors;

  final double width;
  final double height;

  StatusCirclePainter(this._values, {this.colors, this.width, this.height});

  StatusCirclePainter.fromIntegers(List<int> values, {this.colors, this.width, this.height}){
    this._values = values.map((e) => e.toDouble()).toList();
  }

  List<double> get values => _values;

  double get sum => _values.reduce((value, element) => value + element);

  double get coefficient  => -2 * pi / sum;

  @override
  void paint(Canvas canvas, Size size) {
    assert(_values.length == colors.length);

    print(_values);

    double cumsum = 0;

    for(int i = 0; i < _values.length; i++){
      double alpha = _values[i] * coefficient;

      Path path = Path();
      path.addArc(new Rect.fromLTWH(0, 0, width, height), cumsum, alpha);

      cumsum += alpha;

      Paint paint = Paint();
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 5;
      paint.color = colors[i];

      canvas.drawPath(path, paint);

    }

    /*Path p = Path();

    double alphaC = completed * coefficient;
    double alphaI = incomplete * coefficient;
    double alphaM = missed * coefficient;

    Paint paint1 = Paint();
    paint1.color = new Color.fromRGBO(76, 207, 211, 1);
    Paint paint2 = Paint();
    paint2.color = new Color.fromRGBO(245, 135, 60, 1);
    Paint paint3 = Paint();
    paint3.color = new Color.fromRGBO(242, 66, 106, 1);

    p.arcTo(new Rect.fromLTWH(0, 0, 107, 107), 0, alphaC, true);

    canvas.drawPath(, p1);
    p.arcTo(new Rect.fromLTWH(0, 0, 107, 107), alphaC, alphaI, true);
    p.arcTo(new Rect.fromLTWH(0, 0, 107, 107), alphaC + alphaI, alphaM, true);

    canvas.drawPath(p, );*/
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => this != oldDelegate;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is StatusCirclePainter && runtimeType == other.runtimeType &&
              _values == other._values;

  @override
  int get hashCode => _values.hashCode;


}
