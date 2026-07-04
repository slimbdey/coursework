import 'package:coursework/application/infrastructure/search_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository searchRepository;

  SearchBloc({required this.searchRepository})
    : super(const SearchInitialState()) {
    on<SearchWordsEvent>((event, emit) async {
      emit(SearchLoadingState(query: event.query));

      try {
        final words = await searchRepository.searchWords(event.query);
        emit(SearchLoadedState(query: event.query, words: words));
      } catch (e) {
        emit(
          SearchErrorState(query: event.query, message: e.toString()),
        );
      }
    });
  }
}
