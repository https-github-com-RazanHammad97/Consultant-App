import '../../data/remote/network/ApiEndPoints.dart';
import '../../data/remote/network/BaseApiService.dart';
import '../../data/remote/network/NetworkApiService.dart';
import '../../model/filter/SearchMailModel.dart';

class SearchRepo {
  final BaseApiService _apiService = NetworkApiService();

  Future<SearchMailModel> getMailByFilter(String text) async {
    // Future<SearchMailModel> getMailByFilter(String text, String dateStart, String dateEnd, int statusId) async {
    try {
      dynamic response =
          await _apiService.getResponse('${ApiEndPoints().search}text=$text');
      print("getMailByFilter ${response}");
      SearchMailModel jsonData = SearchMailModel.fromJson(response);
      print("getMailByFilter-reem $jsonData");
      return jsonData;
    } catch (e) {
      print('exeption error ' + e.toString());
      throw e;
    }
  }
}
