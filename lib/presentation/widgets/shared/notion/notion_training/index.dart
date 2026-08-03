import 'package:coursework/application/infrastructure/notion_repository.dart';
import 'package:coursework/application/infrastructure/queries/shuffled_notion_provider.dart';
import 'package:coursework/presentation/bloc/auth/auth_bloc.dart';
import 'package:coursework/presentation/bloc/auth/auth_state.dart';
import 'package:coursework/presentation/bloc/notion/notion_bloc.dart';
import 'package:coursework/presentation/bloc/notion/notion_event.dart';
import 'package:coursework/presentation/bloc/notion/notion_state.dart';
import 'package:coursework/presentation/widgets/shared/loader.dart';
import 'package:coursework/presentation/widgets/shared/notion/notion_retry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'notion_training_content.dart';

class NotionTraining extends StatelessWidget {
  final NotionEvent Function(String query) fetchEvent;
  final String title;
  final String subtitle;
  final String emptyMessage;

  const NotionTraining({
    super.key,
    required this.fetchEvent,
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
    final event = fetchEvent(login);

    return BlocProvider(
      create: (context) => NotionBloc(
        shuffledNotionProvider: ShuffledNotionProvider(
          repository: context.read<NotionRepository>(),
        ),
      )..add(event),
      child: BlocBuilder<NotionBloc, NotionState>(
        builder: (context, state) {
          if (state is NotionLoadingState || state is NotionInitialState) {
            return const Center(child: Loader());
          }

          if (state is NotionErrorState) {
            return NotionRetry(
              message: state.message,
              onRefresh: () => _refresh(context, event),
            );
          }

          if (state is NotionLoadedState) {
            if (state.notions.isEmpty) {
              return NotionRetry(
                message: emptyMessage,
                onRefresh: () => _refresh(context, event),
              );
            }

            return NotionTrainingContent(
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

  Future<void> _refresh(BuildContext context, NotionEvent event) async {
    final bloc = context.read<NotionBloc>();
    bloc.add(event);
    await bloc.stream.firstWhere((state) => state is! NotionLoadingState);
  }
}
