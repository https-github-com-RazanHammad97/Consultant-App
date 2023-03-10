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

class signUpForm extends StatefulWidget {
  @override
  State<signUpForm> createState() => _signUpFormState();
}

class _signUpFormState extends State<signUpForm> {
  AuthApi auth = AuthApi();
  AuthViewModel authModel = AuthViewModel();
  MainServices ms = MainServices();
  TextEditingController? controller_email = TextEditingController();
  TextEditingController? controller_pass = TextEditingController();
  TextEditingController? controller_confirm_pass = TextEditingController();
  TextEditingController? controller_userName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (BuildContext context, snapshot) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 150.h,
            ),
            customTextField(
              authModel.userNameTFHint,
              false,
              preIcon: Icon(Icons.edit_outlined),
              controller: controller_userName,
            ),
            const SizedBox(
              height: 15,
            ),
            customTextField(
              authModel.emailTFHintText,
              false,
              preIcon: const Icon(Icons.email_outlined),
              controller: controller_email,
            ),
            const SizedBox(
              height: 15,
            ),
            customTextField(
              authModel.passTFHint,
              true,
              preIcon: const Icon(Icons.lock_outline),
              controller: controller_pass,
            ),
            const SizedBox(
              height: 15,
            ),
            customTextField(
              authModel.confirmPassTFHint,
              true,
              preIcon: const Icon(Icons.lock_outline),
              controller: controller_confirm_pass,
            ),
            SizedBox(
              height: 30.h,
            ),

            Button(
              onPressed: () async {
                var token = await auth.register(controller_email!.text,
                    controller_pass!.text, controller_userName!.text);
                print(token);
                // ms.saveToken(token!);
                print("token value after sign up$token");
                if (token != null) {
                  ms.saveToken(token);
                  if (mounted) {
                    Navigator.pushNamed(context, "/Home");
                  }
                }
              },
              title: authModel.signUpBtnText,
            ),
            // print(1);

            // FutureBuilder(
            //   future: uc.Register(controller_email!.text,controller_pass!.text!,"test"),
            //   builder: (BuildContext context, AsyncSnapshot<dynamic>snapshot) {
            //     print(2);
            //     print(snapshot.error);
            //   //return SizedBox();
            //   if(snapshot.hasData){
            //      return HomeScreen();
            //   }
            //   else{
            //     return LoginScreen();
            //   }
            // },);
            SizedBox(
              height: 15.h,
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
    });
  }
}
