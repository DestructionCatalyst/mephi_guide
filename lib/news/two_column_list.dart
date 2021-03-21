
import 'package:flutter/material.dart';
import 'package:mephi_guide/news/news_card_content.dart';

class TwoColumnList extends StatefulWidget {

  final List<GridCard> children;

  const TwoColumnList({Key key, this.children}) : super(key: key);

  @override
  _TwoColumnListState createState() => _TwoColumnListState(children);
}

class _TwoColumnListState extends State<TwoColumnList> {

  final List<GridCard> children;

  List<GridCard> left = [];
  List<GridCard> right = [];

  _TwoColumnListState(this.children);

  @override
  Widget build(BuildContext context) {

    for(int i = 0; i < children.length; i++){
      if(i % 2 == 0)
        left.add(children[i]);
      else
        right.add(children[i]);
    }

    return Container(
      height: 320,
      child: SingleChildScrollView(
        child: Row(
          //mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 5, 0),
                child: Column(children: left),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 12, 0),
                child: Column(children: right),
              ),
              /* SizedBox(
                    width: 200,
                    child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          GridCard(horizontal: false),
                          GridCard(horizontal: true),
                          GridCard(horizontal: false),
                          GridCard(horizontal: true),
                        ])), */
            ]),
      ),
    );
  }

  /*void splitLists(){

    // Split input list to horizontal and vertical elements
    Iterable<GridCard> horizontals = children.where((element) => element.horizontal);
    Iterable<GridCard> verticals = children.where((element) => !element.horizontal);

    // Add them into left and right columns, altering between horizontals and verticals
    for(int i = 0; i < min(horizontals.length, verticals.length); i++){
      if(i % 2 == 0){
        left.add(horizontals.elementAt(i));
        right.add(verticals.elementAt(i));
      }
      else{
        left.add(verticals.elementAt(i));
        right.add(horizontals.elementAt(i));
      }

    }

    Iterable<GridCard> rest;

    if(horizontals.isNotEmpty)
      rest = horizontals;
    else
      rest = verticals;

    // When you can't longer alter, separate what's rest between the columns
    for(int i = 0; i < rest.length; i++){
      if(i % 2 == 0){
        left.add(rest.elementAt(i));
      }
      else{
        right.add(rest.elementAt(i));
      }
    }


  }*/
}

class GridCard extends StatelessWidget {

  final NewsCardContent content;

  const GridCard({
    Key key,
    this.content,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Container(
        height: content.alignment.cardHeight,
        width: content.alignment.cardWidth,
        child: Card(
          color: Colors.white,
          child: content,
        ),
      ),
    );
  }
}
