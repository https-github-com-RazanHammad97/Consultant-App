import 'package:consultant_app/view/widgets/CustomTabBar.dart';
import 'package:flutter/material.dart';

import '../../utils/Constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightWhiteColor,
      body: Stack(
        children: [
          Container(
            height: 300,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [kLightPrimaryColor, kPrimaryColor],
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(80)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 47, bottom: 29),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Center(
                    child: Image(
                      image: AssetImage('images/logo.png'),
                      height: 75,
                      width: 56,
                    ),
                  ),
                  Center(
                    child: Text(
                      'ديوان رئيس الوزراء',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Gulzar',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .25,
                right: 30.0,
                left: 30.0,
                bottom: 30),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(35))),
              child: const CustomTabBar(),
            ),
          ),
        ],
      ),
    );
  }
}
