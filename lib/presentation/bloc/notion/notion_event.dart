abstract class NotionEvent {
  const NotionEvent();
}

class FetchIdiomsEvent extends NotionEvent {
  const FetchIdiomsEvent();
}

class FetchPhrasesEvent extends NotionEvent {
  const FetchPhrasesEvent();
}

class FetchGerundsEvent extends NotionEvent {
  const FetchGerundsEvent();
}

class FetchGeneralsEvent extends NotionEvent {
  const FetchGeneralsEvent();
}

class SubmitAnswerEvent extends NotionEvent {
  final String answer;
  const SubmitAnswerEvent({required this.answer});
}

class SkipNotionEvent extends NotionEvent {
  const SkipNotionEvent();
}
