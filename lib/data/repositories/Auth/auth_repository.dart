

abstract class AuthRepository {
  Future<String?> register(String email, String pass, String name);
  Future<String> login(String email, String pass);
  Future<void> logOut();
}