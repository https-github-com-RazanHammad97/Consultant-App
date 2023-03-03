import 'User.dart';

class Test {
  User? user;
  String? token;
  Test({
      required this.user,
      required this.token,});

  Test.fromJson(dynamic json) {
    user = (json['user'] != null ? User.fromJson(json['user']) : null)!;
    token = json['token'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user!.toJson();
    }
    map['token'] = token;
    return map;
  }

}