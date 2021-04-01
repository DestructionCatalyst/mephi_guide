import 'package:mephi_guide/data/model.dart';

class PhoneContact implements Model {

  final int id;
  final String name;
  final String number;
  final int category;
  //TODO think about it
  //final String iconAsset;

  PhoneContact({this.id, this.name, this.number, this.category, /*this.iconAsset*/});


  @override
  toMap() {
    Map <String, dynamic> map = {
      'name': name,
      'number': number,
      "category": category,
      //'iconAsset': iconAsset,
    };

    if (id != null) { map['id'] = id; }
    return map;
  }



}