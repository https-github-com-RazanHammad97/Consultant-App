import 'dart:convert';
import 'dart:io';
import 'package:hive/hive.dart';
import '../models/User.dart';
import 'constants.dart';
import 'package:http/http.dart' as http;
class UserController {

  //
  // Future login(){
  //   String url = "https://palmail.betweenltd.com/api/login";
  //   final Uri api_url =Uri.parse(url);
  //   var response = http.post(api_url,headers: {
  //     'email': 'o@o.com',
  //     'password': '123456',
  //
  //   });
  // }


     register(String email, String pass, String name) async{
       String url = "${baseUrl}""/""${registerEndpoint}";
    final Uri apiUrl =Uri.parse(url);
    Map data = {
      'email': '$email',
      'password': '$pass',
      'password_confirmation' : '$pass',
      'name' : '$name'
    };

    var response = await http.post(apiUrl,headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        },body: jsonEncode(data)).then((value) {

      var decodedResponse = jsonDecode(value.body);
      print ("response razan:$decodedResponse");

       return decodedResponse;

    },onError: (e){
          print(e);
    });


  }

     void writeToHive(int id,String name, String token, String email,Role role,int role_id) async {
       var path = Directory.current.path;
       Hive
         .init(path);

       var box = await Hive.openBox('testBox');

       var user = User(
         id: id,
         name: name,
          email: email,
         token: token,
         role: role, roleId: role_id
       );

       await box.put(name, User);

       print(box.get('dave')); // Dave: 22
     }

}