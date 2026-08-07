import 'package:coursework/presentation/bloc/notion/notion_bloc.dart';
import 'package:coursework/presentation/bloc/notion/notion_event.dart';
import 'package:coursework/presentation/bloc/notion/notion_state.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/bloc_harness.dart';
import '../../helpers/fixtures.dart';
import '../../helpers/mocks.dart';

void main() {
  late MockShuffledNotionProvider provider;
  late MockLoginService loginService;
  final notions = [notion(id: 1, answer: 'yes'), notion(id: 2, answer: 'no')];

  setUp(() {
    provider = MockShuffledNotionProvider();
    loginService = MockLoginService();
  });

  NotionBloc buildLoaded({bool finished = false, int index = 0}) {
    final bloc = NotionBloc(
      shuffledNotionProvider: provider,
      loginService: loginService,
    );

    bloc.emit(
      NotionLoadedState(
        query: 'u@test.com',
        notions: notions,
        currentIndex: index,
        isFinished: finished,
      ),
    );
    return bloc;
  }

  test('SubmitAnswerEvent counts correct answer and advances', () async {
    final states = await runBloc(
      buildLoaded(),
      act: (bloc) => bloc.add(const SubmitAnswerEvent(answer: ' YES ')),
    );

    expect(states, [
      isA<NotionLoadedState>()
          .having((s) => s.correctCount, 'correctCount', 1)
          .having((s) => s.incorrectCount, 'incorrectCount', 0)
          .having((s) => s.currentIndex, 'currentIndex', 1)
          .having((s) => s.lastAnswerCorrect, 'lastAnswerCorrect', true),
    ]);
  });

  test('SubmitAnswerEvent counts incorrect answer', () async {
    final states = await runBloc(
      buildLoaded(),
      act: (bloc) => bloc.add(const SubmitAnswerEvent(answer: 'wrong')),
    );

    expect(states, [
      isA<NotionLoadedState>()
          .having((s) => s.correctCount, 'correctCount', 0)
          .having((s) => s.incorrectCount, 'incorrectCount', 1)
          .having((s) => s.lastAnswerCorrect, 'lastAnswerCorrect', false),
    ]);
  });

  test('SubmitAnswerEvent finishes on last notion', () async {
    final states = await runBloc(
      buildLoaded(index: 1),
      act: (bloc) => bloc.add(const SubmitAnswerEvent(answer: 'no')),
    );

    expect(states, [
      isA<NotionLoadedState>()
          .having((s) => s.isFinished, 'isFinished', true)
          .having((s) => s.correctCount, 'correctCount', 1),
    ]);
  });

  test('SkipNotionEvent advances without scoring', () async {
    final states = await runBloc(
      buildLoaded(),
      act: (bloc) => bloc.add(const SkipNotionEvent()),
    );

    expect(states, [
      isA<NotionLoadedState>()
          .having((s) => s.currentIndex, 'currentIndex', 1)
          .having((s) => s.correctCount, 'correctCount', 0)
          .having((s) => s.incorrectCount, 'incorrectCount', 0),
    ]);
  });

  test('SubmitAnswerEvent ignored when finished', () async {
    final states = await runBloc(
      buildLoaded(finished: true),
      act: (bloc) => bloc.add(const SubmitAnswerEvent(answer: 'yes')),
    );

    expect(states, isEmpty);
  });
}
