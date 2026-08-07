import 'package:coursework/application/infrastructure/queries/training_set_provider.dart';
import 'package:coursework/presentation/bloc/training/training_bloc/index.dart';
import 'package:coursework/presentation/bloc/training/training_event.dart';
import 'package:coursework/presentation/bloc/training/training_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/bloc_harness.dart';
import '../../helpers/fixtures.dart';
import '../../helpers/mocks.dart';

void main() {
  late MockTrainingSetProvider provider;
  late MockLoginService loginService;

  setUp(() {
    provider = MockTrainingSetProvider();
    loginService = MockLoginService();
    when(
      () => loginService.getCurrentUser(),
    ).thenAnswer((_) async => FakeUser(email: 'u@test.com'));
  });

  TrainingBloc build() =>
      TrainingBloc(trainingSetProvider: provider, loginService: loginService);

  test('FetchTrainingEvent loads non-empty set', () async {
    when(() => provider.getSet(any())).thenAnswer((_) async => trainingSet());

    final states = await runBloc(
      build(),
      act: (bloc) => bloc.add(const FetchTrainingEvent()),
    );

    expect(states, [
      isA<TrainingLoadingState>().having((s) => s.login, 'login', 'u@test.com'),
      isA<TrainingLoadedState>()
          .having((s) => s.login, 'login', 'u@test.com')
          .having((s) => s.roundWords, 'roundWords', isNotEmpty),
    ]);
  });

  test('FetchTrainingEvent loads empty set', () async {
    when(() => provider.getSet(any())).thenAnswer(
      (_) async => const TrainingSet(groups: [], roundGroupCounts: []),
    );

    final states = await runBloc(
      build(),
      act: (bloc) => bloc.add(const FetchTrainingEvent()),
    );

    expect(states, [
      isA<TrainingLoadingState>(),
      isA<TrainingLoadedState>()
          .having((s) => s.groups, 'groups', isEmpty)
          .having((s) => s.roundWords, 'roundWords', isEmpty),
    ]);
  });

  test('FetchTrainingEvent emits error on failure', () async {
    when(() => provider.getSet(any())).thenThrow(Exception('db'));

    final states = await runBloc(
      build(),
      act: (bloc) => bloc.add(const FetchTrainingEvent()),
    );

    expect(states, [isA<TrainingLoadingState>(), isA<TrainingErrorState>()]);
  });
}
