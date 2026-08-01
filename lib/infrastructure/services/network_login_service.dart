import 'package:coursework/application/infrastructure/auth.dart';
import 'package:coursework/application/infrastructure/login_service.dart';
import 'package:coursework/core/dio_client.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth, User;

import 'network_checker.dart';

class NetworkLoginService extends NetworkChecker implements LoginService {
  final DioClient dioClient = DioClient();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void checkNetwork() {
    if (isOffline) {
      throw AuthValidationError.noInternet;
    }
  }

  @override
  Future<User?> getCurrentUser() async {
    checkNetwork();

    return _auth.currentUser;
  }

  @override
  Future<User?> signInWithLoginPassword(String login, String password) async {
    checkNetwork();

    final credential = await _auth.signInWithEmailAndPassword(
      email: login.trim(),
      password: password.trim(),
    );

    if (credential.user != null) {
      try {
        await dioClient.authenticate(login, password);
      } catch (e) {
        if (e is DioException && e.response?.statusCode == 404) {
          await dioClient.register(login, password);
        }
      }
    }

    return credential.user;
  }

  @override
  Future<User?> registerWithLoginPassword(String login, String password) async {
    checkNetwork();

    final credential = await _auth.createUserWithEmailAndPassword(
      email: login.trim(),
      password: password.trim(),
    );

    if (credential.user != null) {
      await dioClient.register(login.trim(), password.trim());
    }

    return credential.user;
  }

  @override
  Future<User?> alterCredentials(String login, String password) async {
    checkNetwork();

    final user = _auth.currentUser;
    if (user == null || user.email == null) {
      return null;
    }

    final trimmedLogin = login.trim();
    final trimmedPassword = password.trim();

    await user.updatePassword(trimmedPassword);
    await dioClient.alterCredentials(
      prevLogin: user.email!,
      login: trimmedLogin,
      password: trimmedPassword,
    );

    return user;
  }

  @override
  Future<void> signOut() async {
    checkNetwork();
    await _auth.signOut();
  }
}
