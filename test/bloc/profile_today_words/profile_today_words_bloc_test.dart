import 'package:coursework/presentation/bloc/profile_today_words/profile_today_words_bloc.dart';
import 'package:coursework/presentation/bloc/profile_today_words/profile_today_words_event.dart';
import 'package:coursework/presentation/bloc/profile_today_words/profile_today_words_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/bloc_harness.dart';
import '../../helpers/fixtures.dart';
import '../../helpers/mocks.dart';

void main() {
  late MockWordRepository repository;
  late MockLoginService loginService;
  final words = [word(id: 1), word(id: 2)];

  setUp(() {
    repository = MockWordRepository();
    loginService = MockLoginService();
    when(
      () => loginService.getCurrentUser(),
    ).thenAnswer((_) async => FakeUser(email: 'u@test.com'));
  });

  ProfileTodayWordsBloc build() => ProfileTodayWordsBloc(
    wordRepository: repository,
    loginService: loginService,
  );

  test('FetchProfileTodayWordsEvent loads words', () async {
    when(() => repository.getSet(any())).thenAnswer((_) async => words);

    final states = await runBloc(
      build(),
      act: (bloc) => bloc.add(const FetchProfileTodayWordsEvent()),
    );

    expect(states, [
      isA<ProfileTodayWordsLoadingState>(),
      isA<ProfileTodayWordsLoadedState>().having(
        (s) => s.words,
        'words',
        words,
      ),
    ]);
    verify(() => repository.getSet('u@test.com')).called(1);
  });

  test('FetchProfileTodayWordsEvent emits error on failure', () async {
    when(() => repository.getSet(any())).thenThrow(Exception('fail'));

    final states = await runBloc(
      build(),
      act: (bloc) => bloc.add(const FetchProfileTodayWordsEvent()),
    );

    expect(states, [
      isA<ProfileTodayWordsLoadingState>(),
      isA<ProfileTodayWordsErrorState>(),
    ]);
  });
}
