import 'package:flutter/material.dart';
import 'package:mephi_guide/data/news/news.dart';
import 'package:mephi_guide/data/news/news_bloc.dart';
import 'package:mephi_guide/group_manager.dart';
import 'package:mephi_guide/news/news_card_content.dart';
import 'package:mephi_guide/news/two_column_list.dart';
import 'package:mephi_guide/rounded_button.dart';
import 'package:mephi_guide/tab/tab.dart';
import 'package:mephi_guide/tab/tab_header.dart';


class NewsTab extends StatefulWidget {
  final GroupManager newsButtonsGroup = new GroupManager();
  final NewsBloc _bloc = NewsBloc();

  @override
  _NewsTabState createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {


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
            child: StreamBuilder<List<News>>(
              stream: widget._bloc.newsData.outData,
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  //print(snapshot.data);
                  return TwoColumnList(
                      children: snapshot.data.reversed.map((a) =>
                          GridCard(content: NewsCardContent(news: a)))
                          .toList());
                }
                else
                  return Center(child: CircularProgressIndicator());
                  /*
                  GridCard(content: NewsCardContent(alignment: HorizontalAlignment(), date: '31.06.2021', name: "Провведение бизнес-конференции", address: "Каширское ш. д.31")),
                  GridCard(content: NewsCardContent(alignment: VerticalAlignment(), imageUrl: "https://via.placeholder.com/156x175", date: '31.06.2021', name: "Провведение бизнес-конференции", address: "Каширское ш. д.31")),
                  GridCard(content: NewsCardContent(alignment: HorizontalAlignment(), date: '31.06.2021', name: "Провведение бизнес-конференции", address: "Каширское ш. д.31")),
                  GridCard(content: NewsCardContent(alignment: VerticalAlignment(), imageUrl: "https://via.placeholder.com/156x175",  date: '31.06.2021', name: "Провведение бизнес-конференции", address: "Каширское ш. д.31")),
                  GridCard(content: NewsCardContent(alignment: VerticalAlignment(), imageUrl: "https://via.placeholder.com/156x175",  date: '31.06.2021', name: "Провведение бизнес-конференции", address: "Каширское ш. д.31")),
                  GridCard(content: NewsCardContent(alignment: HorizontalAlignment(), date: '31.06.2021', name: "Провведение бизнес-конференции", address: "Каширское ш. д.31")),
                  GridCard(content: NewsCardContent(alignment: VerticalAlignment(), imageUrl: "https://via.placeholder.com/156x175", date: '31.06.2021', name: "Провведение бизнес-конференции", address: "Каширское ш. д.31")),
                  GridCard(content: NewsCardContent(alignment: HorizontalAlignment(), date: '31.06.2021', name: "Провведение бизнес-конференции", address: "Каширское ш. д.31")),
                   */


              }
            ),
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
                      buttonGroup: widget.newsButtonsGroup,
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
                      buttonGroup: widget.newsButtonsGroup,
                    ),
                  ),
                ]
            )
        )
    );
  }

}
