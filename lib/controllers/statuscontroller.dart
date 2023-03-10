



import 'package:consultant_app/view_models/statusmode.dart';
import 'package:flutter/cupertino.dart';
import '../data/remote/network/NetworkApiService.dart';

class ProviderStatus extends ChangeNotifier {
  NetworkApiService networkApiService = NetworkApiService();
  List<Inbox> temp = [];
  String previousData = "";
  Future<List<Inbox>> getStatus() async {
    var data = await networkApiService.getResponse(
        'statuses?mail=false}');
    if (data.toString() == previousData) {
      // Data has not changed, don't print anything
      return temp;
    }

    previousData = data.toString(); // Update previous data

    print(data);

    temp.clear();
    if (data.toString().contains("statuses")) {
      for (var item in data["statuses"]) {
        temp.add(
            Inbox(
              id: item['id'],
              name: item['name'],
              color: item['color'],
              createdAt: item['created_at'],
              updatedAt: item['updated_at'],
              mailsCount: item['mails_count'],
            )
        );
      }
    }
    print(temp.length);
    notifyListeners();
    return temp;
  }
   int clickedItem=0;
  void toggleIndex(index){
    clickedItem=index;
    notifyListeners();
  }

  Future<Inbox> getSingleStatus() async {
    var data = await networkApiService.getResponse(
        'statuses/$clickedItem?mail=false}');
    late Inbox selectedStatus;
    print(data);
    if (data.toString().contains("statuses")) {
      var item = data;
      selectedStatus = Inbox(id: item['id'],
        name: item['name'],
        color: item['color'],
        createdAt: item['created_at'],
        updatedAt: item['updated_at'],
        mailsCount: item['mails_count'],

      );
    }
    return selectedStatus;
  }

}