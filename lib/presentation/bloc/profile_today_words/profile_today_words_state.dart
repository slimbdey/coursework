import 'package:coursework/domain/word.dart';

abstract class ProfileTodayWordsState {
  const ProfileTodayWordsState();
}

class ProfileTodayWordsInitialState extends ProfileTodayWordsState {
  const ProfileTodayWordsInitialState();
}

class ProfileTodayWordsLoadingState extends ProfileTodayWordsState {
  const ProfileTodayWordsLoadingState();
}

class ProfileTodayWordsLoadedState extends ProfileTodayWordsState {
  final List<Word> words;

  const ProfileTodayWordsLoadedState({required this.words});
}

class ProfileTodayWordsErrorState extends ProfileTodayWordsState {
  final String message;

  const ProfileTodayWordsErrorState({required this.message});
}
