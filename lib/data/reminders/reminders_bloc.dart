import 'dart:async';

import 'package:mephi_guide/data/database/db_provider.dart';
import 'package:mephi_guide/data/disposable.dart';
import 'package:mephi_guide/data/http_list_data.dart';
import 'package:mephi_guide/data/reminders/reminder.dart';
import 'package:mephi_guide/data/reminders/reminder_completed_check.dart';
import 'package:mephi_guide/data/reminders/reminders_events.dart';

class RemindersBloc implements Disposable{

  static const String remindersPage = "getrem";

  HttpListData<Reminder> remindersData;
  List<Reminder> reminders;

  bool incompleteOnly = false;

  ReminderCompletedCheck completedChecker;

  final StreamController<ReminderEvent>_eventController = StreamController<ReminderEvent>();

  Sink<ReminderEvent> get inEvent => _eventController.sink;
  Stream<ReminderEvent> get _outEvent => _eventController.stream;

  final StreamController<List<Reminder>>_reminderController = StreamController<List<Reminder>>();

  Sink<List<Reminder>> get _inData => _reminderController.sink;
  Stream<List<Reminder>> get outData => _reminderController.stream;

  final StreamController<int>_percentageController = StreamController<int>();

  Sink<int> get _inPercentage => _percentageController.sink;
  Stream<int> get outPercentage => _percentageController.stream;

  final StreamController<List<int>>_circleWidgetController = StreamController<List<int>>();

  Sink<List<int>> get _inAmounts => _circleWidgetController.sink;
  Stream<List<int>> get outAmounts => _circleWidgetController.stream;

  RemindersBloc([HttpListData<Reminder> remindersListData])
  {
    remindersData = remindersListData ?? HttpListData((json) => Reminder.fromJson(json));

    completedChecker = new ReminderCompletedCheck();

    remindersData.outData.listen((event) {
      completedChecker.loadFromFile(event).then((value) {
        reminders = value;
        DBProvider.insertAll("reminder", reminders);
        updateData();
      });
    });

    remindersData.loadData(remindersPage);

    _outEvent.listen(_handleEvent);

  }

  void _handleEvent(ReminderEvent event) {
    if(event is ReminderCheckedChanged){

      reminders.singleWhere((element) => element == event.changedReminder).checked = event.becameCompleted;
      updateData();

      completedChecker.saveCheckedList(reminders);
    }
    else if (event is DisplayModeCheckedChanged){
      incompleteOnly = event.incompleteOnly;
      updateData();
    }
    else{
      //Should never reach here
      throw Exception("Unexpected event!");
    }

  }

  void updateData(){
    if (incompleteOnly) {
      List tmp = reminders.where((element) => !element.completed).toList();
      _inData.add(tmp);
    }
    else {
      _inData.add(reminders);
    }
    _inPercentage.add(calculatePercentage());
    _inAmounts.add([
      reminders.where((element) => element.completed).length,
      reminders.where((element) => element.incomplete).length,
      reminders.where((element) => element.missed).length,
    ]);
  }

  int calculatePercentage(){
    int checked = 0;

    for(Reminder r in reminders){
      if (r.checked)
        checked++;
    }

    int percentage = ((checked / reminders.length) * 100).round();

    return percentage;
  }

  @override
  void dispose() {
    completedChecker.saveCheckedList(reminders);

    remindersData.dispose();
    _eventController.close();
    _reminderController.close();
    _percentageController.close();
    _circleWidgetController.close();
  }

}

