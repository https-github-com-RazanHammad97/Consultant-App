
import 'package:consultant_app/views/HomeScreen.dart';
import 'package:flutter/material.dart';
import '../controllers/hive_keys.dart';
import '../data/services/main_services.dart';
import '../utils/Constants.dart';
import 'LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = false;
  dynamic token = "";

  MainServices ms = MainServices();
  ApiKeys ak = ApiKeys();

  // getLoggedInState() async {
  //   await ms.getLoggedInUserState().then((value) {
  //     print("val:$value");
  //     setState(() {
  //       isLoggedIn = value!;
  //     });
  //   });

  dynamic getTokenValue() async{
   dynamic val = await ms.readFromHiveBox("token");
   print(val);
   return val;
  }
  @override
  void initState() {
    token = getTokenValue();
    // getLoggedInState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(isLoggedIn);
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => token
          !=null?HomeScreen(): LoginScreen()));
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
