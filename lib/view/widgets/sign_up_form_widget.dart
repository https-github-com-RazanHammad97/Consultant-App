import 'package:consultant_app/view_models/auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            const SizedBox(
              height: 16,
            ),
            customTextField(
              authModel.emailTFHintText,
              false,
              controller: controller_email,
            ),
            const SizedBox(
              height: 8,
            ),
            customTextField(
              authModel.passTFHint,
              true,
              controller: controller_pass,
            ),
            const SizedBox(
              height: 8,
            ),
            customTextField(
              authModel.confirmPassTFHint,
              true,
              controller: controller_confirm_pass,
            ),
            const SizedBox(
              height: 8,
            ),
            customTextField(
              authModel.userNameTFHint,
              false,
              controller: controller_userName,
            ),
            const SizedBox(
              height: 15,
            ),
            Button(
              onPressed: () async {
                auth.registerRequest(controller_email!.text,
                    controller_pass!.text, controller_userName!.text, context);
              },
              title: authModel.signUpBtnText,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomText(authModel.orText, 14, 'Poppins', kHintGreyColor,
                FontWeight.w400),
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
