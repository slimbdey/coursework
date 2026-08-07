import 'package:coursework/application/infrastructure/auth.dart';
import 'package:coursework/presentation/bloc/auth/auth_bloc.dart';
import 'package:coursework/presentation/bloc/auth/auth_event.dart';
import 'package:coursework/presentation/bloc/auth/auth_state.dart';
import 'package:coursework/presentation/bloc/profile_today_words/profile_today_words_bloc.dart';
import 'package:coursework/presentation/bloc/profile_today_words/profile_today_words_state.dart';
import 'package:coursework/presentation/widgets/forms/profile_form/profile_form_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/mocks.dart';
import '../../../helpers/pump_app.dart';

void main() {
  late TextEditingController password;
  late TextEditingController passwordAgain;
  final user = FakeUser(email: 'user@test.com');

  setUp(() {
    password = TextEditingController();
    passwordAgain = TextEditingController();
  });

  tearDown(() {
    password.dispose();
    passwordAgain.dispose();
  });

  Future<MockAuthBloc> pumpContent(
    WidgetTester tester, {
    required AuthSignedInState signedIn,
    bool showPasswordChangedNotice = false,
    VoidCallback? onCancel,
    VoidCallback? onSubmit,
  }) async {
    final authBloc = mockAuthBloc(signedIn);
    await pumpApp(
      tester,
      MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>.value(value: authBloc),
          BlocProvider<ProfileTodayWordsBloc>.value(
            value: mockProfileTodayWordsBloc(
              const ProfileTodayWordsLoadedState(words: []),
            ),
          ),
        ],
        child: ProfileFormContent(
          login: user.email!,
          signedIn: signedIn,
          passwordController: password,
          passwordAgainController: passwordAgain,
          showPasswordChangedNotice: showPasswordChangedNotice,
          onCancel: onCancel ?? () {},
          onSubmit: onSubmit ?? () {},
        ),
      ),
    );
    return authBloc;
  }

  testWidgets('shows credentials and dispatches change/sign-out', (
    tester,
  ) async {
    final authBloc = await pumpContent(
      tester,
      signedIn: AuthSignedInState(user: user),
    );

    expect(find.text('user@test.com'), findsOneWidget);
    expect(find.text('Change'), findsOneWidget);
    expect(find.text('Sign out of account'), findsOneWidget);

    await tester.tap(find.text('Change'));
    await tester.tap(find.text('Sign out of account'));
    await tester.pump();

    verify(() => authBloc.add(const ToggleChangePasswordEvent())).called(1);
    verify(() => authBloc.add(const SignOutEvent())).called(1);
  });

  testWidgets('shows password fields, notice and actions', (tester) async {
    var cancelled = false;
    var submitted = false;

    await pumpContent(
      tester,
      signedIn: AuthSignedInState(
        user: user,
        isChangingPassword: true,
        error: AuthValidationError.passwordTooShort,
      ),
      showPasswordChangedNotice: true,
      onCancel: () => cancelled = true,
      onSubmit: () => submitted = true,
    );

    expect(find.text('confirmation'), findsOneWidget);
    expect(find.text('minimum 6 symbols'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
    expect(find.text('OK'), findsOneWidget);
    // notice is hidden while changing password
    expect(find.text('password changed'), findsNothing);

    await tester.tap(find.text('Cancel'));
    await tester.tap(find.text('OK'));
    expect(cancelled, isTrue);
    expect(submitted, isTrue);
  });

  testWidgets('shows password changed notice in default mode', (tester) async {
    await pumpContent(
      tester,
      signedIn: AuthSignedInState(user: user),
      showPasswordChangedNotice: true,
    );

    expect(find.text('password changed'), findsOneWidget);
  });
}
