import 'package:coursework/presentation/widgets/forms/auth_form/index.dart';
import 'package:coursework/presentation/widgets/shared/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_app.dart';

void main() {
  late TextEditingController login;
  late TextEditingController password;
  late TextEditingController passwordAgain;

  setUp(() {
    login = TextEditingController();
    password = TextEditingController();
    passwordAgain = TextEditingController();
  });

  tearDown(() {
    login.dispose();
    password.dispose();
    passwordAgain.dispose();
  });

  AuthForm build({
    bool isSignIn = true,
    bool isLoading = false,
    VoidCallback? onToggle,
    VoidCallback? onSignIn,
    VoidCallback? onSignUp,
    String? loginError,
  }) {
    return AuthForm(
      loginController: login,
      passwordController: password,
      passwordAgainController: passwordAgain,
      isSignIn: isSignIn,
      isLoading: isLoading,
      loginError: loginError,
      toggleAuthMode: onToggle ?? () {},
      signInHandler: onSignIn ?? () {},
      signUpHandler: onSignUp ?? () {},
    );
  }

  testWidgets('sign-in mode shows two fields and sign in button', (
    tester,
  ) async {
    await pumpApp(tester, build());

    expect(find.text('login (email)'), findsOneWidget);
    expect(find.text('password'), findsOneWidget);
    expect(find.text('password again'), findsNothing);
    expect(find.text('sign in'), findsOneWidget);
    expect(find.text('create account'), findsOneWidget);
  });

  testWidgets('sign-up mode shows password again and sign up button', (
    tester,
  ) async {
    await pumpApp(tester, build(isSignIn: false));

    expect(find.text('password again'), findsOneWidget);
    expect(find.text('sign up'), findsOneWidget);
    expect(find.text('sign in account'), findsOneWidget);
  });

  testWidgets('invokes submit and toggle callbacks', (tester) async {
    var signedIn = false;
    var toggled = false;

    await pumpApp(
      tester,
      build(onSignIn: () => signedIn = true, onToggle: () => toggled = true),
    );

    await tester.tap(find.text('sign in'));
    await tester.tap(find.text('create account'));
    expect(signedIn, isTrue);
    expect(toggled, isTrue);
  });

  testWidgets('shows loader and login error while loading', (tester) async {
    await pumpApp(
      tester,
      build(isLoading: true, loginError: 'login is required'),
    );

    expect(find.byType(Loader), findsOneWidget);
    expect(find.text('login is required'), findsOneWidget);
  });
}
