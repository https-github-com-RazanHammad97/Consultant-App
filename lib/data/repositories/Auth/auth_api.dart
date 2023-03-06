
import '../../../controllers/constants.dart';
import '../../../controllers/hive_keys.dart';
import '../../services/api_services.dart';
import '../../services/main_services.dart';
import 'auth_repository.dart';


class AuthApi extends AuthRepository {
  ApiKeys ak = ApiKeys();
  ApiServices service = ApiServices();
  MainServices ms = MainServices();

  @override
  Future<String> login(String email, String pass) async {
    String token="";
    String url = "$baseUrl" "/" "$loginEndPoint";
    Map data = {
      'email': email,
      'password': pass,
    };
    var val =await service.postData(url, data);
    print("val $val");
    if(val.toString().contains("message")){
      print("fail request login");
      token = "";
      ms.writeToHiveBox("token", token);
    }

    else if  (val.toString().contains("token")){
      print("print success request");
      // print(val["token"]);
      token= val["token"];
      ms.writeToHiveBox("token", token);
    }

    return token;
      //print (val);
      //message="Logged in Successfully";
      // print("login action response : $val");
      // return val;
      //ms.writeToHiveBox(ak.token, json['token'].toString());
     // ms.writeToHiveBox(ak.createdDate, ms.getCurrentTime());
   // await SessionManager().set("token", json['token']);
       // print(message);


    // ms.writeToHiveBox(ak.isLoggedInKey, true);

  }

  @override
  Future<String?> register(String email, String pass,  String name) async {
    String url = "$baseUrl" "/" "$registerEndpoint";
    String? token;
    Map data = {
      'email': email,
      'password': pass,
      'password_confirmation': pass,
      'name': name
    };
    var val = await service.postData(url, data);

    if(val.toString().contains("message")){
      token = null;
      ms.writeToHiveBox("token", token);
    }

    else if  (val.toString().contains("token")){
      token= val["token"];
      ms.writeToHiveBox("token", token);
      print(token);
    }

    return token;
    // print(json);
    // return json["token"];
    // ms.writeToHiveBox(ak.token, json['token'].toString());
    // ms.writeToHiveBox(ak.createdDate, ms.getCurrentTime());
    // await SessionManager().set("token", json['token']);
    // print(ms.readFromHiveBox("token"));
    // ms.writeToHiveBox(ak.isLoggedInKey, true);
    //print(ms.readFromHiveBox(ak.token)); token is printed now

  }



  @override
  Future<void> logOut() async {
    String url = "$baseUrl" "/" "$logOutEndPoint";
     await service.authPostData(url);


   // await SessionManager().destroy();
  }
}
