import 'package:flutter/material.dart';
import 'package:mephi_guide/data/timetable/lesson_info.dart';
import 'package:mephi_guide/data/timetable/timetable_bloc.dart';
import 'package:mephi_guide/list_stream_builder.dart';
import 'package:mephi_guide/tab/tab.dart';
import 'package:mephi_guide/timetable/new_lesson_view.dart';
import 'package:mephi_guide/timetable/timetable_item.dart';
import 'package:mephi_guide/timetable/weekday_title.dart';

class TimetableTab extends StatefulWidget {
  final TimetableBloc bloc = TimetableBloc();

  @override
  _TimetableTabState createState() => _TimetableTabState();
}

class _TimetableTabState extends State<TimetableTab> {

  String prevWeekDay = "";

  @override
  Widget build(BuildContext context) {
    var tab = MyTab(
      name: "Расписание",
      titleTop: 148,
      children: [
        Positioned(
          top: 170,
            child: Container(
              width: 360,
              height: 470,
              child: MyStreamBuilder<TimetableItem>(
                stream: widget.bloc.outData,
                placeholder: Center(child: CircularProgressIndicator()),
                builder: (data) => ListView.separated(
                  padding: EdgeInsets.zero,//const EdgeInsets.all(8),
                  itemCount: data.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {

                    if (data[index] is WeekdayTitle)
                      return Text(
                          data[index].weekday,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Roboto',
                            fontSize: 22,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          )
                      );
                    else if(data[index] is LessonData)
                      return LessonView(data: data[index]);
                    else
                      throw Exception("Should never reach here");
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
                ),
              )


            )
        )

      ],
    );

    return tab;
  }



}
