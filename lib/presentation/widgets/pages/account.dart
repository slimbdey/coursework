import 'package:coursework/application/infrastructure/auth.dart';
import 'package:coursework/presentation/bloc/auth/auth_bloc.dart';
import 'package:coursework/presentation/bloc/auth/auth_event.dart';
import 'package:coursework/presentation/bloc/auth/auth_state.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/widgets/forms/auth_form.dart';
import 'package:coursework/presentation/widgets/navigation/routes.dart' show AppRoutes;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart' show GoRouterHelper;

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();

  void toggleAuthMode() => context.read<AuthBloc>().add(ToggleAuthModeEvent());

  void signInHandler() => context.read<AuthBloc>().add(
    SignInEvent(_loginController.text, _passwordController.text),
  );

  void signUpHandler() => context.read<AuthBloc>().add(
    SignUpEvent(
      _loginController.text,
      _passwordController.text,
      _passwordAgainController.text,
    ),
  );

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    _passwordAgainController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10 = AppLocalizations.of(context)!;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSignedInState) {
          context.go(AppRoutes.home.path);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorScheme.surface,
          body: () {
            if (state is AuthInitialState ||
                state is AuthModeState ||
                state is AuthErrorState ||
                state is AuthLoadingState ||
                state is AuthSignedOutState) {
              return AuthForm(
                isLoading: state is AuthLoadingState,
                loginController: _loginController,
                passwordController: _passwordController,
                passwordAgainController: _passwordAgainController,
                loginError: state is AuthErrorState &&
                        state.error == AuthValidationError.loginRequired
                    ? l10.loginRequired
                    : null,
                passwordError: state is AuthErrorState &&
                        state.error == AuthValidationError.passwordRequired
                    ? l10.passwordRequired
                    : null,
                passwordAgainError: state is AuthErrorState &&
                        state.error == AuthValidationError.passwordAgainRequired
                    ? l10.passwordAgainRequired
                    : null,
                passwordsDoNotMatchError: state is AuthErrorState &&
                        state.error == AuthValidationError.passwordsDoNotMatch
                    ? l10.passwordsDoNotMatch
                    : null,
                passwordTooShortError: state is AuthErrorState &&
                        state.error == AuthValidationError.passwordTooShort
                    ? l10.passwordTooShort
                    : null,
                loginFailedError: state is AuthErrorState &&
                        state.error == AuthValidationError.loginFailed
                    ? l10.loginFailed
                    : null,
                registerFailedError: state is AuthErrorState &&
                        state.error == AuthValidationError.registerFailed
                    ? l10.registerFailed
                    : null,
                emailAlreadyInUseError: state is AuthErrorState &&
                        state.error == AuthValidationError.emailAlreadyInUse
                    ? l10.emailAlreadyInUse
                    : null,
                noInternetError: state is AuthErrorState &&
                        state.error == AuthValidationError.noInternet
                    ? l10.noInternet
                    : null,
                isSignIn: state.isSignIn,
                toggleAuthMode: toggleAuthMode,
                signInHandler: signInHandler,
                signUpHandler: signUpHandler,
              );
            }

            if (state is AuthSignedInState) {
              //return ProfileForm(user: state.user);
              return OutlinedButton(
                onPressed: () => context.read<AuthBloc>().add(SignOutEvent()),
                child: Text(l10.signOut),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          }(),
        );
      },
    );
  }
}
