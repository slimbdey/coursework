import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import 'auth_form_errors.dart';
import 'login_input/index.dart';

void _noopOnChanged(String _) {}

class AuthFormInputs extends StatelessWidget {
  final TextEditingController loginController;
  final TextEditingController passwordController;
  final TextEditingController passwordAgainController;
  final String? loginError;
  final String? passwordError;
  final String? passwordAgainError;
  final String? passwordsDoNotMatchError;
  final String? passwordTooShortError;
  final String? loginFailedError;
  final String? registerFailedError;
  final String? emailAlreadyInUseError;
  final String? noInternetError;
  final bool isSignIn;
  final bool isLoading;

  const AuthFormInputs({
    super.key,
    required this.loginController,
    required this.passwordController,
    required this.passwordAgainController,
    this.loginError,
    this.passwordError,
    this.passwordAgainError,
    this.passwordsDoNotMatchError,
    this.passwordTooShortError,
    this.loginFailedError,
    this.registerFailedError,
    this.emailAlreadyInUseError,
    this.noInternetError,
    required this.isSignIn,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final l10 = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          LoginInput(
            isLoading: isLoading,
            autoFocus: true,
            controller: loginController,
            errorText: loginError,
            label: l10.login,
            onChanged: _noopOnChanged,
          ),
          LoginInput(
            isLoading: isLoading,
            isPassword: true,
            controller: passwordController,
            errorText: resolvePasswordError(
              passwordError: passwordError,
              passwordTooShortError: passwordTooShortError,
              registerFailedError: registerFailedError,
              loginFailedError: loginFailedError,
              emailAlreadyInUseError: emailAlreadyInUseError,
              noInternetError: noInternetError,
            ),
            label: l10.password,
            onChanged: _noopOnChanged,
          ),
          if (!isSignIn)
            LoginInput(
              isLoading: isLoading,
              isPassword: true,
              controller: passwordAgainController,
              errorText: resolvePasswordAgainError(
                passwordAgainError: passwordAgainError,
                passwordsDoNotMatchError: passwordsDoNotMatchError,
              ),
              label: l10.passwordAgain,
              onChanged: _noopOnChanged,
            ),
        ],
      ),
    );
  }
}
