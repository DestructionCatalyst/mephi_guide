

import 'package:mephi_guide/data/model.dart';

class MyNotification implements Model{
  final int id;
  final int idLesson;
  final String name;
  final String note;
  final DateTime notificationTime;

  MyNotification({this.id, this.idLesson, this.name, this.note, this.notificationTime});

  factory MyNotification.fromJson(Map<String, dynamic> json) {
    return MyNotification(
      id: json['id'],
      idLesson: json['idLesson'],
      name: json['name'],
      note: json['note'],
      notificationTime: DateTime.parse(json['notificationTime'])
    );
  }

  @override
  toMap() {
    Map <String, dynamic> map = {
      'idLesson': idLesson,
      'name': name,
      'note': note,
      'notificationTime': notificationTime.toIso8601String()
    };

    if (id != null) { map['id'] = id; }
    return map;
  }

  @override
  String toString() {
    return 'Notification{id: $id, name: $name, note: $note, notificationTime: $notificationTime}';
  }
}