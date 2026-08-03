import 'package:flutter_bloc/flutter_bloc.dart';

import '../training_event.dart';
import '../training_state.dart';
import 'round_factory.dart';

mixin TrainingAnswerHandlers on Bloc<TrainingEvent, TrainingState> {
  TrainingRoundFactory get rounds;

  void onSubmit(
    SubmitTrainingAnswerEvent event,
    Emitter<TrainingState> emit,
  ) {
    final current = state;
    if (current is! TrainingLoadedState || current.isFinished) {
      return;
    }

    final word = current.current;
    if (word == null) {
      return;
    }

    final scored = rounds.withScore(
      state: current,
      word: word,
      answer: event.answer,
    );

    if (current.hasNext) {
      emit(
        scored.copyWith(
          currentIndex: current.currentIndex + 1,
          previousWord: word,
        ),
      );
      return;
    }

    if (current.hasNextRound) {
      emit(
        rounds.start(
          login: current.login,
          groups: current.groups,
          roundGroupCounts: current.roundGroupCounts,
          roundIndex: current.currentRoundIndex + 1,
          correctCount: scored.correctCount,
          incorrectCount: scored.incorrectCount,
          previousWord: word,
        ),
      );
      return;
    }

    emit(scored.copyWith(isFinished: true, previousWord: word));
  }

  void onSkip(SkipTrainingEvent event, Emitter<TrainingState> emit) {
    final current = state;
    if (current is! TrainingLoadedState || current.isFinished) {
      return;
    }

    final word = current.current;
    if (word == null) {
      return;
    }

    final incorrectCount = current.incorrectCount + 1;

    if (current.hasNext) {
      emit(
        current.copyWith(
          incorrectCount: incorrectCount,
          currentIndex: current.currentIndex + 1,
          previousWord: word,
        ),
      );
      return;
    }

    if (current.hasNextRound) {
      emit(
        rounds.start(
          login: current.login,
          groups: current.groups,
          roundGroupCounts: current.roundGroupCounts,
          roundIndex: current.currentRoundIndex + 1,
          correctCount: current.correctCount,
          incorrectCount: incorrectCount,
          previousWord: word,
        ),
      );
      return;
    }

    emit(
      current.copyWith(
        incorrectCount: incorrectCount,
        isFinished: true,
        previousWord: word,
      ),
    );
  }

  void onRestart(RestartTrainingEvent event, Emitter<TrainingState> emit) {
    final current = state;
    if (current is! TrainingLoadedState || current.groups.isEmpty) {
      return;
    }

    emit(
      rounds.start(
        login: current.login,
        groups: current.groups,
        roundGroupCounts: current.roundGroupCounts,
        roundIndex: 0,
      ),
    );
  }
}
