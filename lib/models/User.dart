
import 'package:hive/hive.dart';

class User {
  late int id;
 late  String name;
  late String email;
  Null image;
  Null emailVerifiedAt;
  late int roleId;
  late Role role;
  late String token;

  @HiveType(typeId: 0)
  User(
      {
        @HiveField(0)
        required this.token,
        required this.id,

        @HiveField(1)
        required this.name,
        @HiveField(2)
        required this.email,
        this.image,
        this.emailVerifiedAt,
        required this.roleId,
        @HiveField(3)
        required this.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    emailVerifiedAt = json['email_verified_at'];
    roleId = json['role_id'];
    role = (json['role'] != null ? new Role.fromJson(json['role']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['image'] = this.image;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['role_id'] = this.roleId;
    if (this.role != null) {
      data['role'] = this.role.toJson();
    }
    return data;
  }
}

class Role {
  late int id;
  late String name;

  Role({required this.id, required this.name});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
