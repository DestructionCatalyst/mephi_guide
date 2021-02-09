
import 'package:mephi_guide/data/i_html_convertible.dart';
import 'package:mephi_guide/data/parse_date.dart';

class Reminder implements IHtmlConvertible{
  final int id;
  final String name;
  final DateTime fromDate;
  final DateTime toDate;
  final String place;
  final String text;
  final int idPlace;

  bool checked;

  Reminder({this.id, this.name, this.fromDate, this.toDate, this.place, this.text, this.idPlace, this.checked = false});

  bool get completed => checked;
  bool get incomplete => !checked;
  bool get missed => false;

  factory Reminder.fromJson(Map<String, dynamic> json)
  {
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
  }

  String get shortenedText => text.substring(0, 50) + "...";
  String get span => dMy().format(fromDate) + " - " + dMy().format(toDate);

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