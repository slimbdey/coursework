import 'package:coursework/presentation/bloc/training/training_bloc/index.dart';
import 'package:coursework/presentation/bloc/training/training_event.dart';
import 'package:coursework/presentation/bloc/training/training_state.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/bloc_harness.dart';
import '../../helpers/fixtures.dart';
import '../../helpers/mocks.dart';

void main() {
  TrainingBloc buildWith(TrainingLoadedState state) {
    final bloc = TrainingBloc(
      trainingSetProvider: MockTrainingSetProvider(),
      loginService: MockLoginService(),
    );
    // ignore: invalid_use_of_visible_for_testing_member
    bloc.emit(state);
    return bloc;
  }

  test('SubmitTrainingAnswerEvent advances within round', () async {
    final states = await runBloc(
      buildWith(
        trainingLoaded(
          roundWords: [word(id: 1, translation: 'да'), word(id: 2)],
        ),
      ),
      act: (bloc) => bloc.add(const SubmitTrainingAnswerEvent(answer: 'да')),
    );

    expect(states, [
      isA<TrainingLoadedState>()
          .having((s) => s.correctCount, 'correctCount', 1)
          .having((s) => s.currentIndex, 'currentIndex', 1),
    ]);
  });

  test('SubmitTrainingAnswerEvent finishes last round', () async {
    final states = await runBloc(
      buildWith(trainingLoaded()),
      act: (bloc) => bloc.add(const SubmitTrainingAnswerEvent(answer: 'да')),
    );

    expect(states, [
      isA<TrainingLoadedState>()
          .having((s) => s.isFinished, 'isFinished', true)
          .having((s) => s.correctCount, 'correctCount', 1),
    ]);
  });

  test('SkipTrainingEvent counts as incorrect and advances', () async {
    final states = await runBloc(
      buildWith(trainingLoaded(roundWords: [word(id: 1), word(id: 2)])),
      act: (bloc) => bloc.add(const SkipTrainingEvent()),
    );

    expect(states, [
      isA<TrainingLoadedState>()
          .having((s) => s.incorrectCount, 'incorrectCount', 1)
          .having((s) => s.currentIndex, 'currentIndex', 1),
    ]);
  });

  test('RestartTrainingEvent resets to first round', () async {
    final states = await runBloc(
      buildWith(
        trainingLoaded(
          groups: [
            [word(id: 1)],
            [word(id: 2)],
          ],
          roundGroupCounts: const [1, 2],
          currentRoundIndex: 1,
          currentIndex: 0,
        ).copyWith(correctCount: 3, incorrectCount: 1),
      ),
      act: (bloc) => bloc.add(const RestartTrainingEvent()),
    );

    expect(states, [
      isA<TrainingLoadedState>()
          .having((s) => s.currentRoundIndex, 'currentRoundIndex', 0)
          .having((s) => s.correctCount, 'correctCount', 0)
          .having((s) => s.incorrectCount, 'incorrectCount', 0),
    ]);
  });

  test('events ignored when finished', () async {
    final states = await runBloc(
      buildWith(trainingLoaded(isFinished: true)),
      act: (bloc) {
        bloc
          ..add(const SubmitTrainingAnswerEvent(answer: 'да'))
          ..add(const SkipTrainingEvent());
      },
    );

    expect(states, isEmpty);
  });
}
