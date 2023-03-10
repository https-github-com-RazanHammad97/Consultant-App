import 'package:consultant_app/data/services/api_services.dart';

import '../../controllers/constants.dart';

class CategoryApi {
  ApiServices service = ApiServices();
  createCategory(){
    Map data = {

    };
    String url = "$baseUrl" "/" "categories";
    var json = service.postData(url, data);

    return json;

  }
}