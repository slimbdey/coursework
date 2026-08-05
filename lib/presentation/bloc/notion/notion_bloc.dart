import 'package:coursework/application/infrastructure/login_service.dart';
import 'package:coursework/application/infrastructure/queries/shuffled_notion_provider.dart';
import 'package:coursework/domain/notion.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'notion_event.dart';
import 'notion_state.dart';

class NotionBloc extends Bloc<NotionEvent, NotionState> {
  final ShuffledNotionProvider shuffledNotionProvider;
  final LoginService loginService;

  NotionBloc({
    required this.shuffledNotionProvider,
    required this.loginService,
  }) : super(const NotionInitialState()) {
    on<FetchIdiomsEvent>(_onFetchIdioms);
    on<FetchPhrasesEvent>(_onFetchPhrases);
    on<FetchGerundsEvent>(_onFetchGerunds);
    on<FetchGeneralsEvent>(_onFetchGenerals);
    on<SubmitAnswerEvent>(_onSubmit);
    on<SkipNotionEvent>(_onSkip);
  }

  Future<String> _currentLogin() async {
    final user = await loginService.getCurrentUser();
    return user?.email ?? '';
  }

  Future<void> _fetchHandler(
    Future<List<Notion>> Function(String) handler,
    Emitter<NotionState> emit,
  ) async {
    final query = await _currentLogin();
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
  ) => _fetchHandler(shuffledNotionProvider.getIdioms, emit);

  Future<void> _onFetchPhrases(
    FetchPhrasesEvent event,
    Emitter<NotionState> emit,
  ) => _fetchHandler(shuffledNotionProvider.getPhrases, emit);

  Future<void> _onFetchGerunds(
    FetchGerundsEvent event,
    Emitter<NotionState> emit,
  ) => _fetchHandler(shuffledNotionProvider.getGerunds, emit);

  Future<void> _onFetchGenerals(
    FetchGeneralsEvent event,
    Emitter<NotionState> emit,
  ) => _fetchHandler(shuffledNotionProvider.getGenerals, emit);

  void _onSubmit(SubmitAnswerEvent event, Emitter<NotionState> emit) {
    final current = state;
    if (current is! NotionLoadedState || current.isFinished) {
      return;
    }

    final notion = current.current;
    if (notion == null) {
      return;
    }

    final isCorrect = _isAnswerCorrect(
      answer: event.answer,
      expected: notion.answer,
    );

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
        lastAnswerCorrect: isCorrect,
        answerFeedbackKey: current.answerFeedbackKey + 1,
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

  static bool _isAnswerCorrect({
    required String answer,
    required String expected,
  }) => _normalize(answer) == _normalize(expected);

  static String _normalize(String value) => value.trim().toLowerCase();
}
