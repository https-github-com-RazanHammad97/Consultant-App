// import 'package:hive/hive.dart';
//
// class User {
//   final int? id;
//   String? name;
//   String? email;
//   Null image;
//   Null email_verified_at;
//   String? role_id;
//   String? created_at;
//   String? updated_at;
//
//   Role? role;
//
//
//   User(
//       {
//
//       required this.id,
//       required this.name,
//       required this.email,
//       this.image,
//       this.email_verified_at,
//         required this.role_id,
//         this.created_at,
//         this.updated_at,
//
//       required this.role
//       });
//   factory User.fromJson(Map<String, dynamic> json) {
//    return User(
//        id : (json['id']  != null? json['id'] as int : null),
//     name : (json['name'] != null? json['name'] as String : null),
//     email : json['email'] != null? json['email'] as String :null,
//     image : json['image'],
//        email_verified_at : json['email_verified_at'],
//        role_id : json['role_id'] !=null ?json['role_id'] as String:null,
//        created_at: json['created_at'],
//        updated_at: json['updated_at'],
//     role : (json['role'] != null ? new Role.fromJson(json['role']) as Role : null)!);
//
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['image'] = this.image;
//     data['email_verified_at'] = this.email_verified_at;
//     data['role_id'] = this.role_id;
//     if (this.role != null) {
//       data['role'] = role?.toJson();
//     }
//
//     return data;
//   }
// }
//
// class Role {
//    int? id;
//    String? name;
//
//   Role({required this.id, required this.name});
//
//   Role.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }
//
//
//
// class Token {
//   User? user;
//   String? token;
//   Token({
//     required this.user,
//     required this.token,});
//
//   Token.fromJson(dynamic json) {
//     user = (json['user'] != null ? User.fromJson(json['user']) : null)!;
//     token = json['token'];
//   }
//
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (user != null) {
//       map['user'] = user!.toJson();
//     }
//     map['token'] = token;
//     return map;
//   }
//
// }

import 'Role.dart';

class User {
  User(
      {this.id,
      this.name,
      this.email,
      this.image,
      this.email_verified_at,
      this.role_id,
      this.createdAt,
      this.updatedAt,
      this.role});

  int? id;
  String? name;
  String? email;
  String? image;
  String? email_verified_at;
  int? role_id;
  String? createdAt;
  String? updatedAt;
  Role? role;

  factory User.fromJson(Map<String, dynamic> json) {
    Map<String,dynamic> roleJson = json['role'];
    return User(
        id: json['id'] ?? "",
        name: json['name'] ?? "",
        email: json['email'] ?? "",
        image: json['image'],
        email_verified_at: json['email_verified_at'],
        role_id: json['role_id'] ?? "",
        createdAt: json['created_at'] ?? "",
        updatedAt: json['updated_at'] ?? "",
        role:  json['role'] != null ? Role.fromJson(roleJson): null);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['image'] = image;
    _data['email_verified_at'] = email_verified_at;
    _data['role_id'] = role_id;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['role'] = role?.toJson();
    return _data;
  }
}
