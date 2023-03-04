import 'dart:io';
import 'package:consultant_app/services/main_services.dart';
MainServices ms = MainServices();
String baseUrl ="https://palmail.betweenltd.com/api";
String loginEndPoint = "login";
String registerEndpoint ="register";
String logOutEndPoint="logout";
String createCategoryEndPoint = "mails";
Map<String,String>? headers = {
  "Content-Type": "application/json",
  "accept": "application/json",
  "Access-Control-Allow-Origin": "*",

};

Map<String,String>? authHeaders = {
  "Content-Type": "application/json",
  "accept": "application/json",
  "Access-Control-Allow-Origin": "*",
 // HttpHeaders.authorizationHeader:"354|eM8cC9RW9yHWNpgrapWikyxeUcj9Fxs7UhejHTDV"
  'Authorization': 'Bearer ${ms.readFromHiveBox("token")}'

};

