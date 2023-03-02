import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/Constants.dart';
import '../widgets/CustomText.dart';

class StatusTile extends StatelessWidget {
  const StatusTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                const CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 10,
                ),
                const Spacer(),
                CustomText('9', 20.0, 'Poppins', kBlackColor, FontWeight.w600),
              ],
            ),
            const SizedBox(height: 14),
            CustomText(
                'Inbox', 18.0, 'Poppins', kHintGreyColor, FontWeight.w600)
          ],
        ),
      ),
    );
  }
}
