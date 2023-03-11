class ApiEndPoints {
  static String baseUrl = 'https://palmail.betweenltd.com/api/';
  //mails
  final String getAllMails = "${baseUrl}mails";
  final String createMail = "${baseUrl}mails";
  final String updateMail = "${baseUrl}mails/";
  //status
  final String getStatuses = "${baseUrl}statuses";
  final String getMailStatuses = "${baseUrl}statuses/";
  //category
  final String categories = "${baseUrl}categories";
  //tags
  final String getTags = "${baseUrl}tags";
  final String getMailByTag = "${baseUrl}tags?tags=";
  //search
  final String search = "${baseUrl}search?";
}
