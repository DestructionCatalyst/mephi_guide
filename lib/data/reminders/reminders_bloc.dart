import 'dart:async';

import 'package:mephi_guide/data/disposable.dart';
import 'package:mephi_guide/data/http_list_data.dart';
import 'package:mephi_guide/data/reminders/reminder.dart';
import 'package:mephi_guide/data/reminders/reminder_completed_check.dart';
import 'package:mephi_guide/data/reminders/reminders_events.dart';

class RemindersBloc implements Disposable{

  static const String remindersPage = "getrem";

  HttpListData<Reminder> remindersData;

  ReminderCompletedCheck completedChecker;

  final StreamController<ReminderEvent>_eventController = StreamController<ReminderEvent>();

  Sink<ReminderEvent> get inEvent => _eventController.sink;
  Stream<ReminderEvent> get _outEvent => _eventController.stream;

  RemindersBloc([HttpListData<Reminder> remindersListData])
  {
    remindersData = remindersListData ?? HttpListData((json) => Reminder.fromJson(json));

    remindersData.loadData(remindersPage);

    _outEvent.listen(_handleEvent);

    completedChecker = new ReminderCompletedCheck();
  }

  bool isCompleted(Reminder r) => completedChecker.isCompleted(r);

  void _handleEvent(ReminderEvent event){}

  @override
  void dispose() {
    remindersData.dispose();
    _eventController.close();
  }

}

