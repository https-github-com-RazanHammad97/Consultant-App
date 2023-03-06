import 'package:consultant_app/repositories/Auth/auth_api.dart';
import 'package:consultant_app/services/main_services.dart';
import 'package:consultant_app/view_models/auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          customTextField(authModel.emailTFHintText,controller: emailController,),
          customTextField(authModel.passTFHint,controller: passController,),
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
            print(token);
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
