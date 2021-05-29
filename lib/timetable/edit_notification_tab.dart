import 'package:flutter/material.dart';
import 'package:mephi_guide/data/timetable/lesson_info.dart';
import 'package:mephi_guide/data/timetable/notification.dart';
import 'package:mephi_guide/data/timetable/notification_edit_bloc.dart';
import 'package:mephi_guide/my_text.dart';

class EditNotificationTab extends StatefulWidget {

  final MyNotification notification;
  final LessonData lesson;

  const EditNotificationTab({Key key, this.notification, @required this.lesson}) : super(key: key);

  @override
  _EditNotificationTabState createState() => _EditNotificationTabState();
}

class _EditNotificationTabState extends State<EditNotificationTab> {

  final NotificationEditBloc bloc = NotificationEditBloc();

  TextEditingController nameController;
  TextEditingController noteController;
  TextEditingController hoursController;
  TextEditingController minutesController;


  @override
  Widget build(BuildContext context) {

    initControllers();


    return Scaffold(
      appBar: AppBar(
        title: Text('Заметка'),
        foregroundColor: Colors.deepPurple,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        width: 360,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: MyText(text: "Название: ", fontSize: 20,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: Container(
                      width: 250,
                      child: TextField(
                        controller: nameController
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(3.0, 8.0, 3.0, 0.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(text: "Описание:", fontSize: 20,)
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: TextField(
                  controller: noteController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyText(text: "Напомнить за: ", fontSize: 20,),
                    Container(
                      width: 50,
                      child: TextField(
                        controller: hoursController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: MyText(text: "ч ", fontSize: 20,),
                    ),
                    Container(
                      width: 50,
                      child: TextField(
                        controller: minutesController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: MyText(text: "м", fontSize: 20,),
                    ),
                  ],
                )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 360.0 - 2 * 8.0,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      print("Saving notification");
                      saveNotification();
                      Navigator.of(context).pop();
                    },
                    child: MyText(text: "Сохранить"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),

    );
  }

  void initControllers() {
     nameController = TextEditingController.fromValue(
        TextEditingValue(
          text: widget?.notification?.name ?? "",
          selection: TextSelection.collapsed(
            offset: (widget?.notification?.name ?? "").length,
          ),
        )
    );
    noteController = TextEditingController.fromValue(
        TextEditingValue(
          text: widget?.notification?.note ?? "",
          selection: TextSelection.collapsed(
            offset: (widget?.notification?.note ?? "").length,
          ),
        )
    );
    hoursController = TextEditingController.fromValue(
        TextEditingValue(
          text: "${_hoursBefore(true) ?? ''}",
          selection: TextSelection.collapsed(
            offset: ("${_hoursBefore(true) ?? ''}").length,
          ),
        )
    );
    minutesController = TextEditingController.fromValue(
        TextEditingValue(
          text: "${_minutesBefore(true) ?? ''}",
          selection: TextSelection.collapsed(
            offset: ("${_minutesBefore(true) ?? ''}").length,
          ),
        )
    );
  }

  void saveNotification(){

    MyNotification newNotification = MyNotification(
      id: widget?.notification?.id ?? 0,
      idLesson: widget.lesson.id,
      name: nameController.text,
      note: noteController.text,
      notificationTime: widget.lesson.startTime.add(
          Duration(
              hours: - int.parse(hoursController.text),
              minutes: - int.parse(minutesController.text)
          )
      )
    );

    print("Adding event $newNotification");
    bloc.inEvent.add(NotificationEditedEvent(newNotification));

  }

  TextField dataTextField({Key key, String initText, String whereToSave,
    TextInputType keyboardType = TextInputType.text, int maxLines = 1}){
    return TextField(
      key: key,
      controller: TextEditingController.fromValue(
          TextEditingValue(
            text: initText ?? "",
            selection: TextSelection.collapsed(
              offset: (initText ?? "").length,
            ),
          )
      ),
      keyboardType: keyboardType,
      maxLines: maxLines,
      onChanged: (text) => whereToSave = text,
    );
  }

  int _hoursBefore(bool start){

    DateTime lessonTime;

    if(start)
      lessonTime = widget?.lesson?.startTime;
    else
      lessonTime = widget?.lesson?.endTime;

    int hours = widget?.notification?.notificationTime?.difference(lessonTime)?.inHours;

    if (hours != null)
      return - hours;
    else
      return hours;
  }

  int _minutesBefore(bool start){

    DateTime lessonTime;

    if(start)
      lessonTime = widget?.lesson?.startTime;
    else
      lessonTime = widget?.lesson?.endTime;

    int minutes =  widget?.notification?.notificationTime?.difference(lessonTime)?.inMinutes?.remainder(60);

    if (minutes != null)
      return - minutes;
    else
      return minutes;
  }
}
