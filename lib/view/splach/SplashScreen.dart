import 'package:flutter/material.dart';

import '../../controllers/hive_keys.dart';
import '../../data/services/main_services.dart';
import '../../utils/Constants.dart';
import '../auth/LoginScreen.dart';
import '../home/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  dynamic token;
  MainServices ms = MainServices();
  ApiKeys ak = ApiKeys();

  getTokenValue() async {
    var val = await ms.readFromHiveBox("token");
    token = val;
  }

  @override
  void initState() {
    getTokenValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(
        "splash screen token ${ms.readFromHiveBox("token")}"); // this built twice
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return token == null ? LoginScreen() : HomeScreen();
      }));
    });
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [kPrimaryColor, kLightPrimaryColor],
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('images/logo.png'),
            ),
            Text(
              'ديوان رئيس الوزراء',
              style: TextStyle(
                fontSize: 31,
                color: Colors.white,
                fontFamily: 'Gulzar',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
