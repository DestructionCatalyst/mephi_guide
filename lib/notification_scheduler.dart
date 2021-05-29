import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationScheduler{




  Future<void> scheduleNotification(int id, String scheduledTitle, String scheduledBody, DateTime scheduledDateTime, {String payload}) async {

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel id',
      'channel name',
      'channel description',
      icon: '@mipmap/ic_launcher',
      largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await FlutterLocalNotificationsPlugin().schedule(
        id,
        scheduledTitle,
        scheduledBody,
        scheduledDateTime,
        platformChannelSpecifics,
        payload: payload);
  }
}