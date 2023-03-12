import '../data/services/main_services.dart';

MainServices ms = MainServices();
String baseUrl = "https://palmail.betweenltd.com/api";
String loginEndPoint = "login";
String registerEndpoint = "register";
String logOutEndPoint = "logout";
String createNewUser = "users";

String createCategoryEndPoint = "mails";
Map<String, String>? headers = {
  "Content-Type": "application/json",
  "accept": "application/json",
  "Access-Control-Allow-Origin": "*",
};

Map<String, String>? authHeaders = {
  "Content-Type": "application/json",
  "accept": "application/json",
  "Access-Control-Allow-Origin": "*",
  // HttpHeaders.authorizationHeader:"354|eM8cC9RW9yHWNpgrapWikyxeUcj9Fxs7UhejHTDV"
  'Authorization': 'Bearer ${ms.readFromHiveBox("token")}'
// 'Authorization': 'Bearer 1814|b8VHM7bUa8byESv7VL2gRiuhI1OSpBUQ49lnMWFA'
};
