import 'package:coursework/application/infrastructure/queries/shuffled_notion_provider.dart';
import 'package:coursework/domain/notion.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'notion_event.dart';
import 'notion_state.dart';

class NotionBloc extends Bloc<NotionEvent, NotionState> {
  final ShuffledNotionProvider shuffledNotionProvider;

  NotionBloc({required this.shuffledNotionProvider})
    : super(const NotionInitialState()) {
    on<FetchIdiomsEvent>(_onFetchIdioms);
    on<FetchPhrasesEvent>(_onFetchPhrases);
    on<FetchGerundsEvent>(_onFetchGerunds);
    on<FetchGeneralsEvent>(_onFetchGenerals);
    on<SubmitAnswerEvent>(_onSubmit);
    on<SkipNotionEvent>(_onSkip);
  }

  Future<void> _fetchHandler(
    String query,
    Future<List<Notion>> Function(String) handler,
    Emitter<NotionState> emit,
  ) async {
    emit(NotionLoadingState(query: query));

    try {
      final notions = await handler(query);
      emit(NotionLoadedState(query: query, notions: notions));
    } catch (e) {
      emit(NotionErrorState(query: query, message: e.toString()));
    }
  }

  Future<void> _onFetchIdioms(
    FetchIdiomsEvent event,
    Emitter<NotionState> emit,
  ) => _fetchHandler(event.query, shuffledNotionProvider.getIdioms, emit);

  Future<void> _onFetchPhrases(
    FetchPhrasesEvent event,
    Emitter<NotionState> emit,
  ) => _fetchHandler(event.query, shuffledNotionProvider.getPhrases, emit);

  Future<void> _onFetchGerunds(
    FetchGerundsEvent event,
    Emitter<NotionState> emit,
  ) => _fetchHandler(event.query, shuffledNotionProvider.getGerunds, emit);

  Future<void> _onFetchGenerals(
    FetchGeneralsEvent event,
    Emitter<NotionState> emit,
  ) => _fetchHandler(event.query, shuffledNotionProvider.getGenerals, emit);

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
