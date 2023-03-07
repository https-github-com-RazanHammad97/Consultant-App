import 'package:consultant_app/model/mail/MailData.dart';
import 'package:consultant_app/view/details/DetailsScreen.dart';
import 'package:flutter/material.dart';

import '../../utils/Constants.dart';
import '../widgets/CustomText.dart';
import '../widgets/TagList.dart';

class MailTile extends StatelessWidget {
  MailData mailData;
  MailTile(this.mailData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(),
            settings: RouteSettings(
              arguments: mailData,
            ),
          ),
        )
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(22))),
        child: Padding(
          padding:
              const EdgeInsets.only(bottom: 9, left: 16, right: 14, top: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(int.parse(mailData.status!.color!)),
                  radius: 10,
                ),
                // const Spacer(),
                const SizedBox(
                  width: 9,
                ),
                CustomText(mailData.sender!.name!, 18.0, 'Poppins', kBlackColor,
                    FontWeight.w600),
                const Spacer(),
                CustomText(getDate(mailData.createdAt!), 12.0, 'Poppins',
                    kHintGreyColor, FontWeight.w400),
                const SizedBox(
                  width: 8,
                ),
                const Image(
                  image: AssetImage('images/arrow_right.png'),
                ),
              ],
            ),
            CustomText(mailData.subject!, 14.0, 'Poppins', kHintGreyColor,
                FontWeight.w400),
            CustomText(mailData.description ?? '', 14.0, 'Poppins',
                kLightBlackColor, FontWeight.w400),
            const SizedBox(
              height: 8,
            ),
            Visibility(
                visible: mailData.tags!.isNotEmpty ? true : false,
                child: TagList(mailData.tags)),
            Visibility(
              visible: mailData.attachments!.isNotEmpty ? true : false,
              child: SizedBox(
                height: 36,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: mailData.attachments!.length,
                  itemBuilder: (ctx, index) {
                    return SizedBox(
                      height: 36,
                      width: 40,
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 0,
                        margin: const EdgeInsets.only(right: 8),
                        child: Image.network(
                          'https://palmail.betweenltd.com/storage/${mailData.attachments![index].image!}',
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
