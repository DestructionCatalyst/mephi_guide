
import 'dart:convert';

import 'package:mephi_guide/data/i_html_convertible.dart';
import 'package:mephi_guide/data/model.dart';

class News implements IHtmlConvertible, Model{
  final int id;
  final String name;
  final int institution;
  final String time;
  final String place;
  final String text;
  final String topImg;
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
      topImg: json['topImg'],
      idPlace: json['idPlace']
    );
  }

  @override
  Map<String, dynamic>toMap() {
    String top_img = topImg ?? '';

    Map <String, dynamic> map = {
      'name': name,
      'institution': institution,
      't': time,
      'place': place,
      'text': text,
      'topImg': top_img ,
      'idPlace': idPlace
    };

    if (id != null) { map['id'] = id; }
    return map;
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

  @override
  String toString() {
    return 'News{id: $id, name: $name, institution: $institution, time: $time, place: $place, text: $text, topImg: $topImg, idPlace: $idPlace}';
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




