

import 'dart:async';

import 'package:mephi_guide/data/disposable.dart';
import 'package:mephi_guide/data/phonebook/phone_contact.dart';

class PhoneBookBloc implements Disposable{


  final StreamController<List<PhoneContact>> _phoneContactController
    = StreamController<List<PhoneContact>>();

  Sink<List<PhoneContact>> get _inContacts => _phoneContactController.sink;
  Stream<List<PhoneContact>> get outContacts => _phoneContactController.stream;


  PhoneBookBloc(){
    List<PhoneContact> dummyContacts = [];
    for(int i = 0; i < 10; i++){
      dummyContacts.add(createDummy());
    }
    _inContacts.add(dummyContacts);
  }

  PhoneContact createDummy(){
    return PhoneContact(
      id: 0,
      name: "Основной номер МИФИ",
      number: "+7(495)788-56-99",
      category: 0
    );
  }

  @override
  void dispose() {
    _phoneContactController.close();
  }

}