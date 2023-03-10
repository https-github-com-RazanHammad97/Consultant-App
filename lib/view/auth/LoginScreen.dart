import 'package:consultant_app/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/Constants.dart';
import '../../views/widgets/sign_in_form_widget.dart';
import '../../views/widgets/sign_up_form_widget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthViewModel authModel = AuthViewModel();

  bool login = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kLightWhiteColor,
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  height: 300.h,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color(0xFF579BB1),
                        Color(0xFF152238),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(80.r),
                      bottomRight: Radius.circular(80.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 55.h, bottom: 29.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Image(
                            image: AssetImage('images/logo.png'),
                            height: 75.h,
                            width: 56.w,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Center(
                          child: Text(
                            authModel.authScreenTitle,
                            style: GoogleFonts.caveat(
                              fontSize: 32.sp,
                              color: const Color(0xFFFFF1DC),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(
                      top: 200.h,
                      // bottom: 132.h,
                      right: 30.w,
                      left: 30.w,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          AnimatedContainer(
                            width: 367.w,
                            height: login ? 560.h : 670.h,
                            duration: const Duration(
                              seconds: 2,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(59.r),
                              color: Colors.white,
                            ),
                            child: login ? signInForm() : signUpForm(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 50.w,
                    left: 50.w,
                    // bottom: 251,
                    top: 250.h,
                    child: Material(
                      elevation: 1,
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(22.r),
                      child: Container(
                        // height: 60.h,
                        width: 200.w,
                        child: Row(
                          children: [
                            AnimatedContainer(
                              width: login ? 200.w : 106.w,
                              decoration: BoxDecoration(
                                color: login
                                    ? const Color(0xFF579BB1)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(22.r),
                              ),
                              duration: const Duration(
                                seconds: 1,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    login = true;
                                  });
                                },
                                child: Text(
                                  'Login',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    color: login
                                        ? Colors.white
                                        : const Color(0xFF579BB1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            AnimatedContainer(
                              width: !login ? 210.w : 123.w,
                              duration: const Duration(
                                seconds: 1,
                              ),
                              decoration: BoxDecoration(
                                color: !login
                                    ? const Color(0xFF579BB1)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(22.r),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    login = !login;
                                  });
                                },
                                child: Text(
                                  'Sign Up',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    color: !login
                                        ? Colors.white
                                        : const Color(0xFF579BB1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
