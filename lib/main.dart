import 'package:consultant_app/view/DetailsScreen.dart';
import 'package:consultant_app/view/HomeScreen.dart';
import 'package:consultant_app/view/LoginScreen.dart';
import 'package:consultant_app/view/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
        '/': (context) => const SplashScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/Home': (context) => const HomeScreen(),
        '/Login': (context) => const LoginScreen(),
        '/Details': (context) => const DetailsScreen(),
      },
    );
  }
}
