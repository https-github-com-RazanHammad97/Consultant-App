import 'package:consultant_app/data/models/UserModel.dart';
import 'package:flutter/material.dart';

import '../../../controllers/constants.dart';
import '../../../controllers/hive_keys.dart';
import '../../../view/home/HomeScreen.dart';
import '../../../view/widgets/ShowLoadingDialog.dart';
import '../../remote/network/BaseApiService.dart';
import '../../remote/network/NetworkApiService.dart';
import '../../remote/response/ApiResponse.dart';
import '../../services/api_services.dart';
import '../../services/main_services.dart';
import 'auth_repository.dart';

class AuthApi extends AuthRepository {
  ApiKeys ak = ApiKeys();
  ApiServices service = ApiServices();
  MainServices ms = MainServices();
  final BaseApiService _apiService = NetworkApiService();
  ApiResponse<UserModel> loginMain = ApiResponse.stop();

  Future<UserModel> login(String email, String pass) async {
    try {
      String url = "$baseUrl/login";
      Map data = {
        'email': email,
        'password': pass,
      };
      dynamic response = await _apiService.postResponse(url, data);
      print("loginRequest $response");
      UserModel jsonData = UserModel.fromJson(response);
      print("loginRequest $jsonData");
      return jsonData;
    } catch (e) {
      print('exeption error ' + e.toString());
      throw e;
    }
  }

  Future<UserModel?> loginRequest(
      String email, String pass, BuildContext context) async {
    showLoadingDialog(context);
    login(email, pass).then((value) {
      Navigator.pop(context);
      print('token ${value.token}');
      ms.saveToken(value.token.toString());
      ms.saveUser(value);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return HomeScreen();
      }), (r) {
        return false;
      });
    }).onError((error, stackTrace) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
        backgroundColor: Colors.green.shade300,
      ));
    });
  }

  @override
  Future<void> logOut() async {
    String url = "$baseUrl" "/" "$logOutEndPoint";
    await service.authPostData(url);
  }

  @override
  Future<UserModel?> register(String email, String pass, String name) async {
    try {
      String url = "$baseUrl/$registerEndpoint";
      Map data = {
        'email': email,
        'password': pass,
        'password_confirmation': pass,
        'name': name
      };
      dynamic response = await _apiService.postResponse(url, data);
      print("register $response");
      UserModel jsonData = UserModel.fromJson(response);
      print("register $jsonData");
      return jsonData;
    } catch (e) {
      print('exeption error ' + e.toString());
      throw e;
    }
  }

  Future<UserModel?> registerRequest(
      String email, String pass, String name, BuildContext context) async {
    showLoadingDialog(context);
    register(email, pass, name).then((value) {
      Navigator.pop(context);
      ms.saveToken(value!.token!);
      ms.saveUser(value);
      print('token ${value.token}');
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return HomeScreen();
      }), (r) {
        return false;
      });
    }).onError((error, stackTrace) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
        backgroundColor: Colors.green.shade300,
      ));
    });
  }
}
