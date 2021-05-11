

import 'package:mephi_guide/data/model.dart';

class LessonData implements Model{
  final int id;
  final String subjectName;
  final String teachers;
  final String groups;
  final String places;
  final int type;
  final int weekOdd;
  final DateTime startTime;
  final DateTime endTime;

  LessonData({this.id, this.subjectName, this.teachers, this.groups, this.places, this.type, this.weekOdd, this.startTime, this.endTime});

  factory LessonData.fromJson(Map<String, dynamic> json) {

    return LessonData(
      id: json['id'],
      subjectName: json['subjectName'],
      teachers: json['teachers'],
      groups: json['groups'],
      places: json['places'],
      type: json['type'],
      weekOdd: json['weekOdd'],
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
    );
  }

  @override
  toMap() {
    Map <String, dynamic> map = {
      'subjectName': 'subjectName',
      'teachers': 'teachers',
      'groups': 'groups',
      'places': 'places',
      'type': type,
      'weekOdd': weekOdd,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
    };

    if (id != null) { map['id'] = id; }
    return map;
  }

  @override
  String toString() {
    return 'LessonData{id: $id, subjectName: $subjectName, teachers: $teachers, groups: $groups, places: $places, type: $type, weekOdd: $weekOdd, startTime: $startTime, endTime: $endTime}';
  }
}