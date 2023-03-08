
import 'package:consultant_app/repositories/Admin/Users/user_api.dart';
import 'package:flutter/material.dart';

import '../../../views/widgets/Button.dart';
class AllUsers extends StatefulWidget {
  const AllUsers({Key? key}) : super(key: key);

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  UserApi user = UserApi();

  @override
  void initState() {
    var response =  user.getAllUsers();
    print("response ffrom all users section$response");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('All Users'),
      ),
      body: Scaffold(
        body: FutureBuilder(
          future: user.getAllUsers(),
          builder:(context,snapshot){
            if(snapshot.hasData){
              Map<String,dynamic> users = snapshot.data as Map<String,dynamic>;
             List<dynamic> usersData = users["users"];
              print(" from snapshot ${users["users"]}");
              return  ListView.builder(
                  itemCount: usersData.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text("name :${usersData[index]["name"]}"),
                      //subtitle: Text("email ${usersData[index]["email"]}"),
                      trailing: Wrap(
                        children: [TextButton(child:Text ('D'),onPressed: (){
                          var userId = usersData[index]["id"];
                          print(userId);
                          // add delete function here
                        },),
                          TextButton(child:Text ('E'),onPressed: (){
                            var userId = usersData[index]["id"];
                            print(userId);
                            // add delete function here
                          },)
                        ],
                      )
                    );
                  });
            }
            else{
              return CircularProgressIndicator();
            }

          }

        ),
      ),
    );
  }

}
