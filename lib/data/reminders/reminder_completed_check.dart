
import 'package:mephi_guide/data/reminders/reminder.dart';

import '../local_file.dart';
import '../parse_string_to_list.dart';

class ReminderCompletedCheck{
  Set<int> completed = {};

  LocalFile<List<int>> completedFile = new LocalFile(
      "reminders",
          (str) => parseStringToList(str, int.parse)
  );


  Future<List<Reminder>> loadFromFile(List<Reminder> remindersList) async{
    List<int> loaded = await completedFile.readFile();

    completed = Set.from(loaded ?? {});

    return setCheckedListAsync(remindersList);
  }

  bool isCompleted(Reminder r)
  {
    return completed?.contains(r.id);
  }

  Reminder setChecked(Reminder r){
    r.checked = isCompleted(r);
    return r;
  }

  Future<List<Reminder>> setCheckedListAsync(List<Reminder> remindersList)
  {
    return Future.value(remindersList.map((r) => setChecked(r)).toList());
  }

  void saveCheckedList(List<Reminder> remindersList){
    completedFile.writeFile(remindersList.where((e) => (e.checked)).map((e) => e.id).toList()).then((value) => null);
  }

}