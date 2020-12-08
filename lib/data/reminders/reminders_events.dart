

import 'package:mephi_guide/data/reminders/reminder.dart';

abstract class ReminderEvent{}

class ReminderCheckedChanged extends ReminderEvent{

  Reminder changedReminder;
  bool becameCompleted;

  ReminderCheckedChanged(this.changedReminder, this.becameCompleted);
}

class DisplayModeCheckedChanged extends ReminderEvent{
  bool incompleteOnly;

  DisplayModeCheckedChanged(this.incompleteOnly);
}