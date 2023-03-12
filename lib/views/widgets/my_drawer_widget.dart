import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/Constants.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kLightWhiteColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF579BB1),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/logo.jpg'),
                    backgroundColor: Colors.transparent,
                    radius: 50.r,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight - Alignment(0, .4),
                  child: Text(
                    'Complaints App',
                    style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      color: Color(0xFFFFF1DC),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Admin Panel',
                    style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      color: const Color(0xFFFFF1DC),
                    ),
                  ),
                )
              ],
            ),
          ),
          ListTile(
            title: const Text('View All Users'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/Admin/Users");
            },
          ),
          ListTile(
            title: const Text('Create New User'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/Admin/CreateUser");
            },
          ),
          ListTile(
            title: const Text('Create new Category'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/Admin/Category/create");
            },
          ),
          ListTile(
            title: const Text('View All Categories'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "Admin/Category");
            },
          ),
          ListTile(
            title: const Text('View All Tags'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/Tags");
            },
          ),
          ListTile(
            title: const Text('View All Statuses'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "Admin/status");
            },
          ),
        ],
      ),
    );
  }
}
