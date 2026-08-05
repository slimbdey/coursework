import 'package:coursework/domain/word.dart';

const Object _unset = Object();

abstract class TrainingState {
  const TrainingState();
}

class TrainingInitialState extends TrainingState {
  const TrainingInitialState();
}

class TrainingLoadingState extends TrainingState {
  final String login;

  const TrainingLoadingState({required this.login});
}

class TrainingLoadedState extends TrainingState {
  final String login;
  final List<List<Word>> groups;
  final List<int> roundGroupCounts;
  final int currentRoundIndex;
  final List<Word> roundWords;
  final int currentIndex;
  final int correctCount;
  final int incorrectCount;
  final bool isFinished;
  final Word? previousWord;
  final bool? lastAnswerCorrect;
  final int answerFeedbackKey;

  const TrainingLoadedState({
    required this.login,
    required this.groups,
    required this.roundGroupCounts,
    required this.roundWords,
    this.currentRoundIndex = 0,
    this.currentIndex = 0,
    this.correctCount = 0,
    this.incorrectCount = 0,
    this.isFinished = false,
    this.previousWord,
    this.lastAnswerCorrect,
    this.answerFeedbackKey = 0,
  });

  Word? get current =>
      roundWords.isEmpty || isFinished ? null : roundWords[currentIndex];

  bool get hasNext => !isFinished && currentIndex < roundWords.length - 1;

  bool get hasNextRound => currentRoundIndex < roundGroupCounts.length - 1;

  int get currentRoundNumber => currentRoundIndex + 1;

  int get totalRounds => roundGroupCounts.length;

  int get answeredCount => correctCount + incorrectCount;

  int get totalPercent {
    if (answeredCount == 0) {
      return 0;
    }
    return ((correctCount / answeredCount) * 100).round();
  }

  TrainingLoadedState copyWith({
    String? login,
    List<List<Word>>? groups,
    List<int>? roundGroupCounts,
    int? currentRoundIndex,
    List<Word>? roundWords,
    int? currentIndex,
    int? correctCount,
    int? incorrectCount,
    bool? isFinished,
    Word? previousWord,
    Object? lastAnswerCorrect = _unset,
    int? answerFeedbackKey,
  }) {
    return TrainingLoadedState(
      login: login ?? this.login,
      groups: groups ?? this.groups,
      roundGroupCounts: roundGroupCounts ?? this.roundGroupCounts,
      currentRoundIndex: currentRoundIndex ?? this.currentRoundIndex,
      roundWords: roundWords ?? this.roundWords,
      currentIndex: currentIndex ?? this.currentIndex,
      correctCount: correctCount ?? this.correctCount,
      incorrectCount: incorrectCount ?? this.incorrectCount,
      isFinished: isFinished ?? this.isFinished,
      previousWord: previousWord ?? this.previousWord,
      lastAnswerCorrect: identical(lastAnswerCorrect, _unset)
          ? this.lastAnswerCorrect
          : lastAnswerCorrect as bool?,
      answerFeedbackKey: answerFeedbackKey ?? this.answerFeedbackKey,
    );
  }
}

class TrainingErrorState extends TrainingState {
  final String login;
  final String message;

  const TrainingErrorState({required this.login, required this.message});
}
