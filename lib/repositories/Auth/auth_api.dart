import 'package:consultant_app/repositories/Auth/auth_repository.dart';
import 'package:consultant_app/services/main_services.dart';
import 'package:hive/hive.dart';
import '../../controllers/constants.dart';
import '../../controllers/hive_keys.dart';
import '../../services/api_services.dart';

class AuthApi extends AuthRepository {
  ApiKeys ak = ApiKeys();
  ApiServices service = ApiServices();
  MainServices ms = MainServices();

  @override
  login(String email, String pass) async {
    String url = "$baseUrl" "/" "$loginEndPoint";
    Map data = {
      'email': email,
      'password': pass,
    };
    var json =await service.postData(url, data);
    ms.writeToHiveBox(ak.token, json['token'].toString());
    ms.writeToHiveBox(ak.createdDate, ms.getCurrentTime());
    ms.writeToHiveBox(ak.isLoggedInKey, true);
  }

  @override
  Future<void> register(String email, String pass, String name) async {
    String url = "$baseUrl" "/" "$registerEndpoint";
    Map data = {
      'email': email,
      'password': pass,
      'password_confirmation': pass,
      'name': name
    };
    var json = await service.postData(url, data);
    ms.writeToHiveBox(ak.token, json['token'].toString());
    ms.writeToHiveBox(ak.createdDate, ms.getCurrentTime());
    ms.writeToHiveBox(ak.isLoggedInKey, true);
    //print(ms.readFromHiveBox(ak.token)); token is printed now

  }
}
