
import 'package:mephi_guide/data/i_html_convertible.dart';
import 'package:mephi_guide/data/model.dart';
import 'package:mephi_guide/data/parse_date.dart';


class Reminder implements IHtmlConvertible, Model {
  final int id;
  final String name;
  final DateTime fromDate;
  final DateTime toDate;
  final String place;
  final String text;
  final int idPlace;

  bool checked;

  Reminder({this.id, this.name, this.fromDate, this.toDate, this.place, this.text, this.idPlace, this.checked = false});

  /// When checked
  bool get completed => checked;

  /// When the date had passed
  bool get late => DateTime.now().isAfter(toDate);

  /// When not checked, but the date has not passed
  bool get incomplete => !checked & !late;
  /// When not checked, and the date has passed
  bool get missed => !checked & late;

  String get shortenedText => text.substring(0, 50) + "...";
  String get span => dMy().format(fromDate) + " - " + dMy().format(toDate);

  @override
  factory Reminder.fromMap(Map<String, dynamic> map)
  {
    return Reminder(
        id: map['id'],
        name: map['name'],
        fromDate: parseDate(map['from']),
        toDate: parseDate(map['to']),
        place: map['place'],
        text: map['text'],
        idPlace: map['idPlace']
    );
  }

  @override
  Map <String, dynamic> toMap() {

    Map <String, dynamic> map = {
      'name': name,
      'from': fromDate.toIso8601String(),
      'to': toDate.toIso8601String(),
      'place': place,
      'text': text,
      'idPlace': idPlace
    };

    if (id != null) { map['id'] = id; }
    return map;
  }

  //TODO save state

  factory Reminder.fromJson(Map<String, dynamic> json)
  {
    return Reminder.fromMap(json);
    /*
    Reminder res = Reminder(
        id: json['id'],
        name: json['name'],
        fromDate: parseDate(json['from']),
        toDate: parseDate(json['to']),
        place: json['place'],
        text: json['text'],
        idPlace: json['idPlace']
    );

    return res;
     */
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Reminder &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          place == other.place &&
          text == other.text &&
          idPlace == other.idPlace;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      place.hashCode ^
      text.hashCode ^
      idPlace.hashCode;

  @override
  String toString() {
    return 'Reminder{id: $id, name: $name, checked: $checked}';
  }

  @override
  String toHtml() {
    return '''
      <h4>$name</h4><br>
      $text<br>
      Место: $place<br>
      Сроки: $span
    ''';
  }

}
