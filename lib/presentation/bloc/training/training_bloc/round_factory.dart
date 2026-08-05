import 'package:coursework/application/infrastructure/queries/training_set_provider.dart';
import 'package:coursework/domain/word.dart';

import '../training_state.dart';

class TrainingRoundFactory {
  const TrainingRoundFactory();

  TrainingLoadedState start({
    required String login,
    TrainingSet? set,
    List<List<Word>>? groups,
    List<int>? roundGroupCounts,
    required int roundIndex,
    int correctCount = 0,
    int incorrectCount = 0,
    Word? previousWord,
    bool? lastAnswerCorrect,
    int answerFeedbackKey = 0,
  }) {
    final resolvedGroups = set?.groups ?? groups!;
    final resolvedCounts = set?.roundGroupCounts ?? roundGroupCounts!;
    final roundWords = TrainingSet(
      groups: resolvedGroups,
      roundGroupCounts: resolvedCounts,
    ).shuffledWordsForRound(roundIndex);

    return TrainingLoadedState(
      login: login,
      groups: resolvedGroups,
      roundGroupCounts: resolvedCounts,
      currentRoundIndex: roundIndex,
      roundWords: roundWords,
      correctCount: correctCount,
      incorrectCount: incorrectCount,
      previousWord: previousWord,
      lastAnswerCorrect: lastAnswerCorrect,
      answerFeedbackKey: answerFeedbackKey,
    );
  }

  TrainingLoadedState withScore({
    required TrainingLoadedState state,
    required Word word,
    required String answer,
  }) {
    final correct = isAnswerCorrect(answer: answer, expected: word.answer);
    return state.copyWith(
      correctCount: correct ? state.correctCount + 1 : state.correctCount,
      incorrectCount: correct ? state.incorrectCount : state.incorrectCount + 1,
      lastAnswerCorrect: correct,
      answerFeedbackKey: state.answerFeedbackKey + 1,
    );
  }

  static bool isAnswerCorrect({
    required String answer,
    required String expected,
  }) => answer.trim().toLowerCase() == expected.trim().toLowerCase();
}
