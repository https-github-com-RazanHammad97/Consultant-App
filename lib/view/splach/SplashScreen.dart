import 'package:consultant_app/view/home/HomeScreen.dart';
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
    // AuthApi().login("test67@test.net", "123456");
    // AuthApi().register("test6lk;k7@test.net", "123456","123456");
    print(
        "Razan splash screen token ${ms.readFromHiveBox("token")}"); // this built twice
    // print(token==null ? "null token" : "token isn't null");
    // print("test$token");
    // print(isLoggedIn);

    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => token == null ? LoginScreen() : HomeScreen(),
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
              image: AssetImage('assets/images/logo.jpg'),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'Complaints App',
              style: GoogleFonts.nunito(
                fontSize: 45.sp,
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
