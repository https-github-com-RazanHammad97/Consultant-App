import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/Constants.dart';

class customTextField extends StatelessWidget {
  String hintText;
  TextEditingController? controller;
  customTextField(this.hintText, {this.controller,super.key});

 // late TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: kGreyColor))),
      child: TextField(
          controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
                color: kHintGreyColor, fontSize: 12, fontFamily: 'Poppins'),
            border: InputBorder.none),
      ),
    );
  }
}
