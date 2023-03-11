import 'package:consultant_app/controllers/hive_keys.dart';
import 'package:consultant_app/repositories/Inbox/inbox_repository.dart';
import '../../data/services/api_services.dart';
import 'package:intl/intl.dart';

import '../../controllers/constants.dart';

class InboxApi extends InboxRepository{

  ApiServices service = ApiServices();

  @override
  createInbox(String subject, String description, int senderId, String archiveNo, String archiveDate, String? decission,
      int statusId, String? finalDecision, String? tags, String activities) async{

    Map data ={
      "subject":subject,
      "description" : description,
      "sender_id" :senderId,
      "archive_number": archiveNo,
      "archive_date":archiveDate,
      "decision" : decission,
      "status_id" :statusId,
      "final_decision":finalDecision,
      "tags" :tags,
      "activities":activities
    };
    String url = "$baseUrl" "/" "mails";
   var json = await service.authPostData(url,data: data);
   if(json.toString().isNotEmpty){
     print ("mail $json");
     return json;
   }
  }
  createSender(String name,String phoneNum,int catId) async{
    Map data={
      "name":name,
      "mobile":phoneNum,
      "address":"test",
      "category_id":catId
    };
    String url = "$baseUrl" "/" "senders";
    var json = await service.authPostData(url,data: data);
    if(json.toString().isNotEmpty) {
      print("Sender $json");
      return json;
    }}



  getAllStatus(){

  }

}