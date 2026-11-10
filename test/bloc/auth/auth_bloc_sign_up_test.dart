import 'package:coursework/application/infrastructure/auth.dart';
import 'package:coursework/presentation/bloc/auth/auth_bloc.dart';
import 'package:coursework/presentation/bloc/auth/auth_event.dart';
import 'package:coursework/presentation/bloc/auth/auth_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/bloc_harness.dart';
import '../../helpers/mocks.dart';

void main() {
  late MockLoginService loginService;
  final user = FakeUser();

  setUp(() {
    loginService = MockLoginService();
    when(() => loginService.signOut()).thenAnswer((_) async {});
  });

  test('SignUpEvent succeeds', () async {
    when(
      () => loginService.registerWithLoginPassword(any(), any()),
    ).thenAnswer((_) async => user);

    final states = await runBloc(
      AuthBloc(loginService),
      act: (bloc) =>
          bloc.add(const SignUpEvent('user@test.com', '123456', '123456')),
    );

    expect(states, [isA<AuthLoadingState>(), isA<AuthSignedInState>()]);
  });

  test('SignUpEvent passwords do not match', () async {
    final states = await runBloc(
      AuthBloc(loginService),
      act: (bloc) =>
          bloc.add(const SignUpEvent('user@test.com', '123456', '654321')),
    );

    expect(states, [
      isA<AuthLoadingState>(),
      isA<AuthErrorState>().having(
        (s) => s.error,
        'error',
        AuthValidationError.passwordsDoNotMatch,
      ),
    ]);
  });

  test('SignUpEvent maps emailAlreadyInUse', () async {
    when(
      () => loginService.registerWithLoginPassword(any(), any()),
    ).thenThrow(AuthValidationError.emailAlreadyInUse);

    final states = await runBloc(
      AuthBloc(loginService),
      act: (bloc) =>
          bloc.add(const SignUpEvent('user@test.com', '123456', '123456')),
    );

    expect(states, [
      isA<AuthLoadingState>(),
      isA<AuthErrorState>().having(
        (s) => s.error,
        'error',
        AuthValidationError.emailAlreadyInUse,
      ),
    ]);
  });

  test('SignUpEvent maps unknown error to registerFailed', () async {
    when(
      () => loginService.registerWithLoginPassword(any(), any()),
    ).thenThrow(Exception('fail'));

    final states = await runBloc(
      AuthBloc(loginService),
      act: (bloc) =>
          bloc.add(const SignUpEvent('user@test.com', '123456', '123456')),
    );

    expect(states, [
      isA<AuthLoadingState>(),
      isA<AuthErrorState>().having(
        (s) => s.error,
        'error',
        AuthValidationError.registerFailed,
      ),
    ]);
  });
}
