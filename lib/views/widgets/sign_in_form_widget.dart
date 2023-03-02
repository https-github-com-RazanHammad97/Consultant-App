import 'package:consultant_app/view_models/auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/Constants.dart';
import 'Button.dart';
import 'CustomText.dart';
import 'SocialIcons.dart';
import 'customTextField.dart';

class signInForm extends StatelessWidget {
  AuthViewModel authModel = AuthViewModel();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        customTextField(authModel.emailTFHintText),
        customTextField(authModel.passTFHint),
        //customTextField('Confirm password'),
        const SizedBox(
          height: 40,
        ),
        Button(
          title: authModel.signInBtnText,
          onPressed: () {},
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
    );
  }
}
