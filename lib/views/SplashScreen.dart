import 'package:consultant_app/services/main_services.dart';
import 'package:consultant_app/views/HomeScreen.dart';
import 'package:flutter/material.dart';
import '../controllers/hive_keys.dart';
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

  getTokenValue() async {
    var val = await ms.readFromHiveBox("token");
    token = val;
  }

  //token=val

  //print(val);

  @override
  void initState() {
    getTokenValue();
    //print(token);

    // getLoggedInState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(token);
    print("empty${token.toString().isEmpty ? "true" : "false"}");
    // print("test$token");
    // print(isLoggedIn);
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => token == "" ? LoginScreen() : HomeScreen()));
      //token == "" ? LoginScreen() : HomeScreen()
      // token!= null? HomeScreen():
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
                fontFamily: 'Gulzar',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
