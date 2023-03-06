import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/Constants.dart';
import '../CustomText.dart';


class StatusTile extends StatelessWidget {
   StatusTile({Key? key, required this.mailsCount, required this.name, required this.color}) : super(key: key);
  final  String mailsCount;
  final String name;
  late  String color;
  @override
  Widget build(BuildContext context) {
    final colorValue = int.parse(color.substring(2), radix: 16);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.0),
      ),
      color: Colors.white,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 9, left: 16, right: 14, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                 CircleAvatar(
                  backgroundColor:Color(colorValue),
                  radius: 10,
                ),
                const Spacer(),
                CustomText(mailsCount.toString(), 20.0, 'Poppins', kBlackColor, FontWeight.w600),
              ],
            ),
            const SizedBox(height: 14),
            CustomText(
                name, 18.0, 'Poppins', kHintGreyColor, FontWeight.w600)
          ],
        ),
      ),
    );
  }
}
