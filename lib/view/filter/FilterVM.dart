import 'package:flutter/cupertino.dart';

import '../../data/remote/response/ApiResponse.dart';
import '../../model/filter/SearchMailModel.dart';
import 'SearchRepo.dart';

class SearchVM extends ChangeNotifier {
  ApiResponse<SearchMailModel> mailsByFilter = ApiResponse.stop();
  SearchRepo repo = SearchRepo();
  String text = "", dateStart = "", dateEnd = "";
  int statusId = -1;
  int listLength = 0;

  void _setMailByFilter(ApiResponse<SearchMailModel> response) {
    print("_setMailByFilter:: $response");
    mailsByFilter = response;
    notifyListeners();
  }

  Future<SearchMailModel?> getMailsByFilter() async {
    print("getMailByFilter $text");
    _setMailByFilter(ApiResponse.loading());
    repo
        .getMailByFilter(text)
        .then((value) => _setMailByFilter(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            _setMailByFilter(ApiResponse.error(error.toString())));
  }

  void setText(String val) {
    text = val;
    print('_text : $text');
    getMailsByFilter();
    notifyListeners();
  }

  void setLength(int l) {
    listLength = l;
    print('listLength : $listLength');
    notifyListeners();
  }

  int getLength() {
    print('getLength : $listLength');
    return listLength;
  }
}
