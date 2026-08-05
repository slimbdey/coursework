import 'package:coursework/application/infrastructure/login_service.dart';
import 'package:coursework/application/infrastructure/word_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_today_words_event.dart';
import 'profile_today_words_state.dart';

class ProfileTodayWordsBloc
    extends Bloc<ProfileTodayWordsEvent, ProfileTodayWordsState> {
  final WordRepository wordRepository;
  final LoginService loginService;

  ProfileTodayWordsBloc({
    required this.wordRepository,
    required this.loginService,
  }) : super(const ProfileTodayWordsInitialState()) {
    on<FetchProfileTodayWordsEvent>(_onFetch);
  }

  Future<void> _onFetch(
    FetchProfileTodayWordsEvent event,
    Emitter<ProfileTodayWordsState> emit,
  ) async {
    emit(const ProfileTodayWordsLoadingState());

    try {
      final user = await loginService.getCurrentUser();
      final login = user?.email ?? '';
      final words = await wordRepository.getSet(login);
      emit(ProfileTodayWordsLoadedState(words: words));
    } catch (e) {
      emit(ProfileTodayWordsErrorState(message: e.toString()));
    }
  }
}
