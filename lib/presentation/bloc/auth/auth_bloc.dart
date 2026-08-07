import 'package:coursework/application/infrastructure/auth.dart'
    show AuthValidationError;
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuthException;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coursework/application/infrastructure/login_service.dart';

import 'auth_event.dart';
import 'auth_state.dart';
import 'utils.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginService _loginService;

  AuthBloc(this._loginService) : super(const AuthInitialState()) {
    on<CheckAuthEvent>((event, emit) async {
      try {
        final user = await _loginService.getCurrentUser();
        if (user != null) {
          emit(AuthSignedInState(user: user));
        }
      } catch (_) {}
    });

    on<SignInEvent>((event, emit) async {
      emit(AuthLoadingState(isSignIn: state.isSignIn));

      try {
        AuthUtils.validateForm(event.login, event.password, null);

        final user = await _loginService.signInWithLoginPassword(
          event.login,
          event.password,
        );
        if (user == null) {
          throw Exception();
        }

        emit(AuthSignedInState(user: user));
      } catch (e) {
        await _loginService.signOut();

        if (e is AuthValidationError) {
          return emit(AuthErrorState(error: e, isSignIn: state.isSignIn));
        }

        return emit(
          AuthErrorState(
            error: AuthValidationError.loginFailed,
            isSignIn: state.isSignIn,
          ),
        );
      }
    });

    on<SignUpEvent>((event, emit) async {
      emit(AuthLoadingState(isSignIn: state.isSignIn));

      try {
        AuthUtils.validateForm(
          event.login,
          event.password,
          event.passwordAgain,
        );

        final user = await _loginService.registerWithLoginPassword(
          event.login,
          event.password,
        );
        if (user == null) {
          throw Exception();
        }

        emit(AuthSignedInState(user: user));
      } catch (e) {
        await _loginService.signOut();

        if (e is AuthValidationError) {
          return emit(AuthErrorState(error: e, isSignIn: state.isSignIn));
        }

        if (e is FirebaseAuthException) {
          return emit(
            AuthErrorState(
              error: AuthValidationError.emailAlreadyInUse,
              isSignIn: state.isSignIn,
            ),
          );
        }

        return emit(
          AuthErrorState(
            error: AuthValidationError.registerFailed,
            isSignIn: state.isSignIn,
          ),
        );
      }
    });

    on<ToggleAuthModeEvent>((event, emit) {
      emit(AuthModeState(isSignIn: !state.isSignIn));
    });

    on<SignOutEvent>((event, emit) async {
      await _loginService.signOut();
      emit(AuthSignedOutState());
    });

    on<ToggleChangePasswordEvent>((event, emit) {
      final current = state;
      if (current is! AuthSignedInState) {
        return;
      }

      emit(
        AuthSignedInState(
          user: current.user,
          isChangingPassword: !current.isChangingPassword,
          error: current.error,
        ),
      );
    });

    on<CancelCredentialsEditEvent>((event, emit) {
      final current = state;
      if (current is! AuthSignedInState) {
        return;
      }

      emit(AuthSignedInState(user: current.user));
    });

    on<AlterCredentialsEvent>((event, emit) async {
      final current = state;
      if (current is! AuthSignedInState) {
        return;
      }

      emit(
        AuthSignedInState(
          user: current.user,
          isUpdating: true,
          isChangingPassword: current.isChangingPassword,
        ),
      );

      try {
        AuthUtils.validateCredentials(
          event.login,
          event.password,
          event.passwordAgain,
        );

        final user = await _loginService.alterCredentials(
          event.login,
          event.password,
        );
        if (user == null) {
          throw Exception();
        }

        emit(AuthSignedInState(user: user, credentialsUpdated: true));
      } catch (e) {
        if (e is AuthValidationError) {
          return emit(
            AuthSignedInState(
              user: current.user,
              isChangingPassword: true,
              error: e,
            ),
          );
        }

        return emit(
          AuthSignedInState(
            user: current.user,
            isChangingPassword: true,
            error: AuthValidationError.alterCredentialsFailed,
          ),
        );
      }
    });
  }
}
