
import 'package:flutter/material.dart';
class AllUsers extends StatefulWidget {
  const AllUsers({Key? key}) : super(key: key);

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Users'),
      ),
      body: Scaffold(
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context,index){
              return ListTile();
            }),
      ),
    );
  }

}
