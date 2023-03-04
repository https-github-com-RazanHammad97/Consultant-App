import 'package:consultant_app/repositories/Auth/auth_repository.dart';
import 'package:consultant_app/services/main_services.dart';
import 'package:hive/hive.dart';
import '../../controllers/constants.dart';
import '../../controllers/hive_keys.dart';
import '../../services/api_services.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

class AuthApi extends AuthRepository {
  ApiKeys ak = ApiKeys();
  ApiServices service = ApiServices();
  MainServices ms = MainServices();

  @override
  login(String email, String pass) async {
    //String message ="";
    String url = "$baseUrl" "/" "$loginEndPoint";
    Map data = {
      'email': email,
      'password': pass,
    };
    var json =await service.postData(url, data);

      print ("login can be done and email, pass isn't empty");
      //message="Logged in Successfully";
      print("test$json");
      //ms.writeToHiveBox(ak.token, json['token'].toString());
     // ms.writeToHiveBox(ak.createdDate, ms.getCurrentTime());
    await SessionManager().set("token", json['token']);
       // print(message);


    // ms.writeToHiveBox(ak.isLoggedInKey, true);

  }

  @override
  Future<void> register(String email, String pass,  String name) async {
    String url = "$baseUrl" "/" "$registerEndpoint";
    Map data = {
      'email': email,
      'password': pass,
      'password_confirmation': pass,
      'name': name
    };
    var json = await service.postData(url, data);
    print(json);
    ms.writeToHiveBox(ak.token, json['token'].toString());
    ms.writeToHiveBox(ak.createdDate, ms.getCurrentTime());
    // await SessionManager().set("token", json['token']);
    // print(ms.readFromHiveBox("token"));
    // ms.writeToHiveBox(ak.isLoggedInKey, true);
    //print(ms.readFromHiveBox(ak.token)); token is printed now

  }

  @override
  Future<void> logOut() async {
    String url = "$baseUrl" "/" "$logOutEndPoint";
     await service.authPostData(url);
    ms.writeToHiveBox(ak.token, "");
   // await SessionManager().destroy();
  }
}
