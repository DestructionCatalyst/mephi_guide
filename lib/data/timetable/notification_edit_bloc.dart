import 'dart:async';

import 'package:mephi_guide/data/database/db_provider.dart';
import 'package:mephi_guide/data/disposable.dart';
import 'package:mephi_guide/data/timetable/notification.dart';
import 'package:mephi_guide/notification_scheduler.dart';
import 'package:sqflite/sqflite.dart';

class NotificationEditBloc implements Disposable{

  final StreamController<NotificationEvent>_eventController = StreamController<NotificationEvent>();

  Sink<NotificationEvent> get inEvent => _eventController.sink;
  Stream<NotificationEvent> get _outEvent => _eventController.stream;

  NotificationScheduler scheduler = NotificationScheduler();

  NotificationEditBloc(){
    _outEvent.listen(_handleEvent);
  }

  Future<void> _handleEvent(NotificationEvent event) async {
    if(event is NotificationEditedEvent){

      MyNotification notification = event.notification;
      int newId;

      if (notification.id == 0)
        notification = MyNotification(
          id: await DBProvider.queryLastId("notifications") + 1,
          idLesson: notification.idLesson,
          name: notification.name,
          note: notification.note,
          notificationTime: notification.notificationTime
        );

      print("Inserting and creating $notification");

      DBProvider.insert("notifications", notification, conflictAlgorithm: ConflictAlgorithm.replace);

      scheduler.scheduleNotification(notification.id, notification.name, notification.note, notification.notificationTime);
    }
    else if (event is NotificationDeletedEvent){


    }
    else{
      //Should never reach here
      throw Exception("Unexpected event!");
    }

  }

  @override
  void dispose() {
    _eventController.close();
  }
}

abstract class NotificationEvent{}

class NotificationEditedEvent extends NotificationEvent{
  final MyNotification notification;

  NotificationEditedEvent(this.notification);
}

class NotificationDeletedEvent extends NotificationEvent{}



