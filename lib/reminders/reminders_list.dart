import 'package:flutter/material.dart';
import 'package:mephi_guide/data/reminders/reminder.dart';
import 'package:mephi_guide/data/reminders/reminders_bloc.dart';
import 'package:mephi_guide/data/reminders/reminders_events.dart';
import 'package:mephi_guide/reminders/interactive_switch.dart';

class RemindersList extends StatefulWidget {

  final RemindersBloc bloc;

  RemindersList({Key key, this.bloc}) : super(key: key);

  @override
  _RemindersListState createState() => _RemindersListState();
}

class _RemindersListState extends State<RemindersList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Reminder>>(
      stream: remindersStream,
      builder: (BuildContext context, AsyncSnapshot<List<Reminder>> snapshot){
        if(snapshot.hasData) {
          //print(snapshot.data);
          return ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: snapshot.data.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              Reminder reminder = snapshot.data[index];
              return ReminderListTile(reminder: reminder, bloc: widget.bloc,);
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
          );
        }
        else{
          return Center(child: CircularProgressIndicator());
        }
      },

    );
  }

  Stream<List<Reminder>> get remindersStream => widget.bloc.outData;
}

class ReminderListTile extends StatelessWidget {

  final Reminder reminder;
  final RemindersBloc bloc;

  const ReminderListTile({Key key, this.reminder, this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 159,

      decoration: BoxDecoration(
        borderRadius : BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        color : Color.fromRGBO(250, 250, 250, 1),
      ),

      child: Stack(
          children: <Widget>[

            buildLineNearStatus(),
            buildStatus(),
            buildName(),
            buildShortenedText(),
            buildTimeSpan(),
            buildTextStatus(),
            buildSwitch()
          ]
      )
    );
  }

  Positioned buildSwitch() {
    return Positioned(
      top: 23.63501739501953,
      left: 282.54730224609375,

      child: InteractiveSwitch(
          width: 60,
          height: 26,

          activeColor: Color.fromRGBO(76, 207, 211, 1),
          activeTrackColor: Color.fromRGBO(185, 192, 202, 0.2),

          inactiveThumbColor: Color.fromRGBO(245, 135, 60, 1),
          inactiveTrackColor: Color.fromRGBO(185, 192, 202, 0.2),

          defaultValue: reminder.checked,
          onChanged: (checked){
            bloc.inEvent.add(ReminderCheckedChanged(reminder, checked));
          },
        ),
    );
  }

  Positioned buildTextStatus() {
    return Positioned(
              top: 50,
              left: 260,
              child: Text(reminder.checked ? '>/ выполнено' : '>/ выполнить', textAlign: TextAlign.left, style: TextStyle(
                  color: Color.fromRGBO(185, 192, 202, 1),
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1
              ),)
          );
  }

  Positioned buildTimeSpan() {
    return Positioned(
              top: 17.189189910888672,
              left: 17.189189910888672,
              child: Container(
                  width: 162.2229766845703,
                  height: 38.67567443847656,

                  child: Stack(
                      children: <Widget>[
                        Positioned(
                            top: 0,
                            left: 0,
                            child: Text(reminder.span, textAlign: TextAlign.left, style: TextStyle(
                                color: Color.fromRGBO(185, 192, 202, 1),
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.bold,
                                height: 1
                            ),)
                        ),
                      ]
                  )
              )
          );
  }

  Positioned buildShortenedText() {
    return Positioned(
              top: 98.83783721923828,
              left: 17.189189910888672,
              child: Container(
                width: 330,

                child: Text(
                  reminder.text,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(185, 192, 202, 1),
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1,
                ),
                  softWrap: false,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
          );
  }

  Positioned buildName() {
    return Positioned(
              top: 64.45945739746094,
              left: 17.189189910888672,
              child: Container(
                width: 360,
                child: Text(reminder.name, textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(62, 39, 148, 1),
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.bold,
                    height: 1.7142857142857142
                ),
                  //softWrap: false,
                  //maxLines: 1,
                  //overflow: TextOverflow.ellipsis,
                ),
              )
          );
  }

  Positioned buildStatus() {
    Color statusColor;

    if(reminder.checked)
      statusColor = Color.fromRGBO(76, 207, 211, 1);
    else
      statusColor = Color.fromRGBO(235, 145, 60, 1);
    //Color.fromRGBO(242, 66, 106, 1) red

    return Positioned(
              top: 133.21630859375,
              left: 17.189208984375,
              child: Container(
                  width: 47.27027130126953,
                  height: 8.594594955444336,

                  child: Stack(
                      children: <Widget>[
                        Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                                width: 47.27027130126953,
                                height: 8.594594955444336,
                                decoration: BoxDecoration(
                                  borderRadius : BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  color : statusColor,
                                )
                            )
                        ),
                      ]
                  )
              )
          );
  }

  Positioned buildLineNearStatus() {
    return Positioned(
              top: 136,
              left: 64,
              child: Container(
                  width: 150,
                  height: 4,

                  child: Stack(
                      children: <Widget>[
                        Positioned(
                            top: 1,
                            left: 0,
                            child: Container(
                                width: 111,
                                height: 2,
                                decoration: BoxDecoration(
                                  borderRadius : BorderRadius.only(
                                    topLeft: Radius.circular(3),
                                    topRight: Radius.circular(3),
                                    bottomLeft: Radius.circular(3),
                                    bottomRight: Radius.circular(3),
                                  ),
                                  color : Color.fromRGBO(185, 192, 202, 1),
                                )
                            )
                        ),Positioned(
                            top: 0,
                            left: 125,
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
                        ),Positioned(
                            top: 0,
                            left: 146,
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
