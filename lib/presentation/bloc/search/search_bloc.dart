import 'package:coursework/application/infrastructure/word_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final WordRepository wordRepository;

  SearchBloc({required this.wordRepository})
    : super(const SearchInitialState()) {
    on<SearchWordsEvent>((event, emit) async {
      emit(SearchLoadingState(query: event.query));

      try {
        final words = await wordRepository.searchWords(event.query);
        emit(SearchLoadedState(query: event.query, words: words));
      } catch (e) {
        emit(SearchErrorState(query: event.query, message: e.toString()));
      }
    });
  }
}
