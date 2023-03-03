import 'dart:convert';

import 'package:consultant_app/models/User.dart';
import 'package:consultant_app/repositories/Auth/auth_repository.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import '../../controllers/constants.dart';

class AuthApi extends AuthRepository {
  @override
  Future<User> login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> register(String email, String pass, String name) async {
   String? userToken;
    String url = "${baseUrl}" "/" "${registerEndpoint}";
    //  print(1);
    final Uri apiUrl = Uri.parse(url);
    Map data = {
      'email': '$email',
      'password': '$pass',
      'password_confirmation': '$pass',
      'name': '$name'
    };
    //print(2);
    http.Response response = await http.post(apiUrl,
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        },
        body: jsonEncode(data));
    //print(response.body);
    try {
      if (response.statusCode == 200) {
        //Map<String,dynamic> userJson = jsonDecode(response.body) as Map<String,dynamic>;
        var userJson = jsonDecode(response.body);

        // Map<String,dynamic> userJson2={
        // "user": {
        // "id": 39,
        // "name": "ahmed",
        // "email": "test123@test.net",
        // "image": null,
        // "email_verified_at": null,
        // "role_id": "1",
        // "created_at": "2023-03-02T22:52:30.000000Z",
        // "updated_at": "2023-03-02T22:52:30.000000Z",
        // "role": {
        // "id": 1,
        // "name": "guest",
        // "created_at": "2023-03-02T12:46:55.000000Z",
        // "updated_at": "2023-03-02T12:46:55.000000Z"
        // }}};
        //User.fromJson(userJson);
        //print(userJson.keys);

        //print(test.name.toString().isEmpty);
        userToken=userJson['token'];
        //print(userToken);
       var box= Hive.box("myBox");
       box.put("token", userToken);
       print(box.get("token"));
        //print(200);
        //print(user);
        // return user;
      }
    } catch (e) {
      print(e.toString());
    }
    // var response = await http.post(apiUrl,headers: {
    //   "Content-Type": "application/json",
    //   "accept": "application/json",
    //   "Access-Control-Allow-Origin": "*"
    // },body: jsonEncode(data)).then((value) {
    //     print(3);
    //     return User.fromJson(jsonDecode(value.body));

 }
}
