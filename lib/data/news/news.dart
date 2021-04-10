
import 'dart:convert';
import 'dart:typed_data';

import 'package:mephi_guide/data/i_html_convertible.dart';

class News implements IHtmlConvertible{
  final int id;
  final String name;
  final int institution;
  final String time;
  final String place;
  final String text;
  final Uint8List topImg;
  final int idPlace;

  News({this.id, this.name, this.institution, this.time, this.place, this.text, this.topImg, this.idPlace});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'],
      name: json['name'],
      institution: json['institution'],
      time: json['t'],
      place: json['place'],
      text: json['text'],
      topImg: json['top_mg'],
      idPlace: json['idPlace']
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is News &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          institution == other.institution &&
          time == other.time &&
          place == other.place &&
          text == other.text &&
          topImg == other.topImg &&
          idPlace == other.idPlace;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      institution.hashCode ^
      time.hashCode ^
      place.hashCode ^
      text.hashCode ^
      topImg.hashCode ^
      idPlace.hashCode;

  @override
  String toHtml() {
    return '''
      <h4>$name</h4><br>
      $text<br>
      Место: $place<br>
      Время: $time
    ''';
  }
}

//Only here because of a stupid test
News newsFromJson(String jsonStr) {
  final jsonData = json.decode(jsonStr);
  return News.fromJson(jsonData);
}

//Only here because of a stupid test
List<News> newsListFromJson(String jsonStr) {

  var newsJson = jsonDecode(jsonStr) as List;
  return newsJson.map((tagJson) => News.fromJson(tagJson)).toList();

}




