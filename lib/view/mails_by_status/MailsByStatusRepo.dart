import '../../data/remote/network/ApiEndPoints.dart';
import '../../data/remote/network/NetworkApiService.dart';

class MailsByStatusRepo {
  final BaseApiService _apiService = NetworkApiService();

  Future<StatusModel> getStatus(int index) async {
    try {
      dynamic response = await _apiService
          .getResponse('${ApiEndPoints().getMailStatuses}$index?mail=true');
      print("status $response");
      StatusModel jsonData = StatusModel.fromJson(response);
      print("status-reem $jsonData");
      return jsonData;
    } catch (e) {
      print('exeption error ' + e.toString());
      throw e;
    }
  }
}
