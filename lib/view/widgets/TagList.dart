import 'package:flutter/cupertino.dart';

import '../../utils/Constants.dart';
import 'CustomText.dart';

class TagList extends StatelessWidget {
  const TagList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (ctx, int) {
          return CustomText(
              '#Urgent', 14.0, 'Poppins', kDarkGreyColor3, FontWeight.w600);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }
}
