import 'package:consultant_app/controllers/usercontroler.dart';
import 'package:consultant_app/view/HomeScreen.dart';
import 'package:consultant_app/view/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/Constants.dart';
import 'Button.dart';
import 'CustomText.dart';
import 'SocialIcons.dart';
import 'customTextField.dart';

class InputFieldSignUp extends StatefulWidget {
  @override
  State<InputFieldSignUp> createState() => _InputFieldSignUpState();
}

class _InputFieldSignUpState extends State<InputFieldSignUp> {
   TextEditingController? controller_email  = TextEditingController() ;
   TextEditingController? controller_pass = TextEditingController();
   TextEditingController? controller_confirm_pass = TextEditingController();
   TextEditingController? controller_userName = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  UserController uc = UserController();

  @override
  Widget build(BuildContext context) {
    // uc.Register("test868@test.com", "123456", "123qidopq");
    return FutureBuilder(
      builder: (BuildContext context , snapshot){
        return  SingleChildScrollView(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              customTextField("Enter Your Email",controller: controller_email,),
              customTextField("Enter Your Password",controller: controller_pass,),
              customTextField("Confirm Password",controller: controller_confirm_pass,),
              customTextField("Enter Your user name",controller: controller_userName,),
              const SizedBox(
                height: 40,
              ),
              Button(onPressed: ()async{
          await uc.register(controller_email!.text,controller_pass!.text,controller_userName!.text);
          },title: "Sign Up",),
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
              CustomText('Or', 14, 'Poppins', kHintGreyColor, FontWeight.w400),
              const SizedBox(
                height: 20,
              ),
              const SocialIcons(),
            ],
          ),
        );
      }


    );
  }
}
