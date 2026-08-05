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

  test('CheckAuthEvent emits SignedIn when user exists', () async {
    when(() => loginService.getCurrentUser()).thenAnswer((_) async => user);

    final states = await runBloc(
      AuthBloc(loginService),
      act: (bloc) => bloc.add(const CheckAuthEvent()),
    );

    expect(states, [isA<AuthSignedInState>()]);
  });

  test('CheckAuthEvent emits nothing when user is null', () async {
    when(() => loginService.getCurrentUser()).thenAnswer((_) async => null);

    final states = await runBloc(
      AuthBloc(loginService),
      act: (bloc) => bloc.add(const CheckAuthEvent()),
    );

    expect(states, isEmpty);
  });

  test('SignInEvent succeeds', () async {
    when(
      () => loginService.signInWithLoginPassword(any(), any()),
    ).thenAnswer((_) async => user);

    final states = await runBloc(
      AuthBloc(loginService),
      act: (bloc) => bloc.add(const SignInEvent('user@test.com', '123456')),
    );

    expect(states, [isA<AuthLoadingState>(), isA<AuthSignedInState>()]);
  });

  test('SignInEvent validation error for empty login', () async {
    final states = await runBloc(
      AuthBloc(loginService),
      act: (bloc) => bloc.add(const SignInEvent('', '123456')),
    );

    expect(states, [
      isA<AuthLoadingState>(),
      isA<AuthErrorState>().having(
        (s) => s.error,
        'error',
        AuthValidationError.loginRequired,
      ),
    ]);
    verify(() => loginService.signOut()).called(1);
  });

  test('SignInEvent maps service failure to loginFailed', () async {
    when(
      () => loginService.signInWithLoginPassword(any(), any()),
    ).thenAnswer((_) async => null);

    final states = await runBloc(
      AuthBloc(loginService),
      act: (bloc) => bloc.add(const SignInEvent('user@test.com', '123456')),
    );

    expect(states, [
      isA<AuthLoadingState>(),
      isA<AuthErrorState>().having(
        (s) => s.error,
        'error',
        AuthValidationError.loginFailed,
      ),
    ]);
  });
}
