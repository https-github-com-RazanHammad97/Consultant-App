import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/Constants.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(width: 1, color: kGreyColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(width: 1, color: kLightPrimaryColor)),
        hintText: 'Search',
        hintStyle: const TextStyle(
            color: kHintGreyColor, fontSize: 12, fontFamily: 'Poppins'),
        prefixIcon: Image.asset('images/search.png'),
      ),
    );
  }
}
