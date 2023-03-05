
import 'package:consultant_app/view_models/auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/repositories/Auth/auth_api.dart';
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
  AuthViewModel authModel = AuthViewModel();

  AuthApi auth = AuthApi();

  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 16,),
          customTextField(authModel.emailTFHintText),
          SizedBox(height: 16,),
          customTextField(authModel.passTFHint),
          //customTextField('Confirm password'),
          const SizedBox(
            height: 40,
          ),
          Button(
            title: authModel.signInBtnText,
            onPressed: () async {
              await auth.login(emailController.text, passController.text);
              if (mounted) {
                Navigator.pushNamed(context, "/Home");
              }
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
