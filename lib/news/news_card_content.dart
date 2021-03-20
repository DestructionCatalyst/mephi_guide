import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsCardContent extends StatelessWidget {

  final String imageUrl;
  final CardAlignment alignment;

  final String date;
  final String name;
  final String address;

  const NewsCardContent({
    Key key,
    this.imageUrl = "https://via.placeholder.com/156x127",
    this.alignment = const HorizontalAlignment(),
    @required this.date,
    @required this.name,
    @required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: alignment.pictureWidth,
          height: alignment.pictureHeight,

          child: CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Text(
            date,
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
        )
      ],
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
