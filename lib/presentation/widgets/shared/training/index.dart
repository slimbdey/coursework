import 'package:coursework/application/infrastructure/queries/training_set_provider.dart';
import 'package:coursework/application/infrastructure/word_repository.dart';
import 'package:coursework/presentation/bloc/auth/auth_bloc.dart';
import 'package:coursework/presentation/bloc/auth/auth_state.dart';
import 'package:coursework/presentation/bloc/training/training_bloc/index.dart';
import 'package:coursework/presentation/bloc/training/training_event.dart';
import 'package:coursework/presentation/bloc/training/training_state.dart';
import 'package:coursework/presentation/widgets/shared/loader.dart';
import 'package:coursework/presentation/widgets/shared/notion/notion_retry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'training_content/index.dart';

class WordTraining extends StatelessWidget {
  final String title;
  final String subtitle;
  final String emptyMessage;

  const WordTraining({
    super.key,
    required this.title,
    required this.subtitle,
    required this.emptyMessage,
  });

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthBloc>().state;
    final login = authState is AuthSignedInState
        ? (authState.user.email ?? '')
        : '';
    final event = FetchTrainingEvent(login: login);

    return BlocProvider(
      create: (context) => TrainingBloc(
        trainingSetProvider: TrainingSetProvider(
          repository: context.read<WordRepository>(),
        ),
      )..add(event),
      child: BlocBuilder<TrainingBloc, TrainingState>(
        builder: (context, state) {
          if (state is TrainingLoadingState || state is TrainingInitialState) {
            return const Center(child: Loader());
          }

          if (state is TrainingErrorState) {
            return NotionRetry(
              message: state.message,
              onRefresh: () => _refresh(context, event),
            );
          }

          if (state is TrainingLoadedState) {
            if (state.groups.isEmpty) {
              return NotionRetry(
                message: emptyMessage,
                onRefresh: () => _refresh(context, event),
              );
            }

            return TrainingContent(
              state: state,
              title: title,
              subtitle: subtitle,
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Future<void> _refresh(BuildContext context, FetchTrainingEvent event) async {
    final bloc = context.read<TrainingBloc>();
    bloc.add(event);
    await bloc.stream.firstWhere((state) => state is! TrainingLoadingState);
  }
}
