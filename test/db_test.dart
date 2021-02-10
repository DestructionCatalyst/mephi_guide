import 'package:flutter_test/flutter_test.dart';
import 'package:mephi_guide/data/database/db_provider.dart';
import 'package:mephi_guide/data/reminders/reminder.dart';

main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('database test', () async {
        await DBProvider.db.database;

        DBProvider.insert("reminders", Reminder(
          id:0,
          name:"test",
          fromDate: DateTime.now(),
          toDate: DateTime.now(),
          place: "test",
          text: "test",
          idPlace: 0
        ));

        print(DBProvider.query("SELECT * FROM TABLE"));
  });
}