import 'package:flutter/material.dart';

import '../../utils/Constants.dart';
import 'InputField.dart';
import 'InputFieldsignUp.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 60),
        child: Column(
          children: [
            // give the tab bar a height [can change hheight to preferred height]
            Container(
              height: 32,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: kGreyColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                // controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: kPrimaryColor,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: kPrimaryColor,
                unselectedLabelStyle:
                    const TextStyle(fontFamily: 'fonts/Poppins-SemiBold.ttf'),
                tabs: const [
                  Tab(
                    child: Text(
                      'log In',
                      style: TextStyle(fontFamily: 'Poppins'),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Sign Up',
                    ),
                  ),
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                // controller: _tabController,
                children: [
                  // first tab bar view widget
                  InputField(),
                  InputFieldSignUp(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
