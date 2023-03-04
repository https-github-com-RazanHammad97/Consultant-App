import '../../models/User.dart';

abstract class AuthRepository {
  Future<void> register(String email, String pass, String name);
  login(String email, String pass);
  Future<void> logOut();
}