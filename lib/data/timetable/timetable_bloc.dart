
import 'dart:async';

import 'package:mephi_guide/data/cached_http_data.dart';
import 'package:mephi_guide/data/database/db_provider.dart';
import 'package:mephi_guide/data/disposable.dart';
import 'package:mephi_guide/data/http_list_data.dart';
import 'package:mephi_guide/data/navigation/place.dart';
import 'package:mephi_guide/data/news/group.dart';
import 'package:mephi_guide/data/timetable/lesson.dart';
import 'package:mephi_guide/data/timetable/lesson_info.dart';
import 'package:mephi_guide/data/timetable/subject.dart';
import 'package:mephi_guide/data/timetable/teacher.dart';
import 'package:mephi_guide/timetable/timetable_item.dart';
import 'package:mephi_guide/timetable/weekday_title.dart';

class TimetableBloc implements Disposable{

  static const String placesPage = "getdots";
  static const String groupsPage = "getgroups";

  HttpListData<Group> groupsData;
  HttpListData<Lesson> lessonsData;
  HttpListData<Place> placesData;
  HttpListData<Subject> subjectsData;
  HttpListData<Teacher> teachersData;

  StreamController<List<TimetableItem>> _lessonsDataController = StreamController<List<TimetableItem>>();

  Sink<List<TimetableItem>> get _inData => _lessonsDataController.sink;
  Stream<List<TimetableItem>> get outData => _lessonsDataController.stream;

  TimetableBloc(){
    groupsData = new CachedHttpData('groups', (json) => Group.fromJson(json));
    placesData = new CachedHttpData('places', (json) => Place.fromJson(json));

    groupsData.loadData(groupsPage);
    placesData.loadData(placesPage);


    DBProvider.queryCurrentLessons().then(
            (value) {
              // IT IS NOT UNNECESSARY!!! IT DOESN'T WORK WITHOUT THIS CAST!              VVVVVVVVVVVVVVVV
              List<TimetableItem> lessons = value.map((json) => LessonData.fromJson(json) as TimetableItem)
                  .toList();

              String prevWeekDay = "";

              for(int i = 0; i < lessons.length; i++){

                if(lessons[i].weekday != prevWeekDay){
                  lessons.insert(i, WeekdayTitle(lessons[i].weekday));
                  prevWeekDay = lessons[i].weekday;
                }
              }

              _lessonsDataController.add(lessons);
            }
    );

  }

  @override
  void dispose() {

    groupsData.dispose();
    lessonsData.dispose();
    placesData.dispose();
    subjectsData.dispose();
    teachersData.dispose();

    _lessonsDataController.close();
  }

}