
abstract class Model {

  final int id;

  Model(this.id);

  static fromMap(Map<String, dynamic> map){}
  toMap();
}