import 'User.dart';

class Token {
  Token({
    required this.user,
    required this.token,
  });
  late final User user;
  late final String token;

  Token.fromJson(Map<String, dynamic> json){
    user = User.fromJson(json['user']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user.toJson();
    _data['token'] = token;
    return _data;
  }
}