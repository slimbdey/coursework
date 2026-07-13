import 'package:coursework/application/infrastructure/queries/get_shuffled_idioms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'notion_event.dart';
import 'notion_state.dart';

class NotionBloc extends Bloc<NotionEvent, NotionState> {
  final GetShuffledIdioms getShuffledIdioms;

  NotionBloc({required this.getShuffledIdioms})
    : super(const NotionInitialState()) {
    on<FetchNotionsEvent>(_onFetch);
    on<SubmitAnswerEvent>(_onSubmit);
    on<SkipNotionEvent>(_onSkip);
  }

  Future<void> _onFetch(
    FetchNotionsEvent event,
    Emitter<NotionState> emit,
  ) async {
    emit(NotionLoadingState(query: event.query));

    try {
      final notions = await getShuffledIdioms(event.query);
      emit(
        NotionLoadedState(
          query: event.query,
          notions: notions,
        ),
      );
    } catch (e) {
      emit(
        NotionErrorState(query: event.query, message: e.toString()),
      );
    }
  }

  void _onSubmit(SubmitAnswerEvent event, Emitter<NotionState> emit) {
    final current = state;
    if (current is! NotionLoadedState || current.isFinished) {
      return;
    }

    final notion = current.current;
    if (notion == null) {
      return;
    }

    final isCorrect = _normalize(event.answer) == _normalize(notion.answer);

    emit(
      current.copyWith(
        correctCount: isCorrect
            ? current.correctCount + 1
            : current.correctCount,
        incorrectCount: isCorrect
            ? current.incorrectCount
            : current.incorrectCount + 1,
        currentIndex: current.hasNext
            ? current.currentIndex + 1
            : current.currentIndex,
        isFinished: !current.hasNext,
        previousNotion: notion,
      ),
    );
  }

  void _onSkip(SkipNotionEvent event, Emitter<NotionState> emit) {
    final current = state;
    if (current is! NotionLoadedState || !current.hasNext) {
      return;
    }

    final notion = current.current;
    if (notion == null) {
      return;
    }

    emit(
      current.copyWith(
        currentIndex: current.currentIndex + 1,
        previousNotion: notion,
      ),
    );
  }

  String _normalize(String value) => value.trim().toLowerCase();
}
