abstract class NotionEvent {
  const NotionEvent();
}

class FetchIdiomsEvent extends NotionEvent {
  final String query;
  const FetchIdiomsEvent({required this.query});
}

class FetchPhrasesEvent extends NotionEvent {
  final String query;
  const FetchPhrasesEvent({required this.query});
}

class FetchGerundsEvent extends NotionEvent {
  final String query;
  const FetchGerundsEvent({required this.query});
}

class FetchGeneralsEvent extends NotionEvent {
  final String query;
  const FetchGeneralsEvent({required this.query});
}

class SubmitAnswerEvent extends NotionEvent {
  final String answer;
  const SubmitAnswerEvent({required this.answer});
}

class SkipNotionEvent extends NotionEvent {
  const SkipNotionEvent();
}
