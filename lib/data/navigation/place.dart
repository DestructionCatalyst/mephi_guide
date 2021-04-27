import 'package:mephi_guide/data/model.dart';

class Place implements Model{
  final int id;
  final String name;
  final int x;
  final int y;

  Place({this.id, this.name, this.x, this.y});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'],
      name: json['name'],
      x: json['x'],
      y: json['y'],
    );
  }

  @override
  toMap() {
    Map <String, dynamic> map = {
      'id': id,
      'name': name,
      'x': x,
      'y': y,
    };

    if (id != null) { map['id'] = id; }
    return map;
  }
}