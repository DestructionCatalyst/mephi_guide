import 'package:mephi_guide/data/model.dart';

class Subject implements Model{
  final int id;
  final String name;

  Subject({this.id, this.name});

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
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