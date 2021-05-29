import 'package:flutter/material.dart';
import 'package:mephi_guide/data/parse_date.dart';
import 'package:mephi_guide/data/timetable/lesson_info.dart';
import 'package:mephi_guide/data/timetable/notifications_bloc.dart';
import 'package:mephi_guide/list_stream_builder.dart';
import 'package:mephi_guide/my_text.dart';
import 'package:intl/intl.dart';
import 'package:mephi_guide/timetable/edit_notification_tab.dart';
import 'package:mephi_guide/timetable/notification_view.dart';

class LessonNotificationsTab extends StatefulWidget {

  final LessonData lessonData;

  const LessonNotificationsTab({Key key, this.lessonData}) : super(key: key);

  @override
  _LessonNotificationsTabState createState() => _LessonNotificationsTabState(lessonData);

}

class _LessonNotificationsTabState extends State<LessonNotificationsTab> {

  NotificationsBloc bloc;


  _LessonNotificationsTabState(LessonData data)
  {
    bloc = NotificationsBloc(data.id);
  }

  static final Map<int, String> lessonTypes = {
    0: "Семинар",
    1: "Лекция",
    2: "Лабораторная работа",

    3: "Аттестация",
    4: "Зачет",
    5: "Экзамен",

  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Занятие'),
        foregroundColor: Colors.deepPurple,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(text: widget.lessonData.subjectName, fontSize: 16, fontWeight: FontWeight.bold),
            MyText(text: lessonTypes[widget.lessonData.type]),
            MyText(text: "Дата: ${dMy().format(widget.lessonData.startTime)}"),
            MyText(text: "Время: ${DateFormat.Hm().format(widget.lessonData.startTime)}"
                " - ${DateFormat.Hm().format(widget.lessonData.endTime)}"),
            MyText(text: "Преподаватели: ${widget.lessonData.teachers}"),
            MyText(text: "Группы: ${widget.lessonData.groups}"),
            MyText(text: "Место проведения: ${widget.lessonData.places}"),
            Divider(),
            MyStreamBuilder(
              stream: bloc.outData,
              placeholder: Center(child: CircularProgressIndicator()),
              builder: (data) => ListView.separated(
                padding: EdgeInsets.zero,//const EdgeInsets.all(8),
                itemCount: data.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) =>
                  InkWell(
                    child: NotificationView(notification: data[index]),
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                        builder: (context) => EditNotificationTab(
                          notification: data[index],
                          lesson: widget.lessonData,
                        )
                    )),
                  ),
                separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) => EditNotificationTab(
              lesson: widget.lessonData,
            )
        )),

      )
    );
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }
}
