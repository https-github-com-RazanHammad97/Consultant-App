import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../CustomText.dart';
import '../customTextField.dart';
import '../my_card.dart';
import '../my_list_tile.dart';
import '../my_text_button.dart';

class NewInbox extends StatelessWidget {
  const NewInbox({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: child,
      onPressed: () {
        showModalBottomSheet(
            useSafeArea: true,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            context: context,
            builder: (BuildContext context) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                    padding:
                        const EdgeInsets.only(left: 12.0, right: 12, top: 12),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MyTextButton(
                                text: "Cancel",
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              CustomText("New Inbox", 12.0, "Poppins",
                                  Colors.black, FontWeight.bold),
                              MyTextButton(
                                text: "Done",
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                          Container(
                            //padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Colors.white,
                            ),
                            child: MyListTile(
                              title: customTextField(
                                "Sender",
                                false,
                                preIcon: Icon(Icons.person_outline),
                              ),
                              trailing: Image.asset(
                                "assets/images/warning.png",
                              ),
                              subTitle: Padding(
                                padding:
                                    const EdgeInsets.only(top: 12, bottom: 12),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText("Category", 20, "Poppins",
                                        Colors.black, FontWeight.normal),
                                    Wrap(
                                      spacing: 2,
                                      children: [
                                        CustomText("Other", 20, "Poppins",
                                            Colors.black, FontWeight.normal),
                                        SvgPicture.asset(
                                            "assets/images/arrow2.svg")
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            //padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Colors.white,
                            ),
                            child: MyListTile(
                              title: customTextField(
                                "Title Of Mail",
                                false,
                              ),
                              subTitle: customTextField(
                                "Description",
                                false,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          MyCard(
                            widget: Column(
                              children: [
                                MyListTile(
                                  leading: Icon(Icons.calculate_outlined),
                                  title: CustomText("Date", 20, "Poppins",
                                      Colors.black, FontWeight.normal),
                                  subTitle: customTextField(
                                      "Tuesday, July 5, 2022", false),
                                ),
                                MyListTile(
                                  leading: Icon(Icons.archive_outlined),
                                  title: CustomText("Archive", 20, "Poppins",
                                      Colors.black, FontWeight.normal),
                                  subTitle: customTextField("2022/6019", false),
                                ),
                              ],
                            ),
                          ),
                          MyCard(
                              widget: MyListTile(
                            leading: Icon(Icons.tag),
                            title: Text("Tags"),
                            trailing:
                                SvgPicture.asset("assets/images/arrow2.svg"),
                          )),
                          MyCard(
                            widget: MyListTile(
                              leading: Icon(Icons.inbox),
                              title: Container(
                                width: double.maxFinite,
                                //alignment: Alignment.,
                                padding: const EdgeInsets.all(4),
                                // constraints: BoxConstraints(maxWidth:50),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(50)),
                                child: CustomText("Inbox", 14, "Poppins",
                                    Colors.white, FontWeight.normal),
                              ),
                              trailing:
                                  SvgPicture.asset("assets/images/arrow2.svg"),
                            ),
                          ),
                          MyCard(
                              widget: MyListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: CustomText("Decission", 18, "Poppins",
                                  Colors.black, FontWeight.bold),
                            ),
                            subTitle: customTextField("Add Decision ..", false),
                          )),
                          MyCard(
                              widget: MyListTile(
                            leading: MyTextButton(
                              text: 'Add Image',
                              onPressed: () {
                                // _getFromGallery();
                              },
                            ),
                          )),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 4, top: 4, bottom: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomText("Activity", 20, "Poppins",
                                    Colors.black, FontWeight.bold)
                              ],
                            ),
                          ),
                          customTextField(
                            "Add New Activity ..",
                            false,
                            preIcon: Icon(Icons.person),
                            suffixIcon: Icon(Icons.send),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          )
                        ],
                      ),
                    )),
              );
            });
      },
    );
  }
}
