import 'package:consultant_app/repositories/Admin/Users/user_api.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New User'),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFF6589FF),
              Color(0xFFEAEAF5),
            ],
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  customTextField(
                    "Email",
                    false,
                    controller: emailController,
                  ),
                  customTextField(
                    "password",
                    true,
                    controller: passwordController,
                  ),
                  customTextField("Password Confirmation",
                      true,
                      controller: passConfirmController),
                  customTextField("User Name Controller",
                      false,
                      controller: usernameControlelr),
                  Button(
                    title: 'Create',
                    onPressed: () async {
                    var response=  await uApi.createNewUSer(

                          emailController.text,
                          passwordController.text,
                          passConfirmController.text,
                      usernameControlelr.text);
                    print(response);
                    if(response.toString().contains("user")){
                      if(mounted){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Created Successfully"),));
                        Navigator.pushNamed(context, "/users");
                      }

                    }
                    else {
                      if(mounted){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
                            "${response["message"]}"),));

                      }
                    }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
