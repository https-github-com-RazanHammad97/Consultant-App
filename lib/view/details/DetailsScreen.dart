import 'package:consultant_app/model/mail/MailData.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../utils/Constants.dart';
import '../../views/widgets/BorderShape.dart';
import '../../views/widgets/CustomAppBar.dart';
import '../../views/widgets/CustomText.dart';
import '../../views/widgets/TagList.dart';
import '../tiles/ActivityTile.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MailData mailData = ModalRoute.of(context)!.settings.arguments as MailData;
    print('index detail $mailData');

    return Scaffold(
      backgroundColor: kLightWhiteColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar('Details'),
            _detailWidget(mailData),
          ],
        ),
      ),
    );
  }
}

class _detailWidget extends StatelessWidget {
  MailData data;
  _detailWidget(
    this.data, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(children: [
            BorderShape(
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16, bottom: 14),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(22))),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(
                              image: AssetImage('images/user.png'),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  right: 18,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      // crossAxisAlignment:
                                      //     CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                            data!.sender!.name!,
                                            16,
                                            'Poppins',
                                            kBlackColor,
                                            FontWeight.w600),
                                        const Spacer(),
                                        CustomText(
                                            getDate(data.createdAt!),
                                            12,
                                            'Poppins',
                                            kHintGreyColor,
                                            FontWeight.w600),
                                      ],
                                    ),
                                    Row(
                                      // crossAxisAlignment:
                                      //     CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                            data.sender!.category!.name!,
                                            12,
                                            'Poppins',
                                            kHintGreyColor,
                                            FontWeight.w400),
                                        const Spacer(),
                                        CustomText(
                                            getArchDate(data.archiveDate!),
                                            12,
                                            'Poppins',
                                            kHintGreyColor,
                                            FontWeight.w400),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: kDividerColor,
                          thickness: 0.5,
                        ),
                        ExpandablePanel(
                          theme: const ExpandableThemeData(
                              iconColor: kLightPrimaryColor,
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center),
                          header: CustomText(data.subject!, 20, 'Poppins',
                              kBlackColor, FontWeight.w600),
                          collapsed: Text(
                            data.description == null ? '' : data.description!,
                            softWrap: false,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                          expanded: Text(
                            data.description == null ? '' : data.description!,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Colors.white),
            const SizedBox(
              height: 12,
            ),
            BorderShape(
                Padding(
                  padding:
                      EdgeInsets.only(right: 18, top: 14, bottom: 14, left: 17),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText('#', 20, 'Poppins', kDarkGreyColor2,
                            FontWeight.w600),
                        const SizedBox(
                          width: 12,
                        ),
                        TagList(data.tags!),
                        const Spacer(),
                        const Image(image: AssetImage('images/arrow_right.png'))
                      ],
                    ),
                  ),
                ),
                Colors.white),
            const SizedBox(
              height: 12,
            ),
            BorderShape(
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 17, top: 12, bottom: 12),
                  child: Row(
                    children: [
                      const Image(image: AssetImage('images/status.png')),
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(int.parse(data.status!.color!)),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(22),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 13, right: 13),
                          child: CustomText(data.status!.name!, 16, 'Poppins',
                              kBlackColor, FontWeight.w600),
                        ),
                      ),
                      Spacer(),
                      const Image(image: AssetImage('images/arrow_right.png')),
                    ],
                  ),
                ),
                Colors.white),
            const SizedBox(
              height: 12,
            ),
            Visibility(
              visible: data.decision == null ? false : true,
              child: BorderShape(
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      left: 16,
                      right: 16,
                      bottom: 14,
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText('Decision', 18, 'Poppins', kBlackColor,
                            FontWeight.w600),
                        CustomText(data.decision ?? '', 14, 'Poppins',
                            kBlackColor, FontWeight.w400),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                  Colors.white),
            ),
            BorderShape(
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 17, top: 12, bottom: 12),
                  child: Row(
                    children: [
                      const Image(image: AssetImage('images/status.png')),
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(int.parse(data.status!.color!)),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(22),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 13, right: 13),
                          child: CustomText(data.status!.name!, 16, 'Poppins',
                              kBlackColor, FontWeight.w600),
                        ),
                      ),
                      Spacer(),
                      const Image(image: AssetImage('images/arrow_right.png')),
                    ],
                  ),
                ),
                Colors.white),
            Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: CustomText(
                    'Activity', 20, 'Poppins', kBlackColor, FontWeight.w600),
                backgroundColor: Colors.transparent,
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: data.activities!.length,
                    itemBuilder: (context, index) {
                      return ActivityTile(data.activities![index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 7,
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            BorderShape(
                Padding(
                  padding: const EdgeInsets.only(
                      right: 13, top: 8, bottom: 8, left: 16),
                  child: Row(
                    children: const [
                      CircleAvatar(
                        radius: 12.0,
                        backgroundImage: AssetImage('images/profile.png'),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          // style: Theme.of(context).textTheme.bodySmall,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Add new Activity …',
                            hintStyle: TextStyle(
                                color: kLightBlackColor,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      Image(image: AssetImage('images/send.png')),
                    ],
                  ),
                ),
                kLightGreyColor2),
            const SizedBox(
              height: 16,
            )
          ]),
        ),
        //      ],
        //  ),
      ),
    );
  }
}
