import 'package:flutter/material.dart';
import 'package:mephi_guide/group_manager.dart';
import 'package:mephi_guide/news/two_column_list.dart';
import 'package:mephi_guide/rounded_button.dart';
import 'package:mephi_guide/tab/tab.dart';
import 'package:mephi_guide/tab/tab_header.dart';


class NewsTab extends StatefulWidget {
  @override
  _NewsTabState createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  final GroupManager newsButtonsGroup = new GroupManager();

  @override
  Widget build(BuildContext context) {
    return MyTab(
        name: "Новости",
        header: TabHeader(
          wigglyRectangleAsset: 'assets/images/Placeholder_big.svg',
          mephiTop: 111,
          mephiLeft: 18,
          mephiFontSize: 44,
        ),
        children: <Widget>[
          buildButtons(),
          Positioned(
            top: 320,
            left: 0,
            child: TwoColumnList(children: [
              GridCard(horizontal: true),
              GridCard(horizontal: false),
              GridCard(horizontal: true),
              GridCard(horizontal: false),
              GridCard(horizontal: false),
              GridCard(horizontal: true),
              GridCard(horizontal: false),
              GridCard(horizontal: true),
            ],),
          )

        ]
    );

  }

  Positioned buildButtons() {
    return Positioned(
        top: 277,
        left: 16.5,
        child: Container(
            width: 328,
            height: 38,
            child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: RoundedToggleButton(
                      width: 101,
                      height: 38,
                      text: "Все",
                      defaultPressed: true,
                      onTap: () => {},
                      buttonGroup: newsButtonsGroup,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 115,
                    child: RoundedToggleButton(
                      width: 213,
                      height: 38,
                      text: "Персонализированные",
                      defaultPressed: false,
                      onTap: () => {},
                      buttonGroup: newsButtonsGroup,
                    ),
                  ),
                ]
            )
        )
    );
  }

}
