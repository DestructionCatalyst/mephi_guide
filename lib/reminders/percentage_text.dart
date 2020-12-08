
import 'package:flutter/material.dart';
import 'package:mephi_guide/data/reminders/reminders_bloc.dart';

class PercentageText extends StatefulWidget {

  final RemindersBloc bloc;

  const PercentageText({Key key, this.bloc}) : super(key: key);

  @override
  _PercentageTextState createState() => _PercentageTextState();
}

class _PercentageTextState extends State<PercentageText> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: widget.bloc.outPercentage,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot){
        if(snapshot.hasData) {
          //print(snapshot.data);
          return _buildText(snapshot.data);
        }
        else{
          return _buildText(0);
        }
      },

    );
  }

  Text _buildText(int percentage)
  {
    StringBuffer shiftedPercentage = new StringBuffer();
    int spaceCount = 3 - percentage.toString().length;

    for(int i = 0; i < spaceCount; i++){
      shiftedPercentage.write('  ');
    }

    shiftedPercentage.write(percentage);
    shiftedPercentage.write('%');

    return Text(shiftedPercentage.toString(), textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(76, 207, 211, 1),
        fontFamily: 'Roboto',
        fontSize: 50,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
    ),);
  }
}
