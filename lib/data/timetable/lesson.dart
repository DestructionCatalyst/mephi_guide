import 'package:intl/intl.dart';
import 'package:mephi_guide/data/model.dart';

class Lesson implements Model{
  final int id;
  final int idSubject;
  final int type;
  final int weekOdd;
  final DateTime startTime;
  final DateTime endTime;

  Lesson({this.id, this.idSubject, this.type, this.weekOdd, this.startTime, this.endTime});

  factory Lesson.fromJson(Map<String, dynamic> json) {

    DateFormat();

    return Lesson(
        id: json['id'],
        idSubject: json['idSubject'],
        type: json['type'],
        weekOdd: json['weekOdd'],
        startTime: DateTime.parse(json['startTime']),
        endTime: DateTime.parse(json['endTime']),
    );
  }

  @override
  toMap() {
    Map <String, dynamic> map = {
      'idSubject': idSubject,
      'type': type,
      'weekOdd': weekOdd,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
    };

    if (id != null) { map['id'] = id; }
    return map;
  }
}