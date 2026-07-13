import 'package:coursework/domain/notion.dart';

abstract class NotionState {
  const NotionState();
}

class NotionInitialState extends NotionState {
  const NotionInitialState();
}

class NotionLoadingState extends NotionState {
  final String query;

  const NotionLoadingState({required this.query});
}

class NotionLoadedState extends NotionState {
  final String query;
  final List<Notion> notions;
  final int currentIndex;
  final int correctCount;
  final int incorrectCount;
  final bool isFinished;
  final Notion? previousNotion;

  const NotionLoadedState({
    required this.query,
    required this.notions,
    this.currentIndex = 0,
    this.correctCount = 0,
    this.incorrectCount = 0,
    this.isFinished = false,
    this.previousNotion,
  });

  Notion? get current =>
      notions.isEmpty || isFinished ? null : notions[currentIndex];

  bool get hasNext => !isFinished && currentIndex < notions.length - 1;

  int get answeredCount => correctCount + incorrectCount;

  int get totalPercent {
    if (answeredCount == 0) {
      return 0;
    }
    return ((correctCount / answeredCount) * 100).round();
  }

  NotionLoadedState copyWith({
    String? query,
    List<Notion>? notions,
    int? currentIndex,
    int? correctCount,
    int? incorrectCount,
    bool? isFinished,
    Notion? previousNotion,
  }) {
    return NotionLoadedState(
      query: query ?? this.query,
      notions: notions ?? this.notions,
      currentIndex: currentIndex ?? this.currentIndex,
      correctCount: correctCount ?? this.correctCount,
      incorrectCount: incorrectCount ?? this.incorrectCount,
      isFinished: isFinished ?? this.isFinished,
      previousNotion: previousNotion ?? this.previousNotion,
    );
  }
}

class NotionErrorState extends NotionState {
  final String query;
  final String message;

  const NotionErrorState({required this.query, required this.message});
}
