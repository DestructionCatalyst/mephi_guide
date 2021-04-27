import 'package:mephi_guide/data/model.dart';

class Teacher implements Model{
  final int id;
  final String name;

  Teacher({this.id, this.name});

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  toMap() {
    Map <String, dynamic> map = {
      'name': name
    };

    if (id != null) { map['id'] = id; }
    return map;
  }
}