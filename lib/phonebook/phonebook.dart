import 'package:flutter/material.dart';
import 'package:mephi_guide/group_manager.dart';
import 'package:mephi_guide/rounded_button.dart';
import 'package:mephi_guide/tab/tab.dart';

class PhoneBookTab extends StatefulWidget {
  @override
  _PhoneBookTabState createState() => _PhoneBookTabState();
}

class _PhoneBookTabState extends State<PhoneBookTab> {
  final GroupManager phoneBookButtonsGroup = new GroupManager();

  @override
  Widget build(BuildContext context) {
    return MyTab(
      name: "Телефонная книга",
      titleTop: 148,
      children: [
        buildButtons(),
      ],
    );
  }

  Positioned buildButtons() {
    return Positioned(
        top: 197,
        left: 8,
        child: Container(
            width: 352,
            height: 38,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildPaddedButton(name: "Все"),
                buildPaddedButton(name: "Основные"),
                buildPaddedButton(name: "Учебные отделы"),
                buildPaddedButton(name: "Дополнительно"),
              ]
            )
        )
    );
  }

  Padding buildPaddedButton({String name, Function onTap = doNothing}){
    return Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
    child: RoundedToggleButton.autoWidth(
      height: 38,
      text: name,
      onTap: onTap,
      buttonGroup: phoneBookButtonsGroup,
      ),
    );
  }
}

void doNothing(){}