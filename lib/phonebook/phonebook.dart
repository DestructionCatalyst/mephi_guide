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
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: RoundedToggleButton.autoWidth(
                    height: 38,
                    text: "Все",
                    defaultPressed: true,
                    onTap: () => {},
                    buttonGroup: phoneBookButtonsGroup,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: RoundedToggleButton.autoWidth(
                    height: 38,
                    text: "Основные",
                    onTap: () => {},
                    buttonGroup: phoneBookButtonsGroup,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: RoundedToggleButton.autoWidth(
                    height: 38,
                    text: "Учебные отделы",
                    onTap: () => {},
                    buttonGroup: phoneBookButtonsGroup,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: RoundedToggleButton.autoWidth(
                    height: 38,
                    text: "Дополнительно",
                    onTap: () => {},
                    buttonGroup: phoneBookButtonsGroup,
                  ),
                ),
              ],

            )
        )
    );
  }
}
