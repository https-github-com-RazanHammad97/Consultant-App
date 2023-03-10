import '../../data/remote/network/BaseApiService.dart';
import '../../data/remote/network/NetworkApiService.dart';

class DetailsRepo {
  final BaseApiService _apiService = NetworkApiService();
  // Future<StatusModel> updateMail() async {
  //   try {
  //     dynamic response =
  //         await _apiService.putResponse(ApiEndPoints().updateMail);
  //     print("status $response");
  //     StatusModel jsonData = StatusModel.fromJson(response);
  //     print("status-reem $jsonData");
  //     return jsonData;
  //   } catch (e) {
  //     print('exeption error ' + e.toString());
  //     throw e;
  //   }
  // }
}
