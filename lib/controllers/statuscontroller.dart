


import 'package:consultant_app/controllers/constants.dart';
import 'package:consultant_app/view_models/statusmode.dart';
import 'package:flutter/cupertino.dart';
import '../data/remote/network/NetworkApiService.dart';

class ProviderStatus extends ChangeNotifier {
  NetworkApiService networkApiService = NetworkApiService();
  List<Inbox> temp = [];
  Future<List<Inbox>> getStatus() async {

    var data = await networkApiService.getResponse(
        'statuses?mail=false}');
    for (var item in data["statuses"]) {
      temp.add(
          Inbox(id: item['id'],
              name: item['name'],
              color: item['color'],
              createdAt: item['createda_t'],
              updatedAt: item['updated_at']
              ,
              mailsCount: item['mails_count'])
      );
    }
    notifyListeners();
    return temp;
  }
}