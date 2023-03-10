import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  Button({required this.title, required this.onPressed});

  String title;
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        // margin: const EdgeInsets.symmetric(horizontal: 50),
        height: 60.h,
        width: 300.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.r),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF579BB1),
              Color(0xFF152238),
            ],
          ),
        ),
        child: Center(
            child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        )),
      ),
    );
  }
}
