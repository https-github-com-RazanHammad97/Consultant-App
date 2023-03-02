import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/Constants.dart';
import 'Button.dart';
import 'CustomText.dart';
import 'SocialIcons.dart';
import 'customTextField.dart';

class InputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        customTextField('Enter Your Email'),
        customTextField('Enter Your Password'),
        customTextField('Confirm password'),
        const SizedBox(
          height: 40,
        ),
        Button(),
        const SizedBox(
          height: 20,
        ),
        CustomText('Or', 14, 'Poppins', kHintGreyColor, FontWeight.w400),
        const SizedBox(
          height: 20,
        ),
        const SocialIcons(),
      ],
    );
  }
}
