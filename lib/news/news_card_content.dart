import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mephi_guide/data/news/news.dart';

class NewsCardContent extends StatelessWidget {

  final String imageUrl;
  final CardAlignment alignment;

  final News news;
  //final String date;
  //final String name;
  //final String address;

  /*
  const NewsCardContent({
    Key key,
    this.imageUrl = "https://via.placeholder.com/156x127",
    this.alignment = const HorizontalAlignment(),
    @required this.date,
    @required this.name,
    @required this.address}) : super(key: key);*/

  const NewsCardContent({
    Key key,
    this.imageUrl = "https://via.placeholder.com/156x127",
    this.alignment = const HorizontalAlignment(),
    @required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildImage(),
        buildDate(),
        buildName(),
        buildLocation(),
        //buildBottomArt()
      ],
    );
  }

  Container buildImage() {
    return Container(
        width: alignment.pictureWidth,
        height: alignment.pictureHeight,

        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),

        child: ClipRRect(
          borderRadius: new BorderRadius.circular(5.0),

          child: CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      );
  }

  Align buildName() {
    return Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(news.name,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromRGBO(62, 39, 148, 1),
              fontFamily: 'Roboto',
              fontSize: 12,
              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.bold,
              height: 1
            ),
          ),
        ),
      );
  }

  Align buildDate() {
    return Align(
        alignment: Alignment.topRight,

        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            news.time,

            textAlign: TextAlign.right,

            style: TextStyle(
              color: Color.fromRGBO(193, 201, 211, 1),
              fontFamily: 'Roboto',
              fontSize: 12,
              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1
            ),
          ),
        ),
      );
  }

  Row buildLocation() {
    return Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(3, 3, 5, 3),
            child: ImageIcon(
              AssetImage('assets/images/icons/location-map.png'),
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 3, 3, 3),
            child: Text(news.place,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color.fromRGBO(185, 192, 202, 1),
                fontFamily: 'Roboto',
                fontSize: 12,
                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.italic,
                height: 1
            ),),
          )
        ],
      );
  }

  Container buildBottomArt() {
    return Container(
          width: 150,
          height: 4,

          padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),

          child: Stack(
              children: <Widget>[
                Positioned(
                    top: 1,
                    left: 0,
                    child: Container(
                        width: 111,
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
                    left: 125,
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
                          color : Color.fromRGBO(185, 192, 202, 1),
                        )
                    )
                ),Positioned(
                    top: 0,
                    left: 146,
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
                          color : Color.fromRGBO(185, 192, 202, 1),
                        )
                    )
                ),
              ]
          )
      );
  }
}

class CardAlignment{
  final double pictureWidth;
  final double pictureHeight;

  final double cardWidth;
  final double cardHeight;

  const CardAlignment(this.pictureWidth, this.pictureHeight, this.cardWidth, this.cardHeight);
}

class HorizontalAlignment extends CardAlignment{
  const HorizontalAlignment({double pictureWidth = 156, double pictureHeight = 127, double cardWidth = 163, double cardHeight = 225}) :
        super(pictureWidth, pictureHeight, cardWidth, cardHeight);
}

class VerticalAlignment extends CardAlignment{
  const VerticalAlignment({double pictureWidth = 156, double pictureHeight = 174, double cardWidth = 163, double cardHeight = 270}) :
        super(pictureWidth, pictureHeight, cardWidth, cardHeight);
}
