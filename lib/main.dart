
import 'package:consultant_app/views/DetailsScreen.dart';
import 'package:consultant_app/views/HomeScreen.dart';
import 'package:consultant_app/views/LoginScreen.dart';
import 'package:consultant_app/views/SplashScreen.dart';
import 'package:consultant_app/controllers/statuscontroller.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'controllers/hive_keys.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final applicationDocDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(applicationDocDir.path);
  await Hive.openBox(ApiKeys().hiveBoxName);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderStatus()),
      ],
      child: MyApp(),
    ),
  );
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