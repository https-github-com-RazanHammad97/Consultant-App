import 'package:consultant_app/view/auth/LoginScreen.dart';
import 'package:consultant_app/view/details/DetailsScreen.dart';
import 'package:consultant_app/view/details/DetailsVM.dart';
import 'package:consultant_app/view/home/HomeScreen.dart';
import 'package:consultant_app/view/home/HomeVM.dart';
import 'package:consultant_app/view/splach/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeVM(),
        ),
        ChangeNotifierProvider(
          create: (_) => DetailsVM(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pal Mail',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          // '/': (context) => ExpansionTileSample(),
          '/': (context) => const SplashScreen(),
          '/Login': (context) => const LoginScreen(),
          '/Home': (context) => HomeScreen(),
          '/Details': (context) => DetailsScreen(),
        },
      ),
    );
  }
}
