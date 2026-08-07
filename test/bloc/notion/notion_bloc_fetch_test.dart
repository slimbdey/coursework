import 'package:coursework/presentation/bloc/notion/notion_bloc.dart';
import 'package:coursework/presentation/bloc/notion/notion_event.dart';
import 'package:coursework/presentation/bloc/notion/notion_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/bloc_harness.dart';
import '../../helpers/fixtures.dart';
import '../../helpers/mocks.dart';

void main() {
  late MockShuffledNotionProvider provider;
  late MockLoginService loginService;
  final notions = [notion(id: 1), notion(id: 2, answer: 'other')];

  setUp(() {
    provider = MockShuffledNotionProvider();
    loginService = MockLoginService();
    when(
      () => loginService.getCurrentUser(),
    ).thenAnswer((_) async => FakeUser(email: 'u@test.com'));
  });

  NotionBloc build() =>
      NotionBloc(shuffledNotionProvider: provider, loginService: loginService);

  test('FetchIdiomsEvent loads notions', () async {
    when(() => provider.getIdioms(any())).thenAnswer((_) async => notions);

    final states = await runBloc(
      build(),
      act: (bloc) => bloc.add(const FetchIdiomsEvent()),
    );

    expect(states, [
      isA<NotionLoadingState>().having((s) => s.query, 'query', 'u@test.com'),
      isA<NotionLoadedState>()
          .having((s) => s.notions, 'notions', notions)
          .having((s) => s.query, 'query', 'u@test.com'),
    ]);
  });

  test('FetchPhrasesEvent loads notions', () async {
    when(() => provider.getPhrases(any())).thenAnswer((_) async => notions);

    final states = await runBloc(
      build(),
      act: (bloc) => bloc.add(const FetchPhrasesEvent()),
    );

    expect(states, [isA<NotionLoadingState>(), isA<NotionLoadedState>()]);
  });

  test('FetchGerundsEvent loads notions', () async {
    when(() => provider.getGerunds(any())).thenAnswer((_) async => notions);

    final states = await runBloc(
      build(),
      act: (bloc) => bloc.add(const FetchGerundsEvent()),
    );

    expect(states, [isA<NotionLoadingState>(), isA<NotionLoadedState>()]);
  });

  test('FetchGeneralsEvent emits error on failure', () async {
    when(() => provider.getGenerals(any())).thenThrow(Exception('network'));

    final states = await runBloc(
      build(),
      act: (bloc) => bloc.add(const FetchGeneralsEvent()),
    );

    expect(states, [isA<NotionLoadingState>(), isA<NotionErrorState>()]);
  });
}
