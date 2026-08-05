import 'package:coursework/presentation/bloc/auth/auth_bloc.dart';
import 'package:coursework/presentation/bloc/auth/auth_event.dart';
import 'package:coursework/presentation/bloc/auth/auth_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/bloc_harness.dart';
import '../../helpers/mocks.dart';

void main() {
  late MockLoginService loginService;

  setUp(() {
    loginService = MockLoginService();
    when(() => loginService.signOut()).thenAnswer((_) async {});
  });

  test('ToggleAuthModeEvent switches isSignIn', () async {
    final states = await runBloc(
      AuthBloc(loginService),
      act: (bloc) => bloc.add(const ToggleAuthModeEvent()),
    );

    expect(states, [
      isA<AuthModeState>().having((s) => s.isSignIn, 'isSignIn', false),
    ]);
  });

  test('SignOutEvent signs out and emits SignedOut', () async {
    final states = await runBloc(
      AuthBloc(loginService),
      act: (bloc) => bloc.add(const SignOutEvent()),
    );

    expect(states, [isA<AuthSignedOutState>()]);
    verify(() => loginService.signOut()).called(1);
  });

  test('ToggleChangePasswordEvent ignored when not signed in', () async {
    final states = await runBloc(
      AuthBloc(loginService),
      act: (bloc) => bloc.add(const ToggleChangePasswordEvent()),
    );

    expect(states, isEmpty);
  });

  test('AlterCredentialsEvent ignored when not signed in', () async {
    final states = await runBloc(
      AuthBloc(loginService),
      act: (bloc) => bloc.add(
        const AlterCredentialsEvent('user@test.com', '123456', '123456'),
      ),
    );

    expect(states, isEmpty);
  });
}
