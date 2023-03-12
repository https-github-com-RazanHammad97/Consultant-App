import 'package:consultant_app/views/categoriy_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../repositories/Admin/Sender/sender_screen.dart';
import '../../../repositories/Admin/Tag/tag_screen.dart';
import '../../../repositories/Inbox/Sender.dart';
import '../../../repositories/Inbox/inbox_api.dart';
import '../CustomText.dart';
import '../customTextField.dart';
import '../my_card.dart';
import '../my_list_tile.dart';
import '../my_text_button.dart';

class NewInbox extends StatefulWidget {
  const NewInbox({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<NewInbox> createState() => _NewInboxState();
}

class _NewInboxState extends State<NewInbox> {
  TextEditingController senderName = TextEditingController();
  TextEditingController senderPhone = TextEditingController();
  TextEditingController mailTitle = TextEditingController();
  TextEditingController mailDescription = TextEditingController();
  TextEditingController mailArchiveNo = TextEditingController();
  TextEditingController mailDescicion = TextEditingController();
  TextEditingController mailActivities = TextEditingController();
  TextEditingController mailDate = TextEditingController();

  late String result = "";
  late int id = 1;
  late List tags;
  late String status;
  late String senderN = "";
  late int senderId = 1;
  late String catName;
  InboxApi inbox = InboxApi();
  late Sender sender = Sender(senderId, senderN, categoryName: catName);
  late String selectedTags = "";
  void fillSenderData() {
    senderN == "" ? senderName.text = senderN : senderName.text;
  }

  @override
  void initState() {
    print(senderName.text);
    fillSenderData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: widget.child,
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
                    topLeft: Radius.circular(50.r),
                    topRight: Radius.circular(50.r),
                  ),
                ),
                child: Padding(
                    padding:
                        EdgeInsets.only(left: 12.w, right: 12.w, top: 12.h),
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
                                onPressed: () async {
                                  Navigator.pop(context);
                                  print("Razan sender name ${senderName.text}");
                                  print(
                                      "Razan sender Phone ${senderPhone.text}");
                                  print("Razan cat id $id");
                                  Map result = await inbox.createSender(
                                      senderName.text, senderPhone.text, id);
                                  var senderId = result["sender"][0]["id"];
                                  print("Razan sender id $senderId");
                                  print("sender$result");
                                  var mail = await inbox.createInbox(
                                      mailTitle.text,
                                      mailDescription.text,
                                      senderId,
                                      mailArchiveNo.text,
                                      (DateTime.now()).toString(),
                                      mailDescicion.text,
                                      2,
                                      "",
                                      "",
                                      "");
                                  // if(mounted){
                                  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sender Created")));
                                  //
                                  // }
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
                                senderName.text == ""
                                    ? "Sender"
                                    : senderName.text,
                                false,
                                controller: senderName,
                                preIcon: Icon(Icons.person_outline),
                              ),
                              trailing: TextButton(
                                onPressed: () async {
                                  Sender senderResult = await Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              SenderScreen()));
                                  print("Razan Sender Data$senderResult");
                                  senderName.text = senderResult.name;

                                  catName = senderResult.categoryName!;
                                },
                                child: Image.asset(
                                  "assets/images/warning.png",
                                ),
                              ),
                              subTitle: Padding(
                                padding:
                                    EdgeInsets.only(top: 12.h, bottom: 12.h),
                                child: Column(
                                  children: [
                                    customTextField(
                                      "Phone",
                                      false,
                                      controller: senderPhone,
                                      preIcon:
                                      const Icon(Icons.mobile_friendly),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText("Category", 20, "Poppins",
                                            Colors.black, FontWeight.normal),
                                        Wrap(
                                          spacing: 2,
                                          children: [
                                            TextButton(
                                              onPressed: () async {
                                                Sender senderResult =
                                                    await Navigator.push(
                                                        context,
                                                        new MaterialPageRoute(
                                                            builder: (context) =>
                                                                CategoriyScreen()));
                                                print(senderResult);

                                                result = senderResult.name!;
                                                id = senderResult.id!;
                                                setState(() {});
                                                print("Razan cat id = $id");
                                                print("catValue $result");
                                              },
                                              child: result == ""
                                                  ? Text("Others")
                                                  : Text(result),
                                            ),
                                            SvgPicture.asset(
                                                "assets/images/arrow2.svg")
                                          ],
                                        )
                                      ],
                                    ),
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
                                controller: mailTitle,
                              ),
                              subTitle: customTextField(
                                "Description",
                                false,
                                controller: mailDescription,
                                border: InputBorder.none,
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
                                  leading: TextButton(
                                      onPressed: () async {
                                        DateTime? pickedDate = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            //get today's date
                                            firstDate: DateTime(2000),
                                            //DateTime.now() - not to allow to choose before today.
                                            lastDate: DateTime(2101));

                                        if (pickedDate != null) {
                                          print(
                                              pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                                          String formattedDate =
                                              DateFormat('yyyy-MM-dd').format(
                                                  pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                          print(
                                              formattedDate); //formatted date output using intl package =>  2022-07-04
                                          //You can format date as per your need

                                          setState(() {
                                            mailDate.text =
                                                formattedDate; //set foratted date to TextField value.
                                          });
                                        } else {
                                          print("Date is not selected");
                                        }
                                      },
                                      child: Icon(Icons.calculate_outlined)),
                                  title: Text("Date"),
                                  subTitle: customTextField(
                                    mailDate.text == ""
                                        ? "20-10-2022"
                                        : mailDate.text,
                                    false,
                                    controller: mailDate,
                                  ),
                                ),
                                MyListTile(
                                  leading: Icon(Icons.archive_outlined),
                                  title: CustomText("Archive", 20, "Poppins",
                                      Colors.black, FontWeight.normal),
                                  subTitle: customTextField(
                                    "2022/6019",
                                    false,
                                    controller: mailArchiveNo,
                                    border: InputBorder.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          MyCard(
                              widget: MyListTile(
                            leading: Icon(Icons.tag),
                            title: selectedTags == ""
                                ? Text("Tags")
                                : Text(selectedTags),
                            trailing: TextButton(
                                onPressed: () async {
                                  var tagg = await Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) => TagScreen()));

                                  if (mounted) {
                                    print("selected tag $selectedTags");
                                    selectedTags = tagg;
                                  }
                                  setState(() {});
                                },
                                child: SvgPicture.asset(
                                    "assets/images/arrow2.svg")),
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
                            subTitle: customTextField(
                              "Add Decision ..",
                              false,
                              border: InputBorder.none,
                            ),
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
                        ],
                      ),
                    )),
              );
            });
      },
    );
  }
}
