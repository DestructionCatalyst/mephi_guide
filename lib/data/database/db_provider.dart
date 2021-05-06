import 'dart:async';

import 'package:mephi_guide/data/model.dart';
import 'package:mephi_guide/data/navigation/place.dart';
import 'package:mephi_guide/data/timetable/lesson.dart';
import 'package:mephi_guide/data/timetable/subject.dart';
import 'package:mephi_guide/data/timetable/teacher.dart';
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
      await addTables(db);

      initUtilities();

      print("Tables created!");
    });
    print("DB created/loaded!");
    return db;
  }

  Future addTables(Database db) async {
    await addTable(db, "reminders", {
      "id": "INTEGER PRIMARY KEY",
      "name": "TEXT",
      "`from`": "TEXT",
      "`to`": "TEXT",
      "place": "TEXT",
      "`text`": "TEXT",
      "idPlace": "INTEGER",
    });

    await addTable(db, "news", {
      "id": "INTEGER PRIMARY KEY",
      "name": "TEXT",
      "institution": "INTEGER",
      "t": "TEXT",
      "place": "TEXT",
      "`text`": "TEXT",
      "topImg": "TEXT",
      "idPlace": "INTEGER",
    });

    await addTable(db, 'groups', {
      "id": "INTEGER PRIMARY KEY",
      "name": "TEXT",
      "institution": "INTEGER",
    });

    await addTable(db, 'lessons', {
      "id": "INTEGER PRIMARY KEY",
      "idSubject": "INTEGER",
      "type": "INTEGER",
      "weekOdd": "INTEGER",
      "startTime": "DATETIME",
      "endTime": "DATETIME"
    });

    await addTable(db, 'places', {
      "id": "INTEGER PRIMARY KEY",
      "name": "TEXT",
      "x": "INTEGER",
      "y": "INTEGER"
    });

    await addTable(db, 'subjects', {
      "id": "INTEGER PRIMARY KEY",
      "name": "TEXT"
    });

    await addTable(db, 'teachers', {
      "id": "INTEGER PRIMARY KEY",
      "name": "TEXT"
    });

    await addTable(db, 'teachers_lessons', {
      "idTeacher": "INTEGER",
      "idLesson": "INTEGER",
      "CONSTRAINT pk": "PRIMARY KEY (idTeacher, idLesson)",
    });

    await addTable(db, 'groups_lessons', {
      "idGroup": "INTEGER",
      "idLesson": "INTEGER",
      "CONSTRAINT pk": "PRIMARY KEY (idGroup, idLesson)",
    });

    await addTable(db, 'places_lessons', {
      "idPlace": "INTEGER",
      "idLesson": "INTEGER",
      "CONSTRAINT pk": "PRIMARY KEY (idPlace, idLesson)",
    });

    await addTable(db, 'utility', {
      "key": "TEXT PRIMARY KEY",
      "value": "TEXT"
    });
  }

  Future initUtilities() async {
    await insertMap('utility', {"key": "currentGroupID", "value": "0"}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('utility', {"key": "currentInstitutionID", "value": "0"}, conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  addTable(Database db, String name, Map<String, String> columns) async{

    StringBuffer query = StringBuffer("CREATE TABLE $name (");

    for(MapEntry e in columns.entries){
      query.write("${e.key} ${e.value}, ");
    }

    String resultQuery = query.toString().substring(0, query.length - 2) + ")";

    print(resultQuery);

    db.execute(resultQuery);
  }

  addDummies() async{
    await insert('lessons', Lesson(
      id: 0,
      idSubject: 0,
      type: 0,
      weekOdd: 0,
      startTime: DateTime.now(),
      endTime: DateTime.now(),
    ),
    conflictAlgorithm: ConflictAlgorithm.ignore);

    await insert('lessons', Lesson(
      id: 1,
      idSubject: 1,
      type: 0,
      weekOdd: 0,
      startTime: DateTime.now(),
      endTime: DateTime.now(),
    ),
        conflictAlgorithm: ConflictAlgorithm.ignore);

    await insert('places', Place(id: 0, name: 'test', x: 0, y: 0), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('places', Place(id: 1, name: 'more test', x: 0, y: 0), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('places', Place(id: 2, name: 'not test', x: 0, y: 0), conflictAlgorithm: ConflictAlgorithm.ignore);

    await insert('teachers', Teacher(id: 0, name: "Tester"), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('teachers', Teacher(id: 1, name: "Another Tester"), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('teachers', Teacher(id: 2, name: "Not a Tester"), conflictAlgorithm: ConflictAlgorithm.ignore);

    await insert('subjects', Subject(id: 0, name: "Testing"), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('subjects', Subject(id: 1, name: "Not testing"), conflictAlgorithm: ConflictAlgorithm.ignore);

    await insertMap('teachers_lessons', {"idTeacher": 0, "idLesson": 0}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('teachers_lessons', {"idTeacher": 1, "idLesson": 0}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('teachers_lessons', {"idTeacher": 2, "idLesson": 1}, conflictAlgorithm: ConflictAlgorithm.ignore);

    await insertMap('groups_lessons', {"idGroup": 1, "idLesson": 0}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('groups_lessons', {"idGroup": 2, "idLesson": 1}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('groups_lessons', {"idGroup": 3, "idLesson": 0}, conflictAlgorithm: ConflictAlgorithm.ignore);

    await insertMap('places_lessons', {"idPlace": 0, "idLesson": 0}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('places_lessons', {"idPlace": 1, "idLesson": 0}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('places_lessons', {"idPlace": 2, "idLesson": 1}, conflictAlgorithm: ConflictAlgorithm.ignore);

    await insertMap('utility', {"key": "currentGroupID", "value": "1"}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('utility', {"key": "currentInstitutionID", "value": "5"}, conflictAlgorithm: ConflictAlgorithm.ignore);


  }

  static Future<List<Map<String, dynamic>>> query(String table) async => _database.query(table);

  static Future<List<Map<String, dynamic>>> rawQuery(String query) async => _database.rawQuery(query);

  static Future<String> queryUtilityValue(String key) async {
    var queryResult = await _database.rawQuery(
        "SELECT value FROM utility WHERE key = \"$key\"");

    return queryResult[0]['value'];
  }

  static Future<String> queryCurrentGroupName() async{
    String strId = await DBProvider.queryUtilityValue("currentGroupID");
    int id = int.parse(strId);

    if (id == 0)
      return "(Гость)";

    var queryResult = await _database.query('groups', columns: ["name"], where: "id = ?", whereArgs: [id]);

    return queryResult[0]['name'];
  }

  static Future<int> insert(String table, Model model, {ConflictAlgorithm conflictAlgorithm}) async =>
      await _database.insert(table, model.toMap(), conflictAlgorithm: conflictAlgorithm);

  static Future<int> insertMap(String table, Map<String, dynamic> map, {ConflictAlgorithm conflictAlgorithm}) async =>
      await _database.insert(table, map, conflictAlgorithm: conflictAlgorithm);

  static void insertAll(String table, Iterable<Model> models, {ConflictAlgorithm conflictAlgorithm}) async {
    for (Model m in models){
      await _database.insert(table, m.toMap(), conflictAlgorithm: conflictAlgorithm);
    }
  }

  static Future<int> update(String table, Model model) async =>
      await _database.update(table, model.toMap(), where: 'id = ?', whereArgs: [model.id]);

  static Future<int> updateUtilityValue(String key, String value) async =>
      await _database.update('utility', {"value": value}, where: 'key = ?', whereArgs: [key]);

  static Future<int> delete(String table, Model model) async =>
      await _database.delete(table, where: 'id = ?', whereArgs: [model.id]);

  static void deleteAll(String table) async =>
      await _database.execute("DELETE FROM $table");
}