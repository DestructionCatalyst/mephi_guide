import 'package:flutter/material.dart';

import 'group_manager.dart';
import 'colored.dart';



class RoundedToggleButton extends StatefulWidget implements Colored{

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

  final bool defaultPressed;

  final Function onTap;
  final GroupManager buttonGroup;

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
    this.defaultPressed = false,
    this.onTap,
    this.buttonGroup,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RoundedToggleButtonState(defaultPressed);


}

class _RoundedToggleButtonState extends State<RoundedToggleButton> {
  bool _pressed = false;

  int idInGroup = 0;

  _RoundedToggleButtonState(this._pressed);

  @override
  Widget build(BuildContext context) {

    idInGroup = widget?.buttonGroup?.register(
            () {
          setState(
                  () => _pressed = false
          );
          //print("Button pressed resetted");
        }
    );

    return Ink(
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          child: Ink(
              width: widget.width,
              height: widget.height,
              child: Stack(
                  children: <Widget>[
                    _buildContainer(),
                    _buildPositioned()
                  ]
              )
          ),
          onTap: (){
            widget?.buttonGroup?.onActionPerformed(idInGroup);
            setState(() {
              _pressed = true;
              widget.onTap();
            });
          },
        ),
      ),
    );
  }

  Positioned _buildPositioned() {
    return Positioned.fill(
                child: Align(
                    alignment: Alignment.center,
                    child: Text(widget.text, textAlign: TextAlign.left, style: TextStyle(
                        color: _pressed ? widget.enabledTextColor : widget.disabledTextColor,
                        fontFamily: widget.fontFamily,
                        fontSize: widget.fontSize,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: widget.fontWeight,
                        height: widget.textHeight
                    ),)
                ),
              );
  }

  Ink _buildContainer()
  {
    if(_pressed){
      return Ink(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius : BorderRadius.only(
              topLeft: Radius.circular(widget.cornerRadius),
              topRight: Radius.circular(widget.cornerRadius),
              bottomLeft: Radius.circular(widget.cornerRadius),
              bottomRight: Radius.circular(widget.cornerRadius),
            ),
            color : widget.enabledColor,
          )
      );
    }
    else{
      return Ink(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius : BorderRadius.only(
              topLeft: Radius.circular(widget.cornerRadius),
              topRight: Radius.circular(widget.cornerRadius),
              bottomLeft: Radius.circular(widget.cornerRadius),
              bottomRight: Radius.circular(widget.cornerRadius),
            ),
            border : Border.all(
              color: widget.disabledBorderColor,
              width: 1,
            ),
          )
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

}