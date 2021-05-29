import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mephi_guide/data/timetable/lesson_info.dart';
import 'package:mephi_guide/timetable/lesson_notifications_tab.dart';

class LessonView extends StatelessWidget {

  static final Map<int, Color> lessonColors = {
    0: Color.fromRGBO(136, 14, 79, 1.0), // Семинар
    1: Color.fromRGBO(0, 77, 64, 1.0),   // Лекция
    2: Color.fromRGBO(13, 71, 161, 1.0), // Лабораторная

    3: Color.fromRGBO(27, 120, 32, 1.0),  // Аттестация
    4: Color.fromRGBO(49, 27, 146, 1.0), // Зачет
    5: Color.fromRGBO(183, 28, 28, 1.0), // Экзамен

  };

  static final Map<int, String> lessonTypes = {
    0: "СЕМ",
    1: "ЛЕК",
    2: "ЛАБ",

    3: "АТТ",
    4: "ЗАЧ",
    5: "ЭКЗ",

  };

  final LessonData data;

  const LessonView({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0),
        child: Container(
          width: 360,
          child: Row(
            children: [
              buildTime(),
              buildTextData()
            ],
          ),
        ),
      ),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LessonNotificationsTab(lessonData: data))),
    );
  }

  Container buildTextData() {
    return Container(
            width: 310,

            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  myText("${data.subjectName} [${lessonTypes[data.type]}]"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      myText(data.places, fontSize: 14),
                      myText(data.groups, align: TextAlign.end, fontSize: 14),
                    ],
                  ),
                  myText(data.teachers, fontSize: 14),
                ],
              ),
            ),
          );
  }

  Text myText(String text, {TextAlign align = TextAlign.start, double fontSize = 16})
  {
    return Text(
        text,
        textAlign: align,
        style: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontFamily: 'Roboto',
          fontSize: fontSize,
          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
          fontWeight: FontWeight.normal,
          height: 1,
        )
    );
  }

  Container buildTime() {
    return Container(
        width: 50,
        height: 50,

        decoration: BoxDecoration(
          color: lessonColors[data.type],
        ),

        child: Column(
            children:[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                    DateFormat.Hm().format(data.startTime),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(250, 250, 250, 1),
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                    DateFormat.Hm().format(data.endTime),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(250, 250, 250, 1),
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    )
                ),
              ),
            ]
        )
    );
  }
}
