import 'package:consultant_app/repositories/Inbox/inbox_api.dart';
import 'package:consultant_app/views/DetailsScreen.dart';
import 'package:consultant_app/views/HomeScreen.dart';
import 'package:consultant_app/views/LoginScreen.dart';
import 'package:consultant_app/views/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import 'controllers/hive_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final applicationDocDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(applicationDocDir.path);
  await Hive.openBox(ApiKeys().hiveBoxName);

  await InboxApi().createInbox("ttt", "ghghg", 1, "kjkjk",
      (DateTime.now()).toString(), "hjhj", 2, "", "", "");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var box = Hive.box(ApiKeys().hiveBoxName);
    // print(box.get("token"));
    // print(box.get("isLoggedIn"));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pal Mail',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: DetailsScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/Home': (context) => HomeScreen(),
        '/Login': (context) => LoginScreen(),
        '/Details': (context) => DetailsScreen(),
      },
    );
  }
}
