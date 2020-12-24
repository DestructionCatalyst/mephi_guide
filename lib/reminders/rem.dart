import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mephi_guide/circle_button.dart';
import 'package:mephi_guide/data/reminders/reminders_bloc.dart';
import 'package:mephi_guide/data/reminders/reminders_events.dart';
import 'package:mephi_guide/reminders/percentage_text.dart';
import 'package:mephi_guide/reminders/reminders_list.dart';

import '../group_manager.dart';
import '../rounded_button.dart';
import 'circle_status_widget.dart';

class RemindersTab extends StatefulWidget {
  @override
  _RemindersTabState createState() => _RemindersTabState();
}

class _RemindersTabState extends State<RemindersTab> {

  final GroupManager reminderButtonsGroup = new GroupManager();
  final RemindersBloc bloc = new RemindersBloc();

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
              buildWigglyRectangle(),
              buildFancyLines(),

              buildMephiTitle(),
              buildGearButton(),
              buildPenButton(),

              buildCircleStatusWidget(),
              buildBell(),

              buildPercentageText(),
              buildCompletedText(),

              buildTabTitle(),
              buildLineAndDotNearTitle(),
              buildAnotherDotNearTitle(),

              buildButtons(),

              buildList(),
            ]
        )
    );
  }


  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  Positioned buildLineAndDotNearTitle() {
    return Positioned(
        top: 240,
        left: 123,
        child: Container(
            width: 43,
            height: 4,

            child: Stack(
                children: <Widget>[
                  Positioned(
                      top: 0.666656494140625,
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
                ]
            )
        )
    );
  }

  Positioned buildButtons() {
    return Positioned(
        top: 0,
        left: -0.5,
        child: Container(
            width: 361,
            height: 640,

            child: Stack(
                children: <Widget>[
                  //Buttons
                  Positioned(
                      top: 277,
                      left: 16.5,
                      child: Container(
                          width: 328,
                          height: 38,

                          child: Stack(
                              children: <Widget>[
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: RoundedToggleButton(
                                    width: 101,
                                    height: 38,
                                    text: "Все",
                                    defaultPressed: true,
                                    onTap: () => bloc.inEvent.add(DisplayModeCheckedChanged(false)),
                                    buttonGroup: reminderButtonsGroup,
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 115,
                                  child: RoundedToggleButton(
                                    width: 213,
                                    height: 38,
                                    text: "Невыполненные",
                                    defaultPressed: false,
                                    onTap: () => bloc.inEvent.add(DisplayModeCheckedChanged(true)),
                                    buttonGroup: reminderButtonsGroup,
                                  ),
                                ),
                              ]
                          )
                      )
                  ),
                  //There was smth with rectanglepath
                ]
            )
        )
    );
  }

  Positioned buildAnotherDotNearTitle() {
    return Positioned(
        top: 240,
        left: 183,
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
    );
  }

  Positioned buildTabTitle() {
    return Positioned(
        top: 228,
        left: 16,
        child: Text('Памятка', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(46, 31, 112, 1),
            fontFamily: 'Roboto',
            fontSize: 20,
            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.bold,
            height: 1
        ),)
    );
  }

  Positioned buildCircleStatusWidget() {
    return Positioned(
      top: 96,//70,
      left: 16,//0,
      child: StreamBuilder<List<int>>(
        stream: bloc.outAmounts,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return CircleStatusWidget(
              width: 107,
              height: 107,
              displayedValues: snapshot.data,
              colors: [
                Color.fromRGBO(76, 207, 211, 1),
                Color.fromRGBO(245, 135, 60, 1),
                Color.fromRGBO(242, 66, 106, 1),
              ],
            );
          }
          else{
            return CircleStatusWidget(
              width: 107,
              height: 107,
              displayedValues: [1],
              colors: [
                Color.fromRGBO(76, 207, 211, 1),
              ]
            );
          }
        }
      ),
    );
  }

  Positioned buildList() {
    return Positioned(
        top: 331,
        left: 0,

        child: Container(
          width: 360,
          height: 309,
          child: RemindersList(bloc: bloc),
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
              color : Color.fromRGBO(255, 255, 255, 1),
            )
        )
    );
  }

  Positioned buildWigglyRectangle() {
    return Positioned(
        top: 0,
        left: 0,
        child: SvgPicture.asset(
            'assets/images/Placeholder.svg',
            semanticsLabel: 'Placeholder'
        )
    );
  }

  Positioned buildGearButton() {
    return Positioned(
        top: 34,
        left: 310,

        child: CircleButton(
          diameter: 40,
          color: Color.fromRGBO(255, 255, 255, 0.3),

          icon: SvgPicture.asset(
              'assets/images/vector.svg',
              semanticsLabel: 'vector'
          ),
          iconTop: 12,
          iconLeft: 12,
        )
    );
  }

  Positioned buildPenButton() {
    return Positioned(
      top: 34,
      left: 254,

      child: CircleButton(
        diameter: 40,
        color: Color.fromRGBO(76, 207, 211, 1),

        icon: SvgPicture.asset(
            'assets/images/vector_pen.svg',
            semanticsLabel: 'vector_pen'
        ),
        iconTop: 12,
        iconLeft: 12,
        onTap: ()=>print("Tapped!"),
      ),

    );
  }

  Positioned buildCompletedText() {
    return Positioned(
        top: 149,
        left: 254,
        child: Text(' выполнено', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(185, 192, 202, 1),
            fontFamily: 'Roboto',
            fontSize: 14,//12
            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.normal,
            height: 1
        ),
        )
    );
  }

  Positioned buildPercentageText() {
    return Positioned(
        top: 142,
        right: 106,//161
        child: PercentageText(bloc: bloc,)
    );
  }

  Positioned buildFancyLines() {
    return Positioned(
        top: -7,
        left: 44,
        child: SvgPicture.asset(
            'assets/images/vector1.svg',
            semanticsLabel: 'vector1'
        )
      //Circles
    );
  }

  Positioned buildBell() {
    return Positioned(
        top: 130,
        left: 49,
        child: Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color : Color.fromRGBO(255, 255, 255, 1),
            ),
            child: Stack(
                children: <Widget>[
                  Positioned(
                      top: 0,
                      left: 0,
                      child: SvgPicture.asset(
                          'assets/images/Notification.svg',
                          semanticsLabel: 'Notification'
                      )
                  ),
                ]
            )
        )
    );
  }

  Positioned buildMephiTitle() {
    return Positioned(
        top: 32,
        left: 16,
        child: Text('MEPhI', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontFamily: 'Roboto',
            fontSize: 35,
            letterSpacing: -1,
            fontWeight: FontWeight.normal,
            height: 1.3714285714285714
        ),)
    );
  }
}
