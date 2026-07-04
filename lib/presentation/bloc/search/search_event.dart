abstract class SearchEvent {
  const SearchEvent();
}

class SearchWordsEvent extends SearchEvent {
  final String query;

  const SearchWordsEvent({required this.query});
}
