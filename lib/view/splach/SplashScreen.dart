import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../../controllers/hive_keys.dart';
import '../../data/services/main_services.dart';
import '../auth/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = false;
  dynamic token;

  MainServices ms = MainServices();
  ApiKeys ak = ApiKeys();

  getTokenValue() async {
    Box box = Hive.box("myBox");
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
    // print(
    //     "splash screen token ${ms.readFromHiveBox("token")}"); // this built twice
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => token == null ? LoginScreen() : LoginScreen(),
          ),
        );
        //token == "" ? LoginScreen() : HomeScreen()
        // token!= null? HomeScreen():
      },
    );
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF579BB1),
              Color(0xFF152238),
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/logo.png'),
            ),
            Text(
              'Complaints App',
              style: GoogleFonts.caveat(
                fontSize: 50.sp,
                color: const Color(0xFFFFF1DC),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
