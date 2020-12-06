import 'dart:async';

import 'package:mephi_guide/data/disposable.dart';
import 'package:mephi_guide/data/http_list_data.dart';
import 'package:mephi_guide/data/reminders/reminder.dart';
import 'package:mephi_guide/data/reminders/reminder_completed_check.dart';
import 'package:mephi_guide/data/reminders/reminders_events.dart';

class RemindersBloc implements Disposable{

  static const String remindersPage = "getrem";

  HttpListData<Reminder> remindersData;
  List<Reminder> reminders;

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

  RemindersBloc([HttpListData<Reminder> remindersListData])
  {
    remindersData = remindersListData ?? HttpListData((json) => Reminder.fromJson(json));

    completedChecker = new ReminderCompletedCheck();

    remindersData.outData.listen((event) {
      completedChecker.loadFromFile(event).then((value) {
        reminders = value;
        updateData();
        print('loaded data');
      });

    });

    remindersData.loadData(remindersPage);

    _outEvent.listen(_handleEvent);

  }

  bool isCompleted(Reminder r) => completedChecker.isCompleted(r);

  void _handleEvent(ReminderEvent event) {
    if(event is ReminderCheckedChanged){
      if (event.becameCompleted){
        //completedChecker.check(event.changedReminder);
        reminders.where((element) => element == event.changedReminder).toList()[0].checked = true;
        updateData();
      }
      else{
        //completedChecker.uncheck(event.changedReminder);
        reminders.where((element) => element == event.changedReminder).toList()[0].checked = false;
        updateData();
      }
      completedChecker.saveCheckedList(reminders);
    }
    else if (event is DisplayModeCheckedChanged){

    }
    else{
      //Should never reach here
      throw Exception("Unexpected event!");
    }

  }

  void updateData(){
    _inData.add(reminders);
    _inPercentage.add(calculatePercentage());

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
  }

}

