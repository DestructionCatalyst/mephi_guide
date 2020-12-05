
import 'package:flutter/material.dart';

class InteractiveSwitch extends StatefulWidget {

  final double width;
  final double height;

  //final double textRelativeTop;
  //final double textRelativeLeft;

  //final String textOnEnabled;
  //final String textOnDisabled;

  //final String fontFamily;
  //final double fontSize;
  //final FontWeight fontWeight;
  //final double textHeight;

  final Color activeColor;
  final Color activeTrackColor;
  final Color inactiveThumbColor;
  final Color inactiveTrackColor;

  //final Color textColor;

  final bool defaultValue;

  final Function(bool) onChanged;

  const InteractiveSwitch({
    Key key,
    this.width,
    this.height,
    //this.textRelativeTop,
    //this.textRelativeLeft,
    //this.textOnEnabled,
    //this.textOnDisabled,
    //this.fontFamily,
    //this.fontSize,
    //this.fontWeight,
    //this.textHeight,
    this.activeColor,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    //this.textColor,
    this.defaultValue,
    this.onChanged
  }) : super(key: key);

  @override
  _InteractiveSwitchState createState() => _InteractiveSwitchState(defaultValue);
}

class _InteractiveSwitchState extends State<InteractiveSwitch> {

  bool _checked;

  _InteractiveSwitchState(this._checked);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Switch(
      value: _checked,
      activeColor: widget.activeColor,
      activeTrackColor: widget.activeTrackColor,

      inactiveThumbColor: widget.inactiveThumbColor,
      inactiveTrackColor: widget.inactiveTrackColor,
      onChanged: (checked) =>
        setState(() {
          _checked = checked;
          widget.onChanged(checked);
        })
      ),
    );
  }
}
