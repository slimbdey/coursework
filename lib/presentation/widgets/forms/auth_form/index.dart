import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'auth_form_header.dart';
import 'auth_form_inputs.dart';
import 'auth_form_metrics.dart';
import 'auth_form_mode_toggle.dart';
import 'auth_form_submit_button.dart';

class AuthForm extends StatelessWidget {
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
  final VoidCallback toggleAuthMode;
  final VoidCallback signInHandler;
  final VoidCallback signUpHandler;

  const AuthForm({
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
    required this.toggleAuthMode,
    required this.signInHandler,
    required this.signUpHandler,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: kIsWeb ? 100 : 60),
                    Column(
                      spacing: 40,
                      children: [
                        const AuthFormHeader(),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: authFormFieldMaxWidth,
                          ),
                          child: Column(
                            spacing: 40,
                            children: [
                              AuthFormInputs(
                                loginController: loginController,
                                passwordController: passwordController,
                                passwordAgainController:
                                    passwordAgainController,
                                loginError: loginError,
                                passwordError: passwordError,
                                passwordAgainError: passwordAgainError,
                                passwordsDoNotMatchError:
                                    passwordsDoNotMatchError,
                                passwordTooShortError: passwordTooShortError,
                                loginFailedError: loginFailedError,
                                registerFailedError: registerFailedError,
                                emailAlreadyInUseError: emailAlreadyInUseError,
                                noInternetError: noInternetError,
                                isSignIn: isSignIn,
                                isLoading: isLoading,
                              ),
                              AuthFormSubmitButton(
                                isLoading: isLoading,
                                isOutlined: true,
                                label: isSignIn ? l10n.signIn : l10n.signUp,
                                onPressed: isSignIn
                                    ? signInHandler
                                    : signUpHandler,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    AuthFormModeToggle(
                      isSignIn: isSignIn,
                      isLoading: isLoading,
                      onToggle: toggleAuthMode,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
