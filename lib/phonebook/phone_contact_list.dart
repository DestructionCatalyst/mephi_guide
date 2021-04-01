import 'package:flutter/material.dart';
import 'package:mephi_guide/data/phonebook/phone_book_bloc.dart';
import 'package:mephi_guide/data/phonebook/phone_contact.dart';

class PhoneContactList extends StatefulWidget {
  final PhoneBookBloc bloc = PhoneBookBloc();

  @override
  _PhoneContactListState createState() => _PhoneContactListState();
}

class _PhoneContactListState extends State<PhoneContactList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PhoneContact>>(
      stream: remindersStream,
      builder: (BuildContext context, AsyncSnapshot<List<PhoneContact>> snapshot){
        if(snapshot.hasData) {
          print(snapshot.data);
          return ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: snapshot.data.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              PhoneContact contact = snapshot.data[index];
              return PhoneContactListTile(key: UniqueKey(), contact: contact);
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
          );
        }
        else{
          return Center(child: CircularProgressIndicator());
        }
      },

    );
  }

  Stream<List<PhoneContact>> get remindersStream => widget.bloc.outContacts;
}

class PhoneContactListTile extends StatelessWidget {

  final PhoneContact contact;

  const PhoneContactListTile({Key key, this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 80,

      decoration: BoxDecoration(
        borderRadius : BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        color : Color.fromRGBO(250, 250, 250, 1),
      ),

      child: Stack(
          children: <Widget>[
            buildTitle(),
            buildNumber(),
            buildIcon(),
            buildLineAndDots(),
          ]
      )
    );
  }

  Positioned buildIcon() {
    return Positioned(
            top: 11,
            left: 16,
            child: Container(
                width: 40,
                height: 40,

                child: Stack(
                    children: <Widget>[
                      Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color : Color.fromRGBO(185, 192, 202, 1),
                                borderRadius : BorderRadius.all(Radius.elliptical(40, 40)),
                              )
                          )
                      ),
                      Positioned(
                        top: 8,
                        left: 8,
                        child: ImageIcon(
                          AssetImage("assets/images/icons/fill-and-stroke.png"),
                          color: Colors.white,
                        ),
                      )
                    ]
                )
            )
        );
  }

  Positioned buildLineAndDots() {
    return Positioned(
            top: 61,
            left: 236,
            child: Container(
                width: 100,
                height: 4,

                child: Stack(
                    children: <Widget>[
                      Positioned(
                          top: 1,
                          left: 0,
                          child: Container(
                              width: 61,
                              height: 2,
                              decoration: BoxDecoration(
                                borderRadius : BorderRadius.only(
                                  topLeft: Radius.circular(3),
                                  topRight: Radius.circular(3),
                                  bottomLeft: Radius.circular(3),
                                  bottomRight: Radius.circular(3),
                                ),
                                color : Color.fromRGBO(185, 192, 202, 1),
                              )
                          )
                      ),Positioned(
                          top: 0,
                          left: 75,
                          child: Container(
                              width: 4,
                              height: 4,
                              decoration: BoxDecoration(
                                borderRadius : BorderRadius.only(
                                  topLeft: Radius.circular(3),
                                  topRight: Radius.circular(3),
                                  bottomLeft: Radius.circular(3),
                                  bottomRight: Radius.circular(3),
                                ),
                                color : Color.fromRGBO(185, 191, 202, 1),
                              )
                          )
                      ),Positioned(
                          top: 0,
                          left: 96,
                          child: Container(
                              width: 4,
                              height: 4,
                              decoration: BoxDecoration(
                                borderRadius : BorderRadius.only(
                                  topLeft: Radius.circular(3),
                                  topRight: Radius.circular(3),
                                  bottomLeft: Radius.circular(3),
                                  bottomRight: Radius.circular(3),
                                ),
                                color : Color.fromRGBO(185, 191, 202, 1),
                              )
                          )
                      ),
                    ]
                )
            )
        );
  }

  Positioned buildNumber() {
    return Positioned(
            top: 55.37841796875,
            left: 71,
            child: Text(contact.number, textAlign: TextAlign.left, style: TextStyle(
                color: Color.fromRGBO(185, 192, 202, 1),
                fontFamily: 'Roboto',
                fontSize: 12,
                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.bold,
                height: 1
            ),)
        );
  }

  Positioned buildTitle() {
    return Positioned(
            top: 23,
            left: 71,
            child: Text(contact.name,
              textAlign: TextAlign.left, style: TextStyle(
                  color: Color.fromRGBO(62, 39, 148, 1),
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.bold,
                  height: 1.2857142857142858
              ),)
        );
  }


}

