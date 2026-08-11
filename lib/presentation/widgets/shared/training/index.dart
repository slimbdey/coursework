import 'package:coursework/application/infrastructure/login_service.dart';
import 'package:coursework/application/infrastructure/queries/training_set_provider.dart';
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
    return BlocProvider(
      create: (context) => TrainingBloc(
        trainingSetProvider: context.read<TrainingSetProvider>(),
        loginService: context.read<LoginService>(),
      )..add(const FetchTrainingEvent()),
      child: Builder(
        builder: (context) {
          final bloc = context.read<TrainingBloc>();
          return StreamBuilder<TrainingState>(
            stream: bloc.stream,
            initialData: bloc.state,
            builder: (context, snapshot) {
              final state = snapshot.data;
              if (state == null ||
                  state is TrainingLoadingState ||
                  state is TrainingInitialState) {
                return const Center(child: Loader());
              }

              if (state is TrainingErrorState) {
                return NotionRetry(
                  message: state.message,
                  onRefresh: () => _refresh(context),
                );
              }

              if (state is TrainingLoadedState) {
                if (state.groups.isEmpty) {
                  return NotionRetry(
                    message: emptyMessage,
                    onRefresh: () => _refresh(context),
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
          );
        },
      ),
    );
  }

  Future<void> _refresh(BuildContext context) async {
    final bloc = context.read<TrainingBloc>();
    bloc.add(const FetchTrainingEvent());
    await bloc.stream.firstWhere((state) => state is! TrainingLoadingState);
  }
}
