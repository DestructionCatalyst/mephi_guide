import 'dart:async';

import 'package:mephi_guide/data/model.dart';
import 'package:mephi_guide/data/navigation/place.dart';
import 'package:mephi_guide/data/timetable/lesson.dart';
import 'package:mephi_guide/data/timetable/notification.dart';
import 'package:mephi_guide/data/timetable/subject.dart';
import 'package:mephi_guide/data/timetable/teacher.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {

  static const String loremIpsum = 'Lorem ipsum dolor sit amet, consectetur '
      'adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore'
      ' magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco'
      ' laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor '
      'in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla '
      'pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa '
      'qui officia deserunt mollit anim id est laborum. ';

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

    await addTable(db, 'notifications', {
      "id": "INTEGER PRIMARY KEY",
      "idLesson": "INTEGER",
      "name": "TEXT",
      "note": "TEXT",
      "notificationTime": "DATETIME"
    });

    await addTable(db, 'utility', {
      "key": "TEXT PRIMARY KEY",
      "value": "TEXT"
    });

    await initUtilities(db);
  }

  Future initUtilities(db) async {
    await db.insert('utility', {"key": "currentGroupID", "value": "0"}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await db.insert('utility', {"key": "currentInstitutionID", "value": "0"}, conflictAlgorithm: ConflictAlgorithm.ignore);
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

  addTimetable() async{
    await insert('lessons', Lesson(
      id: 10,
      idSubject: 10,
      //dm
      type: 0,
      weekOdd: 0,
      startTime: DateTime(2021, 5, 24, 8, 30),
      endTime: DateTime(2021, 5, 24, 10, 5),
    ),
        conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('lessons', Lesson(
      id: 11,
      idSubject: 11,
      //diiu
      type: 0,
      weekOdd: 0,
      startTime: DateTime(2021, 5, 24, 10, 15),
      endTime: DateTime(2021, 5, 24, 11, 50),
    ),
        conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('lessons', Lesson(
      id: 12,
      idSubject: 12,
      //osis
      type: 2,
      weekOdd: 0,
      startTime: DateTime(2021, 5, 24, 11, 55),
      endTime: DateTime(2021, 5, 24, 13, 30),
    ),
        conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('lessons', Lesson(
      id: 13,
      idSubject: 13,
      //f-ra
      type: 0,
      weekOdd: 0,
      startTime: DateTime(2021, 5, 24, 14, 30),
      endTime: DateTime(2021, 5, 24, 16, 5),
    ),
        conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('lessons', Lesson(
      id: 14,
      idSubject: 14,
      //pp
      type: 0,
      weekOdd: 0,
      startTime: DateTime(2021, 5, 24, 16, 15),
      endTime: DateTime(2021, 5, 24, 17, 50),
    ),
        conflictAlgorithm: ConflictAlgorithm.ignore);

    await insert('lessons', Lesson(
      id: 15,
      idSubject: 15,// tfcv
      type: 1,
      weekOdd: 0,
      startTime: DateTime(2021, 5, 25, 11, 55),
      endTime: DateTime(2021, 5, 25, 13, 30),
    ),
        conflictAlgorithm: ConflictAlgorithm.ignore);

    await insert('lessons', Lesson(
      id: 16,
      idSubject: 11,
      type: 1,
      weekOdd: 0,
      startTime: DateTime(2021, 5, 26, 9, 20),
      endTime: DateTime(2021, 5, 26, 11, 50),
    ),
        conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('lessons', Lesson(
      id: 17,
      idSubject: 12,
      type: 1,
      weekOdd: 0,
      startTime: DateTime(2021, 5, 26, 11, 55),
      endTime: DateTime(2021, 5, 26, 13, 30),
    ),
        conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('lessons', Lesson(
      id: 18,
      idSubject: 16, //phys
      type: 1,
      weekOdd: 0,
      startTime: DateTime(2021, 5, 26, 14, 30),
      endTime: DateTime(2021, 5, 26, 16, 5),
    ),
        conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('lessons', Lesson(
      id: 19,
      idSubject: 10,
      type: 1,
      weekOdd: 0,
      startTime: DateTime(2021, 5, 26, 16, 15),
      endTime: DateTime(2021, 5, 26, 17, 50),
    ),
        conflictAlgorithm: ConflictAlgorithm.ignore);

    await insert('lessons', Lesson(
      id: 20,
      idSubject: 17, //eng
      type: 0,
      weekOdd: 0,
      startTime: DateTime(2021, 5, 27, 10, 15),
      endTime: DateTime(2021, 5, 27, 11, 50),
    ),
        conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('lessons', Lesson(
      id: 21,
      idSubject: 18,//tv
      type: 1,
      weekOdd: 0,
      startTime: DateTime(2021, 5, 27, 11, 55),
      endTime: DateTime(2021, 5, 27, 13, 30),
    ),
        conflictAlgorithm: ConflictAlgorithm.ignore);

    await insert('lessons', Lesson(
      id: 22,
      idSubject: 15,
      type: 3,
      weekOdd: 0,
      startTime: DateTime(2021, 5, 28, 11, 55),
      endTime: DateTime(2021, 5, 28, 14, 20),
    ),
        conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('lessons', Lesson(
      id: 23,
      idSubject: 11,
      type: 3,
      weekOdd: 0,
      startTime: DateTime(2021, 5, 28, 14, 30),
      endTime: DateTime(2021, 5, 28, 17, 0),
    ),
        conflictAlgorithm: ConflictAlgorithm.ignore);

    await insert('lessons', Lesson(
      id: 24,
      idSubject: 18,//tv
      type: 4,
      weekOdd: 0,
      startTime: DateTime(2021, 5, 29, 11, 55),
      endTime: DateTime(2021, 5, 29, 14, 20),
    ),
        conflictAlgorithm: ConflictAlgorithm.replace);

    await insert('places', Place(id: 1000, name: 'ДОТ', x: 0, y: 0), conflictAlgorithm: ConflictAlgorithm.ignore);

    await insert('teachers', Teacher(id: 10, name: "Маренков А.В."), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('teachers', Teacher(id: 11, name: "Костин А.Б."), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('teachers', Teacher(id: 12, name: "Суставов С.А."), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('teachers', Teacher(id: 404, name: ""), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('teachers', Teacher(id: 13, name: "Демидов Д.В."), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('teachers', Teacher(id: 14, name: "Немешаев С.А."), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('teachers', Teacher(id: 15, name: "Никифоров А.Ю."), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('teachers', Teacher(id: 16, name: "Самсонович А."), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('teachers', Teacher(id: 17, name: "Трофимов А.Г."), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('teachers', Teacher(id: 18, name: "Шапкин П.А."), conflictAlgorithm: ConflictAlgorithm.ignore);

    await insert('teachers', Teacher(id: 19, name: "Теляковский Д.С."), conflictAlgorithm: ConflictAlgorithm.ignore);

    await insert('teachers', Teacher(id: 20, name: "Камынин В.Л."), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('teachers', Teacher(id: 21, name: "Овсянникова Н.В."), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('teachers', Teacher(id: 22, name: "Елютин С.О."), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('teachers', Teacher(id: 23, name: "Рословцев В.В."), conflictAlgorithm: ConflictAlgorithm.ignore);

    await insert('teachers', Teacher(id: 24, name: "Агамова О.Д."), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('teachers', Teacher(id: 25, name: "Акишина Л.С."), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('teachers', Teacher(id: 26, name: "Брызгалова С.А."), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('teachers', Teacher(id: 27, name: "Макарова А.А."), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('teachers', Teacher(id: 28, name: "Хачатурова Э.Г."), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('teachers', Teacher(id: 29, name: "Сумин С.В."), conflictAlgorithm: ConflictAlgorithm.ignore);

    await insert('subjects', Subject(id: 10, name: "Дискретная математика (логические исчисления)"), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('subjects', Subject(id: 11, name: "Дифференциальные и интегральные уравнения"), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('subjects', Subject(id: 12, name: "Операционные системы и сети"), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('subjects', Subject(id: 13, name: "Физическая культура (элективная дисциплина)"), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('subjects', Subject(id: 14, name: "Проектная практика"), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('subjects', Subject(id: 15, name: "Теория функций комплексного переменного"), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('subjects', Subject(id: 16, name: "Общая физика (волны и оптика)"), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('subjects', Subject(id: 17, name: "Иностранный язык"), conflictAlgorithm: ConflictAlgorithm.ignore);
    await insert('subjects', Subject(id: 18, name: "Теория вероятностей и математическая статистика"), conflictAlgorithm: ConflictAlgorithm.ignore);

    await insertMap('teachers_lessons', {"idTeacher": 10, "idLesson": 10}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('teachers_lessons', {"idTeacher": 11, "idLesson": 11}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('teachers_lessons', {"idTeacher": 12, "idLesson": 12}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('teachers_lessons', {"idTeacher": 404, "idLesson": 13}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('teachers_lessons', {"idTeacher": 13, "idLesson": 14}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('teachers_lessons', {"idTeacher": 14, "idLesson": 14}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('teachers_lessons', {"idTeacher": 15, "idLesson": 14}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('teachers_lessons', {"idTeacher": 16, "idLesson": 14}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('teachers_lessons', {"idTeacher": 17, "idLesson": 14}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('teachers_lessons', {"idTeacher": 18, "idLesson": 14}, conflictAlgorithm: ConflictAlgorithm.ignore);

    await insertMap('teachers_lessons', {"idTeacher": 19, "idLesson": 15}, conflictAlgorithm: ConflictAlgorithm.ignore);

    await insertMap('teachers_lessons', {"idTeacher": 20, "idLesson": 16}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('teachers_lessons', {"idTeacher": 21, "idLesson": 17}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('teachers_lessons', {"idTeacher": 22, "idLesson": 18}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('teachers_lessons', {"idTeacher": 23, "idLesson": 19}, conflictAlgorithm: ConflictAlgorithm.ignore);

    await insertMap('teachers_lessons', {"idTeacher": 24, "idLesson": 20}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('teachers_lessons', {"idTeacher": 25, "idLesson": 20}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('teachers_lessons', {"idTeacher": 26, "idLesson": 20}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('teachers_lessons', {"idTeacher": 27, "idLesson": 20}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('teachers_lessons', {"idTeacher": 28, "idLesson": 20}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('teachers_lessons', {"idTeacher": 29, "idLesson": 21}, conflictAlgorithm: ConflictAlgorithm.ignore);

    await insertMap('teachers_lessons', {"idTeacher": 11, "idLesson": 22}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('teachers_lessons', {"idTeacher": 11, "idLesson": 23}, conflictAlgorithm: ConflictAlgorithm.ignore);

    await insertMap('teachers_lessons', {"idTeacher": 29, "idLesson": 24}, conflictAlgorithm: ConflictAlgorithm.ignore);

    for (int i = 10; i <= 24; i++)
      await insertMap('groups_lessons', {"idGroup": 1, "idLesson": i}, conflictAlgorithm: ConflictAlgorithm.ignore);

    await insertMap('places_lessons', {"idPlace": 9, "idLesson": 10}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('places_lessons', {"idPlace": 9, "idLesson": 11}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('places_lessons', {"idPlace": 9, "idLesson": 12}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('places_lessons', {"idPlace": 26, "idLesson": 13}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('places_lessons', {"idPlace": 9, "idLesson": 14}, conflictAlgorithm: ConflictAlgorithm.ignore);

    await insertMap('places_lessons', {"idPlace": 1000, "idLesson": 15}, conflictAlgorithm: ConflictAlgorithm.ignore);

    await insertMap('places_lessons', {"idPlace": 1000, "idLesson": 16}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('places_lessons', {"idPlace": 1000, "idLesson": 17}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('places_lessons', {"idPlace": 1000, "idLesson": 18}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('places_lessons', {"idPlace": 1000, "idLesson": 19}, conflictAlgorithm: ConflictAlgorithm.ignore);

    await insertMap('places_lessons', {"idPlace": 1000, "idLesson": 20}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('places_lessons', {"idPlace": 1000, "idLesson": 21}, conflictAlgorithm: ConflictAlgorithm.ignore);

    await insertMap('places_lessons', {"idPlace": 3, "idLesson": 22}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('places_lessons', {"idPlace": 3, "idLesson": 23}, conflictAlgorithm: ConflictAlgorithm.ignore);

    await insertMap('places_lessons', {"idPlace": 1000, "idLesson": 24}, conflictAlgorithm: ConflictAlgorithm.ignore);
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

    await insert('lessons', Lesson(
      id: 2,
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
    await insertMap('teachers_lessons', {"idTeacher": 2, "idLesson": 2}, conflictAlgorithm: ConflictAlgorithm.ignore);

    await insertMap('groups_lessons', {"idGroup": 1, "idLesson": 0}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('groups_lessons', {"idGroup": 2, "idLesson": 1}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('groups_lessons', {"idGroup": 3, "idLesson": 0}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('groups_lessons', {"idGroup": 1, "idLesson": 2}, conflictAlgorithm: ConflictAlgorithm.ignore);

    await insertMap('places_lessons', {"idPlace": 0, "idLesson": 0}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('places_lessons', {"idPlace": 1, "idLesson": 0}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('places_lessons', {"idPlace": 2, "idLesson": 1}, conflictAlgorithm: ConflictAlgorithm.ignore);
    await insertMap('places_lessons', {"idPlace": 2, "idLesson": 2}, conflictAlgorithm: ConflictAlgorithm.ignore);

    await insertMap('notifications', {'id': 0, 'idLesson':10, 'name': 'test',
      'note': loremIpsum, 'notificationTime': DateTime.now().add(Duration(seconds: 30)).toIso8601String()}, conflictAlgorithm: ConflictAlgorithm.ignore);
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

  static Future<List<Map<String, dynamic>>> queryLessonNotifications(int lessonId) async =>
    await _database.query('notifications', where: "idLesson = ?", whereArgs: [lessonId]);

  static Future<int> queryLastId(String table) async{
    var queryResult = await _database.rawQuery("SELECT MAX(id) FROM $table");

    return queryResult[0]['MAX(id)'];
  }

  static Future<bool> notificationExists(MyNotification notification) async{
    var queryResult = _database.rawQuery("SELECT EXISTS(SELECT 1 FROM notifications WHERE id=${notification.id})");
    print("result = $queryResult");
    return false;
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


  static Future<List<Map<String, dynamic>>> queryCurrentLessons() async{
    var rawGroup = await DBProvider.rawQuery("SELECT value FROM utility WHERE key = \"currentGroupID\"");

    int group = int.parse(rawGroup[0]['value']);

    print(group);

    var res = await DBProvider.rawQuery(""
        "WITH cte_lesson AS ("
        "  SELECT id, idSubject, type, weekOdd, startTime, endTime FROM ("
        "    SELECT * FROM groups_lessons WHERE idGroup = $group "
        "  ) JOIN lessons ON idLesson = lessons.id "
        "), "
        "cte_subject AS ("
        "  SELECT id, subjectName, type, weekOdd, startTime, endTime FROM cte_lesson JOIN ("
        "    SELECT id AS subjectId, name AS subjectName FROM subjects "
        "  ) ON subjectId = idSubject "
        "),"
        "cte_teacher AS ("
        "  SELECT id, subjectName, teacherName, type, weekOdd, startTime, endTime "
        "  FROM cte_subject "
        "  JOIN teachers_lessons ON id = idLesson "
        "  JOIN ("
        "    SELECT id as teacherId, name as teacherName FROM teachers "
        "  ) ON idTeacher = teacherId"
        "),"
        "cte_groups AS ("
        "  SELECT id, subjectName, teacherName, groupName, type, weekOdd, startTime, "
        "  endTime FROM cte_teacher "
        "  JOIN groups_lessons ON id = idLesson "
        "  JOIN ("
        "    SELECT id as groupId, name as groupName FROM groups "
        "  ) ON idGroup = groupId"
        "),"
        "cte_places AS ("
        "  SELECT id, subjectName, teacherName, groupName, placeName, type, weekOdd, "
        "  startTime, endTime FROM cte_groups "
        "  JOIN places_lessons ON id = idLesson "
        "  JOIN ("
        "    SELECT id as placeId, name as placeName FROM places "
        "  ) ON idPlace = placeId"
        "),"
        "cte_time AS ("
        " SELECT DATETIME('now') AS currentTime"
        ")"
        "SELECT id, subjectName, "
        " GROUP_CONCAT(DISTINCT teacherName) AS teachers,"
        " GROUP_CONCAT(DISTINCT groupName) AS groups,"
        " GROUP_CONCAT(DISTINCT placeName) AS places, "
        " type, weekOdd, startTime, endTime "
        "FROM cte_places JOIN cte_time WHERE strftime('%W', startTime) = strftime('%W', currentTime) GROUP BY id ORDER BY startTime");

    return res;
  }
}