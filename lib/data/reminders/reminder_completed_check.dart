
import 'package:mephi_guide/data/reminders/reminder.dart';

import '../local_file.dart';
import '../parse_string_to_list.dart';

class ReminderCompletedCheck{
  Set<int> completed;

  LocalFile<List<int>> completedFile = new LocalFile(
      "reminders",
          (str) => parseStringToList(str, int.parse)
  );

  ReminderCompletedCheck(){
    completedFile.readFile().then(
          (value) => completed = Set.from(value ?? {})
    );
  }

  bool isCompleted(Reminder r)
  {
    return completed.contains(r.id);
  }

  void saveChecked()
  {
    completedFile.writeFile(List.from(completed)).then((value) => null);
  }
}