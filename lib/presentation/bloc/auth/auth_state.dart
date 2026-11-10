import 'package:coursework/application/infrastructure/auth.dart'
    show AuthValidationError;
import 'package:coursework/domain/user.dart';

abstract class AuthState {
  final bool isSignIn;
  const AuthState({this.isSignIn = true});

  bool get isAuthenticated => this is AuthSignedInState;
}

class AuthInitialState extends AuthState {
  final String login;
  final String password;
  final String passwordAgain;

  const AuthInitialState({
    this.login = '',
    this.password = '',
    this.passwordAgain = '',
  });
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState({super.isSignIn});
}

class AuthSuccessState extends AuthState {
  const AuthSuccessState();
}

class AuthErrorState extends AuthState {
  final AuthValidationError error;

  const AuthErrorState({required this.error, super.isSignIn});
}

class AuthModeState extends AuthState {
  const AuthModeState({super.isSignIn});
}

class AuthSignedInState extends AuthState {
  final User user;
  final bool isUpdating;
  final bool isChangingPassword;
  final bool credentialsUpdated;
  final AuthValidationError? error;

  const AuthSignedInState({
    required this.user,
    this.isUpdating = false,
    this.isChangingPassword = false,
    this.credentialsUpdated = false,
    this.error,
  });
}

class AuthSignedOutState extends AuthState {
  const AuthSignedOutState();
}
