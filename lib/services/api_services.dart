import 'dart:convert';

import 'package:http/http.dart' as http;

import '../controllers/constants.dart';
class ApiServices {

  getData(){

  }

  Future postData(String url,Map data) async{
    final Uri apiUrl = Uri.parse(url);
    http.Response response = await http.post(apiUrl,
        headers: headers,
        body: jsonEncode(data));

    try {
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return json;
       print(json);
      }
    } catch (e) {
      print(e.toString());
    }
  }



  deleteData(){

  }

  updateData(){

  }

}