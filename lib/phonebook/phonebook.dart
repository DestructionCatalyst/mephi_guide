import 'package:flutter/material.dart';
import 'package:mephi_guide/tab/tab.dart';

class PhoneBookTab extends StatefulWidget {
  @override
  _PhoneBookTabState createState() => _PhoneBookTabState();
}

class _PhoneBookTabState extends State<PhoneBookTab> {
  @override
  Widget build(BuildContext context) {
    return MyTab(
      name: "Телефонная книга",
      titleTop: 148,
      children: [Positioned(child: Container(),)],
    );
  }
}
