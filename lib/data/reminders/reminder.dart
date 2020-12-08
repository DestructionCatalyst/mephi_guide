
class Reminder{
  final int id;
  final String name;
  final String from;
  final String to;
  final String place;
  final String text;
  final int idPlace;

  bool checked;

  Reminder({this.id, this.name, this.from, this.to, this.place, this.text, this.idPlace, this.checked = false});

  factory Reminder.fromJson(Map<String, dynamic> json)
  {
    Reminder res = Reminder(
        id: json['id'],
        name: json['name'],
        from: json['from'],
        to: json['to'],
        place: json['place'],
        text: json['text'],
        idPlace: json['idPlace']
    );



    return res;
  }

  String get shortenedText => text.substring(0, 50) + "...";
  String get span => from + " - " + to;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Reminder &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          from == other.from &&
          to == other.to &&
          place == other.place &&
          text == other.text &&
          idPlace == other.idPlace;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      from.hashCode ^
      to.hashCode ^
      place.hashCode ^
      text.hashCode ^
      idPlace.hashCode;

  @override
  String toString() {
    return 'Reminder{id: $id, name: $name, checked: $checked}';
  }
}