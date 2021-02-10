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

  initDB() async {
    String path = await getDatabasesPath() + 'data';
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {

      addTable("reminder", {
        "id": "INTEGER PRIMARY KEY",
        "name": "TEXT",
        "from": "TEXT",
        "to": "TEXT",
        "place": "TEXT",
        "`text`": "TEXT",
        "idPlace": "INTEGER",
      });
    });
  }

  addTable(String name, Map<String, String> columns) async{
    final db = await database;

    StringBuffer query = StringBuffer("CREATE TABLE $name (");

    for(MapEntry e in columns.entries){
      query.write("${e.key} ${e.value}, ");
    }

    String resultQuery = query.toString().substring(0, query.length - 2) + ")";

    db.execute(resultQuery);
  }

  static Future<List<Map<String, dynamic>>> query(String table) async => _database.query(table);

  static Future<int> insert(String table, Model model) async =>
      await _database.insert(table, model.toMap());

  static Future<int> update(String table, Model model) async =>
      await _database.update(table, model.toMap(), where: 'id = ?', whereArgs: [model.id]);

  static Future<int> delete(String table, Model model) async =>
      await _database.delete(table, where: 'id = ?', whereArgs: [model.id]);
}