import 'package:consultant_app/view/widgets/BorderShape.dart';
import 'package:consultant_app/view/widgets/CustomAppBar.dart';
import 'package:consultant_app/view/widgets/CustomText.dart';
import 'package:consultant_app/view/widgets/GeneralListView.dart';
import 'package:consultant_app/view/widgets/TagList.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../utils/Constants.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightWhiteColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar('Details'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Column(children: [
                    BorderShape(
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, top: 16, bottom: 14),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(22))),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Image(
                                      image: AssetImage('images/user.png'),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          right: 18,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomText(
                                                    'Sport Ministry',
                                                    16,
                                                    'Poppins',
                                                    kBlackColor,
                                                    FontWeight.w600),
                                                const Spacer(),
                                                CustomText(
                                                    'Today, 11:00 AM',
                                                    12,
                                                    'Poppins',
                                                    kHintGreyColor,
                                                    FontWeight.w600),
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomText(
                                                    'Official organization',
                                                    12,
                                                    'Poppins',
                                                    kHintGreyColor,
                                                    FontWeight.w400),
                                                const Spacer(),
                                                CustomText(
                                                    'Arch 2022/1032',
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
                                          ExpandablePanelHeaderAlignment
                                              .center),
                                  header: CustomText('Title of mail', 20,
                                      'Poppins', kBlackColor, FontWeight.w600),
                                  collapsed: const Text(
                                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a',
                                    softWrap: false,
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  expanded: const Text(
                                    'Lorem Ipsum is simply dummy',
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
                          padding: EdgeInsets.only(
                              right: 18, top: 14, bottom: 14, left: 17),
                          child: Row(
                            children: [
                              CustomText('#', 20, 'Poppins', kDarkGreyColor2,
                                  FontWeight.w600),
                              const SizedBox(
                                width: 12,
                              ),
                              const TagList(),
                              const Spacer(),
                              const Image(
                                  image: AssetImage('images/arrow_right.png'))
                            ],
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
                              const Image(
                                  image: AssetImage('images/status.png')),
                              const SizedBox(
                                width: 12,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFFE120),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(22),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, bottom: 5, left: 13, right: 13),
                                  child: CustomText('Pending', 16, 'Poppins',
                                      kBlackColor, FontWeight.w600),
                                ),
                              ),
                              Spacer(),
                              Image(
                                  image: AssetImage('images/arrow_right.png')),
                            ],
                          ),
                        ),
                        Colors.white),
                    const SizedBox(
                      height: 12,
                    ),
                    BorderShape(
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
                              CustomText(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been',
                                  14,
                                  'Poppins',
                                  kBlackColor,
                                  FontWeight.w400),
                            ],
                          ),
                        ),
                        Colors.white),
                    const SizedBox(
                      height: 16,
                    ),
                    const GeneralListView(),
                    const SizedBox(
                      height: 15,
                    ),
                    BorderShape(
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 13, top: 19, bottom: 19, left: 16),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 12.0,
                                backgroundImage:
                                    AssetImage('images/profile.png'),
                                backgroundColor: Colors.transparent,
                              ),
                              const SizedBox(
                                width: 9,
                              ),
                              CustomText('Add new Activity …', 14, 'Poppins',
                                  kLightBlackColor, FontWeight.w400),
                              const Spacer(),
                              const Image(image: AssetImage('images/send.png')),
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
            ),
          ],
        ),
      ),
    );
  }
}
