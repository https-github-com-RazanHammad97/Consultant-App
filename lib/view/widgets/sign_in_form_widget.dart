import 'package:consultant_app/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';

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
          customTextField(
            authModel.emailTFHintText,
            false,
            controller: emailController,
          ),
          const SizedBox(
            height: 16,
          ),
          customTextField(
            authModel.passTFHint,
            true,
            controller: passController,
          ),
          const SizedBox(
            height: 40,
          ),
          Button(
            title: authModel.signInBtnText,
            onPressed: () async {
              auth.loginRequest(
                  emailController.text, passController.text, context);
              print(passController.text);
              print(emailController.text);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomText(
              authModel.orText, 14, 'Poppins', kHintGreyColor, FontWeight.w400),
          const SizedBox(
            height: 20,
          ),
          const SocialIcons(),
        ],
      ),
    );
  }
}
