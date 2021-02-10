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

  test('table creation test', (){
    addTable("reminder", {
    "id": "INTEGER PRIMARY KEY",
    "name": "TEXT",
    "fromDate": "TEXT",
    "toDate": "TEXT",
    "place": "TEXT",
    "textDescription": "TEXT",
    "idPlace": "INTEGER",
    });
  });
}

addTable(String name, Map<String, String> columns) {

  StringBuffer query = StringBuffer("CREATE TABLE $name (");

  for(MapEntry e in columns.entries){
    query.write("${e.key} ${e.value}, ");
  }

  String resultQuery = query.toString().substring(0, query.length - 2) + ")";

  print(resultQuery);
}