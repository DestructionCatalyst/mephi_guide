import 'dart:async';

import 'package:mephi_guide/data/model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {

  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database _database;
  Future<Database> get database async {
    if (_database != null)
      return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  //Разобраться с onOpen и onCreate!
  initDB() async {
    String path = await getDatabasesPath() + 'data';
    var db = await openDatabase(path, version: 1, onOpen: (db) async {
    }, onCreate: (Database db, int version) async {
      /*await addTable("reminder", {
        "id": "INTEGER PRIMARY KEY",
        "name": "TEXT",
        "fromDate": "TEXT",
        "toDate": "TEXT",
        "place": "TEXT",
        "textDescription": "TEXT",
        "idPlace": "INTEGER",
      });*/

      //Why tf this works, but function up here doesnt
      //Solved - I'm an idiot, function causes a deadlock, have to pass 'db' as its parameter
      await db.execute('CREATE TABLE reminder (id INTEGER PRIMARY KEY, name TEXT, `from` TEXT, `to` TEXT, place TEXT, `text` TEXT, idPlace INTEGER)');
      print("Table created!");
    });
    print("DB created/loaded!");
    return db;
  }

  addTable(String name, Map<String, String> columns) async{
    final db = await database;

    StringBuffer query = StringBuffer("CREATE TABLE $name (");

    for(MapEntry e in columns.entries){
      query.write("${e.key} ${e.value}, ");
    }

    String resultQuery = query.toString().substring(0, query.length - 2) + ")";

    print(resultQuery);

    db.execute(resultQuery);
  }

  static Future<List<Map<String, dynamic>>> query(String table) async => _database.query(table);

  static Future<int> insert(String table, Model model, {ConflictAlgorithm conflictAlgorithm}) async =>
      await _database.insert(table, model.toMap(), conflictAlgorithm: conflictAlgorithm);

  static void insertAll(String table, Iterable<Model> models, {ConflictAlgorithm conflictAlgorithm}) async {
    for (Model m in models){
      await _database.insert(table, m.toMap(), conflictAlgorithm: conflictAlgorithm);
    }
  }

  static Future<int> update(String table, Model model) async =>
      await _database.update(table, model.toMap(), where: 'id = ?', whereArgs: [model.id]);

  static Future<int> delete(String table, Model model) async =>
      await _database.delete(table, where: 'id = ?', whereArgs: [model.id]);

  static void deleteAll(String table) async =>
      await _database.execute("DELETE FROM $table");
}