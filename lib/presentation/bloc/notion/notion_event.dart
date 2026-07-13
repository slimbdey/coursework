abstract class NotionEvent {
  const NotionEvent();
}

class FetchNotionsEvent extends NotionEvent {
  final String query;

  const FetchNotionsEvent({required this.query});
}

class SubmitAnswerEvent extends NotionEvent {
  final String answer;

  const SubmitAnswerEvent({required this.answer});
}

class SkipNotionEvent extends NotionEvent {
  const SkipNotionEvent();
}
