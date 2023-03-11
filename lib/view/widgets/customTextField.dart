import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/Constants.dart';

class customTextField extends StatelessWidget {
  String hintText;
  TextEditingController? controller;
  Icon? icon;
  Icon? preIcon;
  Icon? suffixIcon;
  InputBorder? border;

  //double? fontSize; // add font size and font weight;
  customTextField(this.hintText,{this.controller, this.icon, super.key,this.border=InputBorder.none,this.preIcon,this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: kGreyColor))),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(

          prefixIcon: preIcon,
          suffixIcon: suffixIcon,
          icon: icon,
          contentPadding: EdgeInsets.all(0.0),
          hintText: hintText,
          hintStyle: const TextStyle(

              color: kHintGreyColor, fontSize: 12, fontFamily: 'Poppins'),
          border: border,
        ),

      ),
    );
  }
}
