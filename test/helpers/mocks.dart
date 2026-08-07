import 'package:coursework/application/infrastructure/db_info_repository.dart';
import 'package:coursework/application/infrastructure/login_service.dart';
import 'package:coursework/application/infrastructure/queries/shuffled_notion_provider.dart';
import 'package:coursework/application/infrastructure/queries/training_set_provider.dart';
import 'package:coursework/application/infrastructure/word_repository.dart';
import 'package:coursework/presentation/bloc/auth/auth_bloc.dart';
import 'package:coursework/presentation/bloc/auth/auth_event.dart';
import 'package:coursework/presentation/bloc/auth/auth_state.dart';
import 'package:coursework/presentation/bloc/profile_today_words/profile_today_words_bloc.dart';
import 'package:coursework/presentation/bloc/profile_today_words/profile_today_words_event.dart';
import 'package:coursework/presentation/bloc/profile_today_words/profile_today_words_state.dart';
import 'package:coursework/presentation/bloc/search/search_bloc.dart';
import 'package:coursework/presentation/bloc/search/search_event.dart';
import 'package:coursework/presentation/bloc/search/search_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginService extends Mock implements LoginService {}

class MockWordRepository extends Mock implements WordRepository {}

class MockDbInfoRepository extends Mock implements DbInfoRepository {}

class MockShuffledNotionProvider extends Mock
    implements ShuffledNotionProvider {}

class MockTrainingSetProvider extends Mock implements TrainingSetProvider {}

class MockAuthBloc extends Mock implements AuthBloc {}

class MockProfileTodayWordsBloc extends Mock implements ProfileTodayWordsBloc {}

class MockSearchBloc extends Mock implements SearchBloc {}

class FakeUser extends Fake implements User {
  FakeUser({this.email = 'user@test.com'});

  @override
  final String? email;
}

class FakeAuthEvent extends Fake implements AuthEvent {}

class FakeProfileTodayWordsEvent extends Fake
    implements ProfileTodayWordsEvent {}

class FakeSearchEvent extends Fake implements SearchEvent {}

T stubBloc<T extends BlocBase<S>, S>(T bloc, S state) {
  when(() => bloc.state).thenReturn(state);
  when(() => bloc.stream).thenAnswer((_) => Stream.value(state));
  when(() => bloc.close()).thenAnswer((_) async {});
  return bloc;
}

MockAuthBloc mockAuthBloc(AuthState state) {
  final bloc = stubBloc(MockAuthBloc(), state);
  when(() => bloc.add(any())).thenReturn(null);
  return bloc;
}

MockProfileTodayWordsBloc mockProfileTodayWordsBloc(
  ProfileTodayWordsState state,
) {
  final bloc = stubBloc(MockProfileTodayWordsBloc(), state);
  when(() => bloc.add(any())).thenReturn(null);
  return bloc;
}

MockSearchBloc mockSearchBloc(SearchState state) {
  final bloc = stubBloc(MockSearchBloc(), state);
  when(() => bloc.add(any())).thenReturn(null);
  return bloc;
}
