import 'package:consultant_app/view/mail_by_status/MailsByStatusRepo.dart';
import 'package:flutter/cupertino.dart';

import '../../data/remote/response/ApiResponse.dart';

class MailsByStatusVM extends ChangeNotifier {
  ApiResponse<StatusModel> statusMain = ApiResponse.loading();
  MailsByStatusRepo repo = MailsByStatusRepo();

  //status
  void _setStatusMain(ApiResponse<StatusModel> response) {
    print("_setStatusMain :: $response");
    statusMain = response;
    notifyListeners();
  }

  Future<StatusModel?> fetchStatus(int index) async {
    _setStatusMain(ApiResponse.loading());
    repo
        .getStatus(index)
        .then((value) => _setStatusMain(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            _setStatusMain(ApiResponse.error(error.toString())));
  }
}
