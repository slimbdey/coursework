abstract class TrainingEvent {
  const TrainingEvent();
}

class FetchTrainingEvent extends TrainingEvent {
  final String login;

  const FetchTrainingEvent({required this.login});
}

class SubmitTrainingAnswerEvent extends TrainingEvent {
  final String answer;

  const SubmitTrainingAnswerEvent({required this.answer});
}

class SkipTrainingEvent extends TrainingEvent {
  const SkipTrainingEvent();
}

class RestartTrainingEvent extends TrainingEvent {
  const RestartTrainingEvent();
}
