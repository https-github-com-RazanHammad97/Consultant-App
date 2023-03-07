

class ApiEndPoints {
  // const String baseUrl = 'https://palmail.betweenltd.com/api/';
  static String baseUrl = 'https://palmail.betweenltd.com/api/';
  //mails
  final String getAllMails = "${baseUrl}mails";
  final String createMail = "${baseUrl}mails";
  final String getSingleMail = "${baseUrl}mails/";

  //status
  final String getStatuses = "${baseUrl}statuses";
  final String mailStatuses = "${baseUrl}statuses/";
  // statuses/1?mail=true
  //category
  final String categories = "${baseUrl}categories";
  //tags
  final String getTags = "${baseUrl}tags";
}
