import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(

        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Admin CRUD'),
            ),
            ListTile(
              title: const Text('View All Users'),
              onTap: () {

                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Create New User'),
              onTap: () {

                Navigator.pop(context);
                Navigator.pushNamed(context,"/Admin/CreateUser");
              },
            ),
            ListTile(
              title: const Text('Update Existing User'),
              onTap: () {
                Navigator.pop(context);
                // Navigator.pushNamed(context,"/Login");
              },
            ),
            ListTile(
              title: const Text('Delete Existing User'),
              onTap: () {

                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
  }
}
