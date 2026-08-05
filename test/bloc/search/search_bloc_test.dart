import 'package:coursework/presentation/bloc/search/search_bloc.dart';
import 'package:coursework/presentation/bloc/search/search_event.dart';
import 'package:coursework/presentation/bloc/search/search_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/bloc_harness.dart';
import '../../helpers/fixtures.dart';
import '../../helpers/mocks.dart';

void main() {
  late MockWordRepository repository;
  final words = [word(id: 1), word(id: 2, text: 'world')];

  setUp(() {
    repository = MockWordRepository();
  });

  test('SearchWordsEvent emits loaded words', () async {
    when(() => repository.searchWords(any())).thenAnswer((_) async => words);

    final states = await runBloc(
      SearchBloc(wordRepository: repository),
      act: (bloc) => bloc.add(const SearchWordsEvent(query: 'he')),
    );

    expect(states, [
      isA<SearchLoadingState>().having((s) => s.query, 'query', 'he'),
      isA<SearchLoadedState>()
          .having((s) => s.query, 'query', 'he')
          .having((s) => s.words, 'words', words),
    ]);
  });

  test('SearchWordsEvent emits error on failure', () async {
    when(() => repository.searchWords(any())).thenThrow(Exception('fail'));

    final states = await runBloc(
      SearchBloc(wordRepository: repository),
      act: (bloc) => bloc.add(const SearchWordsEvent(query: 'he')),
    );

    expect(states, [
      isA<SearchLoadingState>(),
      isA<SearchErrorState>().having((s) => s.query, 'query', 'he'),
    ]);
  });
}
