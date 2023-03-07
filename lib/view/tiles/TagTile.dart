import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/mail/Tags.dart';
import '../../utils/Constants.dart';
import '../widgets/CustomText.dart';

class TagTile extends StatelessWidget {
  Tags tag;
  TagTile(this.tag, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8, right: 8),
      padding: const EdgeInsets.only(top: 6, bottom: 6, right: 12, left: 12),
      decoration: const BoxDecoration(
          color: kLightGreyColor,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: CustomText(
          '# ${tag.name}', 14, 'Poppins', kDarkGreyColor, FontWeight.w600),
    );
  }
}
