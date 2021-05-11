
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
import 'package:mephi_guide/data/list_json_convert.dart';

class TimetableBloc implements Disposable{

  HttpListData<Group> groupsData;
  HttpListData<Lesson> lessonsData;
  HttpListData<Place> placesData;
  HttpListData<Subject> subjectsData;
  HttpListData<Teacher> teachersData;

  StreamController<List<LessonData>> _lessonsDataController = StreamController<List<LessonData>>();

  Sink<List<LessonData>> get _inData => _lessonsDataController.sink;
  Stream<List<LessonData>> get outData => _lessonsDataController.stream;

  TimetableBloc(){
    groupsData = new CachedHttpData('groups', (json) => Group.fromJson(json));


    DBProvider.queryCurrentLessons().then(
            (value) =>_lessonsDataController.add(
              value.map((json) => LessonData.fromJson(json)).toList()
            )
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