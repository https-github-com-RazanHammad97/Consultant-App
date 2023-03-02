import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/Constants.dart';
import '../widgets/CustomText.dart';
import '../widgets/TagList.dart';

class OrgTile extends StatelessWidget {
  int selectedIndex = 0; //will highlight first item
  List<String> youList = ['reem'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(22))),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 9, left: 16, right: 14, top: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          CustomText('Here we add the subject', 14.0, 'Poppins', kHintGreyColor,
              FontWeight.w400),
          CustomText(
              'And here excerpt of the mail, can added to this location. And we can do more to this like …',
              14.0,
              'Poppins',
              kLightPrimaryColor,
              FontWeight.w400),
          const SizedBox(
            height: 8,
          ),
          TagList(),
          const SizedBox(
            height: 6,
          ),
          SizedBox(
            height: 36,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (ctx, int) {
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
                      'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80',
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
