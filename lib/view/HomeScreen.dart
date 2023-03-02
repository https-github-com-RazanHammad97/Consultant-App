import 'package:consultant_app/view/tiles/OrgTile.dart';
import 'package:consultant_app/view/tiles/StatusTile.dart';
import 'package:consultant_app/view/tiles/TagTile.dart';
import 'package:consultant_app/view/widgets/CustomSearch.dart';
import 'package:consultant_app/view/widgets/CustomText.dart';
import 'package:flutter/material.dart';

import '../utils/Constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightWhiteColor,
      appBar: AppBar(
        backgroundColor: kLightWhiteColor,
        leading: const Image(
          image: AssetImage('images/menu.png'),
        ),
        elevation: 0,
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20, top: 10),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              child: CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage('images/profile.png'),
                // AssetImage('https://via.placeholder.com/150'),
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
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
              itemBuilder: (context, i) => StatusTile(),
              itemCount: 4,
            ),
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
                itemCount: 4,
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
              CustomText('New Inbox', 20, 'Poppins', kLightPrimaryColor,
                  FontWeight.w600),
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
