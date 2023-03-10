import 'package:consultant_app/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/repositories/Auth/auth_api.dart';
import '../../data/services/main_services.dart';
import '../../utils/Constants.dart';
import 'Button.dart';
import 'CustomText.dart';
import 'SocialIcons.dart';
import 'customTextField.dart';

class signInForm extends StatefulWidget {
  @override
  State<signInForm> createState() => _signInFormState();
}

class _signInFormState extends State<signInForm> {
   late final token;
  AuthViewModel authModel = AuthViewModel();
  MainServices ms = MainServices();
  AuthApi auth = AuthApi();

  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  @override
  void initState() {
    emailController;
    passController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 150.h,
          ),
          customTextField(
            authModel.emailTFHintText,
            false,
            preIcon: const Icon(Icons.email_outlined),
            controller: emailController,
          ),
          const SizedBox(
            height: 15,
          ),
          customTextField(
            authModel.passTFHint,
            true,
            preIcon: const Icon(
              Icons.lock_outline,
            ),
            // suffixIcon: const Icon(Icons.visibility_off_outlined),
            controller: passController,
          ),

          //customTextField('Confirm password'),
          const SizedBox(
            height: 40,
          ),
          Button(
            title: authModel.signInBtnText,
            onPressed: () async {
              print(passController.text);
              print(emailController.text);

           // token=  await auth.login("test67@test.net","123456");
              token=  await auth.login(emailController.text,passController.text);
             //ms.readFromHiveBox("token");
            print("Razan Token after Sign In $token");
           ms.saveToken(token);
              if(token!=""){

                if (mounted) {
                  Navigator.pushNamed(context, "/Home");
                }
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 25.w,
                    right: 25.w,
                  ),
                  child: const Divider(
                    thickness: 1.4,
                  ),
                ),
              ),
              CustomText(
                authModel.orText,
                14,
                'Poppins',
                kHintGreyColor,
                FontWeight.w400,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 25.w,
                    left: 25.w,
                  ),
                  child: const Divider(
                    thickness: 1.4,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const SocialIcons(),
        ],
      ),
    );
  }
}
