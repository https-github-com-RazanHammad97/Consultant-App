import '../../models/User.dart';

abstract class AuthRepository {
  Future<void> register(String email, String pass, String name);
  Future<User> login();
}