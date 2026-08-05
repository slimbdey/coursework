import 'package:coursework/application/infrastructure/auth.dart';
import 'package:coursework/presentation/bloc/auth/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthUtils.validateForm', () {
    test('requires login', () {
      expect(
        () => AuthUtils.validateForm('', '123456', null),
        throwsA(AuthValidationError.loginRequired),
      );
    });

    test('requires password', () {
      expect(
        () => AuthUtils.validateForm('u@test.com', '', null),
        throwsA(AuthValidationError.passwordRequired),
      );
    });

    test('requires password length >= 6', () {
      expect(
        () => AuthUtils.validateForm('u@test.com', '123', null),
        throwsA(AuthValidationError.passwordTooShort),
      );
    });

    test('requires passwordAgain when provided empty', () {
      expect(
        () => AuthUtils.validateForm('u@test.com', '123456', ''),
        throwsA(AuthValidationError.passwordAgainRequired),
      );
    });

    test('requires matching passwords', () {
      expect(
        () => AuthUtils.validateForm('u@test.com', '123456', '654321'),
        throwsA(AuthValidationError.passwordsDoNotMatch),
      );
    });

    test('passes for valid sign-in form', () {
      expect(
        () => AuthUtils.validateForm('u@test.com', '123456', null),
        returnsNormally,
      );
    });
  });

  group('AuthUtils.validateCredentials', () {
    test('requires passwordAgain', () {
      expect(
        () => AuthUtils.validateCredentials('u@test.com', '123456', ''),
        throwsA(AuthValidationError.passwordAgainRequired),
      );
    });

    test('passes for valid credentials', () {
      expect(
        () => AuthUtils.validateCredentials('u@test.com', '123456', '123456'),
        returnsNormally,
      );
    });
  });
}
