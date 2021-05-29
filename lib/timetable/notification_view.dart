import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mephi_guide/data/timetable/notification.dart';
import 'package:mephi_guide/my_text.dart';

class NotificationView extends StatelessWidget {

  final MyNotification notification;

  const NotificationView({Key key, this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(text: notification.name, fontSize: 18),
            MyText(text: DateFormat("dd.MM.yy, hh:mm").format(notification.notificationTime), align: TextAlign.end, fontSize: 20,)
          ]
        ),
      )
    );
  }
}
