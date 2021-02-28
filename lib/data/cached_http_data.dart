
import 'package:http/http.dart' as http;
import 'package:mephi_guide/data/database/db_provider.dart';
import 'package:mephi_guide/data/http_list_data.dart';
import 'package:mephi_guide/data/model.dart';
import 'package:mephi_guide/data/reminders/reminder.dart';
import 'package:sqflite/sqflite.dart';

class CachedHttpData<T extends Model> extends HttpListData<T>
{
  final String table;
  final T Function(Map<String, dynamic>) jsonConvertFunction;

  CachedHttpData(this.table, this.jsonConvertFunction) : super(jsonConvertFunction)
  {
    outData.listen(saveToDatabase);
  }

  //Fires when you add from cache, fix!
  void saveToDatabase(List<T> data){

    DBProvider.insertAll(table, data, conflictAlgorithm: ConflictAlgorithm.replace);

  }

  @override
  Future<bool> loadData(String webPage, [http.Client client]) async {
    bool result = false;
    try {
      result = await super.loadData(webPage, client);
      //print("Success!" + result.toString());
    }
    catch(e){
      print(e);
    }

    if (!result){

      List<Model> l = [Reminder(
        id: 0,
        name: "0",
        fromDate: DateTime.now(),
        toDate: DateTime.now(),
        place: "0",
        text: "0",
        idPlace: 0,
      )];

      //Load last version from database
      DBProvider.query(table).then((value) =>
      //This fires saveToDatabase, fix!
          inData.add(// Somehow call the right method to convert the data
              //l.map((e) => e as T).toList()
              value.map((e) => jsonConvertFunction(e)).toList()
          )
      );
    }

    return result;
  }
}