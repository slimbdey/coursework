import 'package:coursework/application/infrastructure/login_service.dart';
import 'package:coursework/application/infrastructure/queries/training_set_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../training_event.dart';
import '../training_state.dart';
import 'answer_handlers.dart';
import 'round_factory.dart';

class TrainingBloc extends Bloc<TrainingEvent, TrainingState>
    with TrainingAnswerHandlers {
  final TrainingSetProvider trainingSetProvider;
  final LoginService loginService;

  @override
  final TrainingRoundFactory rounds = const TrainingRoundFactory();

  TrainingBloc({
    required this.trainingSetProvider,
    required this.loginService,
  }) : super(const TrainingInitialState()) {
    on<FetchTrainingEvent>(_onFetch);
    on<SubmitTrainingAnswerEvent>(onSubmit);
    on<SkipTrainingEvent>(onSkip);
    on<RestartTrainingEvent>(onRestart);
  }

  Future<void> _onFetch(
    FetchTrainingEvent event,
    Emitter<TrainingState> emit,
  ) async {
    final user = await loginService.getCurrentUser();
    final login = user?.email ?? '';

    emit(TrainingLoadingState(login: login));

    try {
      final set = await trainingSetProvider.getSet(login);
      emit(
        set.isEmpty
            ? TrainingLoadedState(
                login: login,
                groups: const [],
                roundGroupCounts: const [],
                roundWords: const [],
              )
            : rounds.start(login: login, set: set, roundIndex: 0),
      );
    } catch (e) {
      emit(TrainingErrorState(login: login, message: e.toString()));
    }
  }
}
