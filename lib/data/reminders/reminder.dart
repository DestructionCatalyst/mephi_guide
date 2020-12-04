
class Reminder{
  final int id;
  final String name;
  final String from;
  final String to;
  final String place;
  final String text;
  final int idPlace;

  Reminder({this.id, this.name, this.from, this.to, this.place, this.text, this.idPlace});

  factory Reminder.fromJson(Map<String, dynamic> json)
  {
    return Reminder(
        id: json['id'],
        name: json['name'],
        from: json['from'],
        to: json['to'],
        place: json['place'],
        text: json['text'],
        idPlace: json['idPlace']
    );
  }

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
}