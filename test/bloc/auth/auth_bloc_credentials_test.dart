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

  AuthBloc buildSignedIn() {
    final bloc = AuthBloc(loginService);

    bloc.emit(AuthSignedInState(user: user));
    return bloc;
  }

  test('ToggleChangePasswordEvent flips flag', () async {
    final states = await runBloc(
      buildSignedIn(),
      act: (bloc) => bloc.add(const ToggleChangePasswordEvent()),
    );

    expect(states, [
      isA<AuthSignedInState>().having(
        (s) => s.isChangingPassword,
        'isChangingPassword',
        true,
      ),
    ]);
  });

  test('CancelCredentialsEditEvent resets signed-in state', () async {
    final bloc = AuthBloc(loginService);

    bloc.emit(
      AuthSignedInState(
        user: user,
        isChangingPassword: true,
        error: AuthValidationError.passwordRequired,
      ),
    );

    final states = await runBloc(
      bloc,
      act: (b) => b.add(const CancelCredentialsEditEvent()),
    );

    expect(states, [
      isA<AuthSignedInState>()
          .having((s) => s.isChangingPassword, 'isChangingPassword', false)
          .having((s) => s.error, 'error', null),
    ]);
  });

  test('AlterCredentialsEvent succeeds', () async {
    when(
      () => loginService.alterCredentials(any(), any()),
    ).thenAnswer((_) async => user);

    final states = await runBloc(
      buildSignedIn(),
      act: (bloc) => bloc.add(
        const AlterCredentialsEvent('user@test.com', '123456', '123456'),
      ),
    );

    expect(states, [
      isA<AuthSignedInState>().having((s) => s.isUpdating, 'isUpdating', true),
      isA<AuthSignedInState>().having(
        (s) => s.credentialsUpdated,
        'credentialsUpdated',
        true,
      ),
    ]);
  });

  test('AlterCredentialsEvent validation error', () async {
    final states = await runBloc(
      buildSignedIn(),
      act: (bloc) =>
          bloc.add(const AlterCredentialsEvent('user@test.com', '123', '123')),
    );

    expect(states, [
      isA<AuthSignedInState>().having((s) => s.isUpdating, 'isUpdating', true),
      isA<AuthSignedInState>().having(
        (s) => s.error,
        'error',
        AuthValidationError.passwordTooShort,
      ),
    ]);
  });

  test('AlterCredentialsEvent service failure', () async {
    when(
      () => loginService.alterCredentials(any(), any()),
    ).thenAnswer((_) async => null);

    final states = await runBloc(
      buildSignedIn(),
      act: (bloc) => bloc.add(
        const AlterCredentialsEvent('user@test.com', '123456', '123456'),
      ),
    );

    expect(states, [
      isA<AuthSignedInState>().having((s) => s.isUpdating, 'isUpdating', true),
      isA<AuthSignedInState>().having(
        (s) => s.error,
        'error',
        AuthValidationError.alterCredentialsFailed,
      ),
    ]);
  });
}
