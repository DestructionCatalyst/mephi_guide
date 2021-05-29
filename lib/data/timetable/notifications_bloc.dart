import 'dart:async';

import 'package:mephi_guide/data/database/db_provider.dart';
import 'package:mephi_guide/data/disposable.dart';
import 'package:mephi_guide/data/timetable/notification.dart';

class NotificationsBloc implements Disposable{

  final int lessonId;

  StreamController<List<MyNotification>> _lessonsDataController = StreamController<List<MyNotification>>();

  Sink<List<MyNotification>> get _inData => _lessonsDataController.sink;
  Stream<List<MyNotification>> get outData => _lessonsDataController.stream;

  NotificationsBloc(this.lessonId){
    DBProvider.queryLessonNotifications(lessonId).then((value) =>
        _inData.add(value.map((json) => MyNotification.fromJson(json)).toList()));
  }

  @override
  void dispose() {
    _lessonsDataController.close();
  }

}