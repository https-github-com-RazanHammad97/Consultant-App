

import 'package:consultant_app/controllers/statuscontroller.dart';
import 'package:consultant_app/views/widgets/BottomSheet/NewInbox.dart';
import 'package:consultant_app/views/widgets/CustomSearch.dart';
import 'package:consultant_app/views/widgets/CustomText.dart';
import 'package:consultant_app/views/widgets/tiles/OrgTile.dart';
import 'package:consultant_app/views/widgets/tiles/StatusTile.dart';
import 'package:consultant_app/views/widgets/tiles/TagTile.dart';
import 'package:flutter/material.dart';
import '../data/repositories/Auth/auth_api.dart';
import '../data/services/main_services.dart';
import '../utils/Constants.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    super.initState();
  }
  @override

  bool isVisible = false;
  AuthApi auth = AuthApi();

  showUserContainer() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override

  Widget build(BuildContext context) {
    final myProvider = Provider.of<ProviderStatus>(context);
    myProvider.getStatus();
    return Scaffold(
      backgroundColor: kLightWhiteColor,
      appBar: AppBar(
        backgroundColor: kLightWhiteColor,
        leading: const Image(
          image: AssetImage('images/menu.png'),
        ),
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20, top: 10),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              child: TextButton(
                onPressed: () {
                  showUserContainer();
                },
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage('images/profile.png'),
                  // AssetImage('https://via.placeholder.com/150'),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ),

          Visibility(
              visible: isVisible,
              child: Container(
                width: 200,height: 400,
                // alignment: Alignment.topRight,
                // padding: EdgeInsets.only(bottom: 500, left: 200),

                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                ),
                child: TextButton(onPressed: () {
                  auth.logOut();
                  MainServices().saveToken("");
                  print("after logout token ${MainServices().readFromHiveBox("token")}");
                  if(mounted){
                    Navigator.pushNamed(context, "/Login");
                  }
                }, child: Text("Log Out")),
              ))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearch(),
            const SizedBox(height: 24),
            GridView.builder(
              // padding: padding,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.75,
              ),
              itemBuilder: (context, i) =>
                  StatusTile(mailsCount:myProvider.temp[i].mailsCount ,
                    name:myProvider.temp[i].name,
                color: myProvider.temp[i].color,),
              itemCount:4,
            ),//status
            const SizedBox(height: 24),
            OrgTile(),
            const SizedBox(height: 14),
            const OtherTile(),
            const SizedBox(
              height: 15,
            ),
            CustomText('Tags', 20, 'Poppins', kBlackColor, FontWeight.w600),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(22))),
              child: GridView.builder(
                // padding: padding,
                shrinkWrap: true,

                padding: EdgeInsets.all(15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    // maxCrossAxisExtent: 200,
                    childAspectRatio: 5 / 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8
                    //   childAspectRatio: 1.75,
                    ),
                itemBuilder: (context, i) => TagTile(),
                itemCount:myProvider.temp.length,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 57,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: kNavBottomColor, width: 1),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: kLightPrimaryColor,
                radius: 13,
                child: Image(
                  image: AssetImage('images/add.png'),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              NewInbox(
                child: CustomText('New Inbox', 20, 'Poppins',
                    kLightPrimaryColor, FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OtherTile extends StatelessWidget {
  const OtherTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(22))),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.only(bottom: 9, left: 16, right: 14, top: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 10,
                  ),
                  // const Spacer(),
                  const SizedBox(
                    width: 9,
                  ),
                  CustomText('Organization Name', 18.0, 'Poppins', kBlackColor,
                      FontWeight.w600),
                  Spacer(),
                  CustomText('Today, 11:00 AM', 12.0, 'Poppins', kHintGreyColor,
                      FontWeight.w400),
                  SizedBox(
                    width: 8,
                  ),
                  const Image(
                    image: AssetImage('images/arrow_right.png'),
                  ),
                ],
              ),
              CustomText('Here we add the subject', 14.0, 'Poppins',
                  kBlackColor, FontWeight.w400),
              CustomText(
                  'And here excerpt of the mail, can added to this location. And we can do more to this like …',
                  14.0,
                  'Poppins',
                  kLightBlackColor,
                  FontWeight.w400),
              const SizedBox(
                height: 8,
              ),
            ]),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }
}
