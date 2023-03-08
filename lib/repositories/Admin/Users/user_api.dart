import '../../../controllers/constants.dart';
import '../../../data/services/api_services.dart';

class UserApi {
  ApiServices service = ApiServices();
  getAllUsers(){
    final String url = "$baseUrl" "/" "$createNewUser";
  var json =service.getData(url);
  return json;
  }

  createNewUSer(String email, String password, String passwordConfirm,String name) async{

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

    deleteUser(int id){

    }
  }
