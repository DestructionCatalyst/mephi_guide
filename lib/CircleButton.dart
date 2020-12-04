import 'package:flutter/material.dart';

import 'Colored.dart';

class CircleButton extends StatefulWidget implements Colored{

  final double diameter;
  final double iconTop;
  final double iconLeft;

  final Color color;
  final Widget icon;

  final Function onTap;

  const CircleButton({Key key, this.diameter, this.color, this.onTap, this.icon, this.iconTop, this.iconLeft}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CircleButtonState();

}

class _CircleButtonState extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return Ink(
        width: widget.diameter,
        height: widget.diameter,

        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            child: Stack(
            children: <Widget>[
              Positioned(
                  top: 0,
                  left: 0,
                  child: Ink(
                      width: widget.diameter,
                      height: widget.diameter,
                      decoration: BoxDecoration(
                        color : widget.color,
                        borderRadius : BorderRadius.all(Radius.elliptical(widget.diameter, widget.diameter)),
                      )
                  )
              ),
              Positioned(
                  top: widget.iconTop,
                  left: widget.iconLeft,
                  child: widget.icon
              ),
              ]
            ),
            onTap: () => widget.onTap(),
          ),
        )
    );
  }
  
}