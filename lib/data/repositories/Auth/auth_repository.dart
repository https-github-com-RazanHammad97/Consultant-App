import 'package:consultant_app/data/models/UserModel.dart';

abstract class AuthRepository {
  Future<UserModel?> register(String email, String pass, String name);
  Future<UserModel> login(String email, String pass);
  Future<void> logOut();
}
