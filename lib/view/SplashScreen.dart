import 'package:flutter/material.dart';

import '../utils/Constants.dart';
import 'LoginScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
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
