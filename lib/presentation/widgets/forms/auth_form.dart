import 'package:flutter/material.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/widgets/shared/form_submit_button.dart';
import 'package:coursework/presentation/widgets/shared/login_input.dart';

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
  final Function() toggleAuthMode;
  final Function() signInHandler;
  final Function() signUpHandler;

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

  void nullHandler(String value) {}

  @override
  Widget build(BuildContext context) {
    final l10 = AppLocalizations.of(context)!;

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  Column(
                    spacing: 40,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 150,
                        height: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          spacing: 16,
                          children: [
                            LoginInput(
                              isLoading: isLoading,
                              autoFocus: true,
                              controller: loginController,
                              errorText: loginError,
                              label: l10.login,
                              onChanged: nullHandler,
                            ),
                            LoginInput(
                              isLoading: isLoading,
                              isPassword: true,
                              controller: passwordController,
                              errorText:
                                  passwordError ??
                                  passwordTooShortError ??
                                  registerFailedError ??
                                  loginFailedError ??
                                  emailAlreadyInUseError ??
                                  noInternetError,
                              label: l10.password,
                              onChanged: nullHandler,
                            ),
                            if (!isSignIn)
                              LoginInput(
                                isLoading: isLoading,
                                isPassword: true,
                                controller: passwordAgainController,
                                errorText:
                                    passwordAgainError ??
                                    passwordsDoNotMatchError,
                                label: l10.passwordAgain,
                                onChanged: nullHandler,
                              ),
                          ],
                        ),
                      ),
                      FormSubmitButton(
                        isLoading: isLoading,
                        isOutlined: true,
                        label: isSignIn ? l10.signIn : l10.signUp,
                        onPressed: isSignIn ? signInHandler : signUpHandler,
                      ),
                    ],
                  ),
                  const SizedBox(height: 100),
                  TextButton(
                    style: TextButton.styleFrom(
                      overlayColor: Colors.transparent,
                    ),
                    onPressed: isLoading ? null : toggleAuthMode,
                    child: Text(isSignIn ? l10.signUpLabel : l10.signInLabel),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
