import 'package:consultant_app/repositories/Inbox/inbox_api.dart';
import 'package:consultant_app/services/main_services.dart';
import 'package:consultant_app/views/DetailsScreen.dart';
import 'package:consultant_app/views/HomeScreen.dart';
import 'package:consultant_app/views/LoginScreen.dart';
import 'package:consultant_app/views/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'controllers/hive_keys.dart';
import 'package:responsive_framework/responsive_framework.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final applicationDocDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(applicationDocDir.path);
  await Hive.openBox("myBox");

  // await InboxApi().createInbox("ttt","ghghg",1,"kjkjk",(DateTime.now()).toString(),"hjhj",2,"","","");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Box box = Hive.box("myBox");
    //print(box.get("roro"));
    // print(box.get("token"));
    // print(box.get("isLoggedIn"));
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child!),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),

      debugShowCheckedModeBanner: false,
      title: 'Pal Mail',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: DetailsScreen(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) =>  SplashScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/Home': (context) =>  HomeScreen(),
        '/Login': (context) =>  LoginScreen(),
        '/Details': (context) =>  DetailsScreen(),
      },
    );
  }
}