import 'dart:convert';

import 'package:http/http.dart' as http;

import '../controllers/constants.dart';

class ApiServices {
  getData() {

  }

  Future authPostData(String url,  {Map? data}) async {
    final Uri apiUrl = Uri.parse(url);
    http.Response response =
        await http.post(apiUrl, headers: authHeaders, body: jsonEncode(data));
   // print(response.body);
    try {
      if (response.statusCode == 200) {
        print(200);
        var json = jsonDecode(response.body);
        return json;
        print(json);
      }
      if (response.statusCode==401){
        print("Unauthenticated");
        var json = jsonDecode(response.body);
        return json["message"];
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postData(String url, Map data) async {
    final Uri apiUrl = Uri.parse(url);
    http.Response response =
        await http.post(apiUrl, headers: headers, body: jsonEncode(data));

    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        print("success response$json");
        return json;
        print(json);
      }
      if(response.statusCode ==400){
        var json = jsonDecode(response.body);
        print(json["message"]);
        return json["message"];
      }

    } catch (e) {

      print(e.toString());
    }
  }

  deleteData() {}

  updateData() {}
}
