import 'package:coursework/domain/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

extension FirebaseUserMapper on firebase_auth.User {
  User toDomain() => User(email: email);
}
