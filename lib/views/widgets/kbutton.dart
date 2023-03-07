

import 'package:flutter/material.dart';

Widget kTextButton({required String text,required Function() onPressed}) =>
    TextButton(onPressed:onPressed,
      child: Text(text,
        style:TextStyle(
            color:Colors.blueAccent,
            fontSize:18,
            fontWeight:FontWeight.normal
        ),
      ),
    );