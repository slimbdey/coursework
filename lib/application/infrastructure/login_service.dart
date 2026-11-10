import 'package:coursework/domain/user.dart';

abstract class LoginService {
  Future<User?> getCurrentUser();
  Future<User?> signInWithLoginPassword(String login, String password);
  Future<User?> registerWithLoginPassword(String login, String password);
  Future<User?> alterCredentials(String login, String password);
  Future<void> signOut();
}
