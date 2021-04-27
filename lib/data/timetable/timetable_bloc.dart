
import 'package:mephi_guide/data/disposable.dart';
import 'package:mephi_guide/data/http_list_data.dart';
import 'package:mephi_guide/data/navigation/place.dart';
import 'package:mephi_guide/data/news/group.dart';
import 'package:mephi_guide/data/timetable/lesson.dart';
import 'package:mephi_guide/data/timetable/subject.dart';
import 'package:mephi_guide/data/timetable/teacher.dart';

class TimetableBloc implements Disposable{

  HttpListData<Group> groupsData;
  HttpListData<Lesson> lessonsData;
  HttpListData<Place> placesData;
  HttpListData<Subject> subjectsData;
  HttpListData<Teacher> teachersData;



  @override
  void dispose() {
    // TODO: implement dispose
  }

}