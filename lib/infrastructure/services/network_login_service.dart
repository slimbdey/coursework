import 'package:coursework/infrastructure/network_client.dart';
import 'package:coursework/application/infrastructure/auth.dart';
import 'package:coursework/application/infrastructure/login_service.dart';
import 'package:coursework/domain/user.dart';
import 'package:coursework/infrastructure/mappers/firebase_user_mapper.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, FirebaseAuthException;

import 'network_checker.dart';

class NetworkLoginService extends NetworkChecker implements LoginService {
  final NetworkClient networkClient;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  NetworkLoginService({required this.networkClient});

  void checkNetwork() {
    if (isOffline) {
      throw AuthValidationError.noInternet;
    }
  }

  @override
  Future<User?> getCurrentUser() async {
    checkNetwork();

    return _auth.currentUser?.toDomain();
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
        await networkClient.authenticate(login, password);
      } catch (e) {
        if (e is DioException && e.response?.statusCode == 404) {
          await networkClient.register(login, password);
        }
      }
    }

    return credential.user?.toDomain();
  }

  @override
  Future<User?> registerWithLoginPassword(String login, String password) async {
    checkNetwork();

    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: login.trim(),
        password: password.trim(),
      );

      if (credential.user != null) {
        await networkClient.register(login.trim(), password.trim());
      }

      return credential.user?.toDomain();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw AuthValidationError.emailAlreadyInUse;
      }
      rethrow;
    }
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
    await networkClient.alterCredentials(
      prevLogin: user.email!,
      login: trimmedLogin,
      password: trimmedPassword,
    );

    return user.toDomain();
  }

  @override
  Future<void> signOut() async {
    checkNetwork();
    await _auth.signOut();
  }
}
