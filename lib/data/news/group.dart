

import 'package:mephi_guide/data/model.dart';

class Group implements Model{
  final int id;
  final String name;
  final int institution;

  Group({this.id, this.name, this.institution});

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json["id"],
      name: json["name"],
      institution: json["idInst"]
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Group &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          institution == other.institution;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ institution.hashCode;

  @override
  toMap() {
    Map <String, dynamic> map = {
      'name': name,
      'institution': institution,
    };

    if (id != null) { map['id'] = id; }
    return map;
  }
}