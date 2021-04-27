import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mephi_guide/data/database/db_provider.dart';
import 'package:mephi_guide/page.dart';
import 'package:mephi_guide/reminders/rem.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DBProvider.db.database;
  await DBProvider.db.addDummies();
  
  List<Map<String, dynamic>> res;
  
  //res = await DBProvider.rawQuery("SELECT * FROM lessons JOIN teachers_lessons ON lessons.id = teachers_lessons.idLesson JOIN teachers ON teachers_lessons.idTeacher = teachers.id");

  var rawGroup = await DBProvider.rawQuery("SELECT value FROM utility WHERE key = \"currentGroupID\"");

  int group = int.parse(rawGroup[0]['value']);

  print(group);

  //res = await DBProvider.rawQuery("SELECT id, name AS groupName FROM groups WHERE id = $group");
  /*
  res = await DBProvider.rawQuery(""
      "SELECT * FROM ("
      "SELECT * FROM groups_lessons WHERE idGroup = $group"
      ") JOIN lessons ON idLesson = lessons.id "
      "JOIN ("
      "SELECT id AS subjectId, name AS subjectName FROM subjects "
      ") ON subjectId = idSubject "
      "JOIN teachers_lessons ON lessons.id = teachers_lessons.idLesson "
      "JOIN ("
      "SELECT id as teacherId, name as teacherName FROM teachers "
      ") ON teacherId = teachers_lessons.idLesson "
      "");
  */
  res = await DBProvider.rawQuery(""
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
      "FROM cte_subject "
      "  JOIN teachers_lessons ON id = idLesson "
      "  JOIN ("
      "    SELECT id as teacherId, name as teacherName FROM teachers "
      "  ) ON idTeacher = teacherId"
      "),"
      "cte_groups AS ("
      " SELECT id, subjectName, teacherName, groupName, type, weekOdd, startTime, endTime "
      "FROM cte_teacher "
      "  JOIN groups_lessons ON id = idLesson "
      "  JOIN ("
      "    SELECT id as groupId, name as groupName FROM groups "
      "  ) ON idGroup = groupId"
      "),"
      "cte_places AS ("
      " SELECT id, subjectName, teacherName, groupName, placeName, type, weekOdd, startTime, endTime "
      "FROM cte_groups "
      "  JOIN places_lessons ON id = idLesson "
      "  JOIN ("
      "    SELECT id as placeId, name as placeName FROM places "
      "  ) ON idPlace = placeId"
      ")"
      "SELECT * FROM cte_places");

  print(res);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepPurple[910],
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //MenuController controller = MenuController();

  void initState() {
    super.initState();
    var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOs);

    FlutterLocalNotificationsPlugin().initialize(initSettings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) {
    return Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      print("payload = $payload");
      return build(context);
    }));
  }


  @override
  Widget build(BuildContext context) {

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    //NotificationScheduler().scheduleNotification("test", "lorem ipsum", DateTime.now().add(Duration(seconds: 5)), payload: 'aaa');
    return MyPage(content: RemindersTab());
      /*Scaffold(
      body: Center(
      child: Stack(
        children: <Widget>[
          RemindersTab(),
          Menu(controller: controller,),
        ],
      )

      ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButton: FloatingMenuButton(controller: controller,)

    );*/

  }
}

// TODO
// Progress:
// Implement tabs
// List in news
// Phones in database
// Group selection
//
// Improvements:
// Store reminder state in db along with reminder
// Remake buttons with OutlinedButton