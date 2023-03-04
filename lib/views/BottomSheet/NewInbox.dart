import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/Button.dart';

class NewInbox extends StatelessWidget {
  const NewInbox({Key? key,required this.child}) : super(key: key);
 final Widget child;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child:child,
      onPressed: (){
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
                                 // _getFromGallery();
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
    );
  }
}
