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

  final first = word(id: 1, translation: 'один');
  final second = word(id: 2, translation: 'два');

  test('SubmitTrainingAnswerEvent moves to next round', () async {
    final states = await runBloc(
      buildWith(
        trainingLoaded(
          roundWords: [first],
          groups: [
            [first],
            [second],
          ],
          roundGroupCounts: const [1, 2],
          currentRoundIndex: 0,
        ),
      ),
      act: (bloc) =>
          bloc.add(const SubmitTrainingAnswerEvent(answer: 'один')),
    );

    expect(states, [
      isA<TrainingLoadedState>()
          .having((s) => s.currentRoundIndex, 'currentRoundIndex', 1)
          .having((s) => s.currentIndex, 'currentIndex', 0)
          .having((s) => s.correctCount, 'correctCount', 1)
          .having((s) => s.isFinished, 'isFinished', false),
    ]);
  });

  test('SkipTrainingEvent moves to next round as incorrect', () async {
    final states = await runBloc(
      buildWith(
        trainingLoaded(
          roundWords: [first],
          groups: [
            [first],
            [second],
          ],
          roundGroupCounts: const [1, 2],
          currentRoundIndex: 0,
        ),
      ),
      act: (bloc) => bloc.add(const SkipTrainingEvent()),
    );

    expect(states, [
      isA<TrainingLoadedState>()
          .having((s) => s.currentRoundIndex, 'currentRoundIndex', 1)
          .having((s) => s.incorrectCount, 'incorrectCount', 1)
          .having((s) => s.isFinished, 'isFinished', false),
    ]);
  });
}
