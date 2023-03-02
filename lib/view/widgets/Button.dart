import 'package:flutter/material.dart';

import '../../utils/Constants.dart';
import '../HomeScreen.dart';

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()))
      },
      child: Container(
        // margin: const EdgeInsets.symmetric(horizontal: 50),
        padding: const EdgeInsets.only(top: 14, bottom: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [kLightPrimaryColor, kPrimaryColor],
          ),
        ),
        child: const Center(
          child: Text(
            "Login",
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
