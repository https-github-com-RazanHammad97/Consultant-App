import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isClicked1 = false;
  bool isClicked2 = false;

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
              decoration: BoxDecoration(
                //color: Colors.blueAccent
                //color: Color(0Xcbe6ef),
                color: Color(0xADD8E6FF),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8, right: 8, bottom: 25, top: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.menu),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 22,
                            //   child: Image.asset("assets/images/facebook.com"),
                            //  foregroundImage: NetworkImage("https://picsum.photos/250?image=9"),

                            child: CircleAvatar(
                              foregroundImage: NetworkImage(
                                  "https://picsum.photos/250?image=9"),
                              radius: 18,
                            ),
                          ),
                          //  Image(image: NetworkImage('https://via.placeholder.com/150'),)
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "search",
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.4,
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(24))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  height: 80,
                                  width: 182,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(35)),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Colors.red,
                                          ),
                                          Text("9",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("inbox"),
                                          Text(""),
                                        ],
                                      ),
                                    ],
                                  )),
                              Container(
                                  height: 80,
                                  width: 182,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(35)),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Colors.yellow,
                                          ),
                                          Text("9",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("inbox"),
                                          Text(""),
                                        ],
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  height: 80,
                                  width: 182,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(35)),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Colors.blue,
                                          ),
                                          Text(
                                            "9",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("inbox"),
                                          Text(""),
                                        ],
                                      ),
                                    ],
                                  )),
                              Container(
                                  height: 80,
                                  width: 182,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(35)),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Colors.green,
                                          ),
                                          Text("9",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("inbox"),
                                          Text(""),
                                        ],
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        leading: Text(
                          "Official Organization",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        trailing: TextButton(
                            style: ButtonStyle(
                              overlayColor: MaterialStateColor.resolveWith(
                                  (states) => Color(0Xcbe6ef)),
                            ),
                            onPressed: () {
                              print("pressed");
                              setState(() {
                                isClicked2 = !isClicked2;
                              });
                            },
                            child: isClicked2
                                ? SvgPicture.asset(
                                    "assets/images/arrow1.svg",
                                    color: Colors.blue,
                                    width: 14,
                                    height: 14,
                                  )
                                : Wrap(children: [
                                    Text(
                                      "12",
                                      style: TextStyle(
                                          fontSize: 11, color: Colors.grey),
                                    ),
                                    SvgPicture.asset(
                                      "assets/images/arrow2.svg",
                                      color: Colors.grey,
                                      width: 14,
                                      height: 14,
                                    ),
                                  ])),
                      ),
                      Visibility(
                        child: Card(
                          child: Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  radius: 10,
                                ),
                                title: Text(
                                  "Organization Name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                trailing: Wrap(
                                  children: [
                                    Text(
                                      "Today, 11:00 AM",
                                      style: TextStyle(
                                          fontSize: 11, color: Colors.grey),
                                    ),
                                    SvgPicture.asset(
                                      "assets/images/arrow2.svg",
                                      width: 14,
                                      height: 14,
                                    )
                                  ],
                                ),
                              ),
                              ListTile(
                                leading: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(text: "#test "),
                                    TextSpan(text: "#test2 "),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        visible: isClicked2,
                      ),
                      ListTile(
                        leading: Text(
                          "Official Organization",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        trailing: TextButton(
                            style: ButtonStyle(
                              overlayColor: MaterialStateColor.resolveWith(
                                  (states) => Color(0Xcbe6ef)),
                            ),
                            onPressed: () {
                              print("pressed");
                              setState(() {
                                isClicked1 = !isClicked1;
                              });
                            },
                            child: isClicked1
                                ? SvgPicture.asset(
                                    "assets/images/arrow1.svg",
                                    color: Colors.blue,
                                    width: 14,
                                    height: 14,
                                  )
                                : Wrap(children: [
                                    Text(
                                      "12",
                                      style: TextStyle(
                                          fontSize: 11, color: Colors.grey),
                                    ),
                                    SvgPicture.asset(
                                      "assets/images/arrow2.svg",
                                      color: Colors.grey,
                                      width: 14,
                                      height: 14,
                                    ),
                                  ])),
                      ),
                      Visibility(
                        child: Card(
                          child: Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  radius: 10,
                                ),
                                title: Text(
                                  "Organization Name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                trailing: Wrap(
                                  children: [
                                    Text(
                                      "Today, 11:00 AM",
                                      style: TextStyle(
                                          fontSize: 11, color: Colors.grey),
                                    ),
                                    SvgPicture.asset(
                                      "assets/images/arrow2.svg",
                                      width: 14,
                                      height: 14,
                                    )
                                  ],
                                ),
                              ),
                              ListTile(
                                leading: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(text: "#test "),
                                    TextSpan(text: "#test2 "),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        visible: isClicked1,
                      ),
                      ListTile(
                          leading: Text(
                        "Tags",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      Container(
                        padding: EdgeInsets.all(12),
                        width: double.maxFinite,

                        // height: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Wrap(runSpacing: 4, spacing: 4, children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Text(
                              "#Tags",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Text(
                              "#Tags",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Text(
                              "#Tags",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Text(
                              "#Tags klzcjljljaljfla",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Text(
                              "#Tags  alk;ak;ak;ka ",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Text(
                              "#Tags",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 95,
                      ),
                      // Divider(thickness: 0.4,color: Colors.grey,)
                    ],
                  ),
                ),
              )),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: FloatingActionButton(
              mini: true,
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
                            padding: const EdgeInsets.only(
                                left: 12.0, right: 12, top: 12),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.blue),
                                          )),
                                      Text(
                                        "New Inbox",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Done",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue),
                                          )),
                                    ],
                                  ),
                                  Container(
                                    //padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(35),
                                      color: Colors.white,
                                    ),
                                    child: ListTile(
                                      minLeadingWidth: 0.5,
                                      // leading: Icon(Icons.person_outline),
                                      title: TextField(
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(0.0),
                                            icon: Icon(Icons.person_outline),
                                            hintText: "Sender",
                                            hintStyle: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ),

                                      trailing: Image.asset(
                                        "assets/images/warning.png",
                                      ),
                                      subtitle: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12, bottom: 12),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Category",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20)),
                                            Wrap(
                                              spacing: 2,
                                              children: [
                                                Text("Other",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20)),
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
                                    child: ListTile(
                                        minLeadingWidth: 0.5,
                                        // leading: Icon(Icons.person_outline),
                                        title: TextField(
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.all(0.0),
                                              hintText: "Title Of Mail",
                                              hintStyle: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold)),
                                        ),

                                        // trailing: Icon(Icons.warning_rounded),
                                        subtitle: TextField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Description"),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Card(
                                    //padding: EdgeInsets.all(12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          minLeadingWidth: 0.2,
                                          leading:
                                              Icon(Icons.calculate_outlined),
                                          title: Text(
                                            "Date",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),

                                          // trailing: Icon(Icons.warning_rounded),
                                          subtitle: TextField(
                                            decoration: InputDecoration(
                                                //labelText: "Tuesday, July 5, 2022",
                                                contentPadding:
                                                    EdgeInsets.all(0.0),
                                                hintText:
                                                    "Tuesday, July 5, 2022",
                                                hintStyle: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.blue,
                                                )),
                                          ),
                                        ),
                                        ListTile(
                                          minLeadingWidth: 0.5,
                                          leading: Icon(Icons.archive_outlined),
                                          title: Text(
                                            "Archive",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),

                                          // trailing: Icon(Icons.warning_rounded),
                                          subtitle: TextField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                //  contentPadding: EdgeInsets.all(0.0),
                                                hintText: "2022/6019",
                                                hintStyle: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.blue,
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      child: ListTile(
                                        leading: Icon(Icons.tag),
                                        title: Text("Tags"),
                                        trailing: SvgPicture.asset(
                                            "assets/images/arrow2.svg"),
                                      )),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: ListTile(
                                      leading: Icon(Icons.inbox),
                                      title: Container(
                                        width: double.maxFinite,
                                        //alignment: Alignment.,
                                        padding: const EdgeInsets.all(4),
                                        // constraints: BoxConstraints(maxWidth:50),
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Text(
                                          "Inbox",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      trailing: SvgPicture.asset(
                                          "assets/images/arrow2.svg"),
                                    ),
                                  ),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: ListTile(
                                      title: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 6.0),
                                        child: Text(
                                          "Decission",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                      subtitle: TextField(
                                        decoration: InputDecoration(
                                            hintText: "Add Decision ..",
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    color: Colors.white,
                                    child: ListTile(
                                      leading: TextButton(
                                        style: ButtonStyle(
                                          overlayColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => Color(0Xcbe6ef)),
                                        ),
                                        onPressed: () {
                                          _getFromGallery();
                                        },
                                        child: Text(
                                          "Add Image",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:4,top:4,bottom:4),
                                    child: Row(

                                      mainAxisAlignment: MainAxisAlignment.start,

                                      children: [
                                        Text(

                                          "Activity",
                                          style: TextStyle(

                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white, //<-- SEE HERE
                                        hintText: "Add New Activity ..",
                                        prefixIcon: Icon(Icons.person),
                                        suffixIcon:  Icon(Icons.send),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(50.0),
                                        ),
                                      )),


                                ],
                              ),
                            )),
                      );
                    });
              },
              child: Icon(Icons.add))),
    );
  }
}
