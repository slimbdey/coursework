import 'package:coursework/presentation/bloc/training/training_bloc/round_factory.dart';
import 'package:coursework/presentation/bloc/training/training_state.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/fixtures.dart';

void main() {
  const factory = TrainingRoundFactory();

  test('isAnswerCorrect ignores case and spaces', () {
    expect(
      TrainingRoundFactory.isAnswerCorrect(
        answer: '  Hello ',
        expected: 'hello',
      ),
      isTrue,
    );
    expect(
      TrainingRoundFactory.isAnswerCorrect(answer: 'no', expected: 'yes'),
      isFalse,
    );
  });

  test('withScore increments correctCount', () {
    final wordItem = word(translation: 'привет');
    final state = TrainingLoadedState(
      login: 'u',
      groups: [
        [wordItem],
      ],
      roundGroupCounts: const [1],
      roundWords: [wordItem],
    );

    final scored = factory.withScore(
      state: state,
      word: wordItem,
      answer: 'Привет',
    );

    expect(scored.correctCount, 1);
    expect(scored.incorrectCount, 0);
    expect(scored.lastAnswerCorrect, isTrue);
    expect(scored.answerFeedbackKey, 1);
  });

  test('withScore increments incorrectCount', () {
    final wordItem = word(translation: 'привет');
    final state = TrainingLoadedState(
      login: 'u',
      groups: [
        [wordItem],
      ],
      roundGroupCounts: const [1],
      roundWords: [wordItem],
    );

    final scored = factory.withScore(
      state: state,
      word: wordItem,
      answer: 'wrong',
    );

    expect(scored.correctCount, 0);
    expect(scored.incorrectCount, 1);
    expect(scored.lastAnswerCorrect, isFalse);
  });

  test('start builds round words for given round', () {
    final set = trainingSet();
    final state = factory.start(login: 'u', set: set, roundIndex: 0);

    expect(state.login, 'u');
    expect(state.currentRoundIndex, 0);
    expect(state.roundWords, isNotEmpty);
    expect(state.groups.length, 2);
  });
}
