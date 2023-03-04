import 'package:consultant_app/controllers/usercontroler.dart';
import 'package:consultant_app/repositories/Auth/auth_api.dart';
import 'package:consultant_app/view_models/auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../services/main_services.dart';
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
            customTextField(
              authModel.emailTFHintText,
              controller: controller_email,
            ),
            customTextField(
              authModel.passTFHint,
              controller: controller_pass,
            ),
            customTextField(
              authModel.confirmPassTFHint,
              controller: controller_confirm_pass,
            ),
            customTextField(
              authModel.userNameTFHint,
              controller: controller_userName,
            ),
            const SizedBox(
              height: 40,
            ),
            Button(
              onPressed: () async {

                await auth.register(controller_email!.text, controller_pass!.text,
                    controller_userName!.text);
                if(mounted){
                  Navigator.of(context).pushNamed("/Home");
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

            const SizedBox(
              height: 20,
            ),
            CustomText(authModel.orText, 14, 'Poppins', kHintGreyColor, FontWeight.w400),
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
