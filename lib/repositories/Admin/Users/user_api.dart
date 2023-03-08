import '../../../controllers/constants.dart';
import '../../../data/services/api_services.dart';

class UserApi {
  getAllUsers(){}

  createNewUSer(String email, String password, String passwordConfirm,String name) async{
    ApiServices service = ApiServices();
      Map data ={
       "name":name,
        "email":email,
        "password":password,
        "password_confirmation":passwordConfirm
      };
      String url = "$baseUrl" "/" "$registerEndpoint";
      var json = await service.postData(url, data);
      if(json.toString().isNotEmpty){
        print ("Razan Response $json");
        return json;
      }
    }
  }
