import 'package:coursework/application/infrastructure/queries/training_set_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../training_event.dart';
import '../training_state.dart';
import 'answer_handlers.dart';
import 'round_factory.dart';

class TrainingBloc extends Bloc<TrainingEvent, TrainingState>
    with TrainingAnswerHandlers {
  final TrainingSetProvider trainingSetProvider;

  @override
  final TrainingRoundFactory rounds = const TrainingRoundFactory();

  TrainingBloc({required this.trainingSetProvider})
    : super(const TrainingInitialState()) {
    on<FetchTrainingEvent>(_onFetch);
    on<SubmitTrainingAnswerEvent>(onSubmit);
    on<SkipTrainingEvent>(onSkip);
    on<RestartTrainingEvent>(onRestart);
  }

  static bool isAnswerCorrect({
    required String answer,
    required String expected,
  }) => TrainingRoundFactory.isAnswerCorrect(
    answer: answer,
    expected: expected,
  );

  Future<void> _onFetch(
    FetchTrainingEvent event,
    Emitter<TrainingState> emit,
  ) async {
    emit(TrainingLoadingState(login: event.login));

    try {
      final set = await trainingSetProvider.getSet(event.login);
      emit(
        set.isEmpty
            ? TrainingLoadedState(
                login: event.login,
                groups: const [],
                roundGroupCounts: const [],
                roundWords: const [],
              )
            : rounds.start(login: event.login, set: set, roundIndex: 0),
      );
    } catch (e) {
      emit(TrainingErrorState(login: event.login, message: e.toString()));
    }
  }
}
