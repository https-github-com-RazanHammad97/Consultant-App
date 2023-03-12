import 'package:consultant_app/repositories/Admin/Users/user_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/Constants.dart';
import '../../../views/widgets/Button.dart';
import '../../../views/widgets/customTextField.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passConfirmController = TextEditingController();
  TextEditingController usernameControlelr = TextEditingController();
  UserApi uApi = UserApi();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kLightWhiteColor,
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            color: kLightWhiteColor,
          ),
          child: Stack(
            children: [
              Container(
                width: double.infinity.w,
                height: 300.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40.r),
                    bottomLeft: Radius.circular(40.r),
                  ),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF579BB1),
                      Color(0xFF152238),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 40.h,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_sharp,
                        color: kLightWhiteColor,
                      ),
                    ),
                    SizedBox(
                      width: 70.w,
                    ),
                    Text(
                      'Create New User',
                      style: GoogleFonts.poppins(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        color: kLightWhiteColor,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 190.h,
                right: 20.w,
                left: 20.w,
                child: SingleChildScrollView(
                  child: Container(
                    height: 550.h,
                    width: 370.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        33.r,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          height: 50.h,
                        ),
                        customTextField(
                          "Username",
                          false,
                          preIcon: const Icon(Icons.edit_outlined),
                          controller: usernameControlelr,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        customTextField(
                          "Email",
                          false,
                          preIcon: const Icon(Icons.email_outlined),
                          controller: emailController,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        customTextField(
                          "Password",
                          true,
                          preIcon: const Icon(
                            Icons.lock_outline,
                          ),
                          controller: passwordController,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        customTextField(
                          "Confirm Password",
                          false,
                          preIcon: const Icon(
                            Icons.lock_outline,
                          ),
                          controller: passConfirmController,
                        ),
                        SizedBox(
                          height: 45.h,
                        ),
                        Button(
                          title: 'Create',
                          onPressed: () async {
                            var response = await uApi.createNewUSer(
                                emailController.text,
                                passwordController.text,
                                usernameControlelr.text);
                            print(response);
                            if (response.toString().contains("user")) {
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("User Created Successfully"),
                                  ),
                                );
                                //Navigator.pushNamed(context, "/users");
                                emailController.clear();
                                passwordController.clear();
                                usernameControlelr.clear();
                                passConfirmController.clear();
                                Navigator.pushNamed(context, "/Admin/Users");
                              }
                            } else {
                              if (mounted) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("$response"),
                                ));
                              }
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
