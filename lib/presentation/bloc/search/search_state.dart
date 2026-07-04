import 'package:coursework/domain/word.dart';

abstract class SearchState {
  const SearchState();
}

class SearchInitialState extends SearchState {
  const SearchInitialState();
}

class SearchLoadingState extends SearchState {
  final String query;

  const SearchLoadingState({required this.query});
}

class SearchLoadedState extends SearchState {
  final String query;
  final List<Word> words;

  const SearchLoadedState({required this.query, required this.words});
}

class SearchErrorState extends SearchState {
  final String query;
  final String message;

  const SearchErrorState({required this.query, required this.message});
}
