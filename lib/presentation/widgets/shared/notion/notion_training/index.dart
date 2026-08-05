import 'package:coursework/application/infrastructure/login_service.dart';
import 'package:coursework/application/infrastructure/queries/shuffled_notion_provider.dart';
import 'package:coursework/presentation/bloc/notion/notion_bloc.dart';
import 'package:coursework/presentation/bloc/notion/notion_event.dart';
import 'package:coursework/presentation/bloc/notion/notion_state.dart';
import 'package:coursework/presentation/widgets/shared/loader.dart';
import 'package:coursework/presentation/widgets/shared/notion/notion_retry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'notion_training_content.dart';

class NotionTraining extends StatelessWidget {
  final NotionEvent fetchEvent;
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
    return BlocProvider(
      create: (context) => NotionBloc(
        shuffledNotionProvider: context.read<ShuffledNotionProvider>(),
        loginService: context.read<LoginService>(),
      )..add(fetchEvent),
      child: BlocBuilder<NotionBloc, NotionState>(
        builder: (context, state) {
          if (state is NotionLoadingState || state is NotionInitialState) {
            return const Center(child: Loader());
          }

          if (state is NotionErrorState) {
            return NotionRetry(
              message: state.message,
              onRefresh: () => _refresh(context),
            );
          }

          if (state is NotionLoadedState) {
            if (state.notions.isEmpty) {
              return NotionRetry(
                message: emptyMessage,
                onRefresh: () => _refresh(context),
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

  Future<void> _refresh(BuildContext context) async {
    final bloc = context.read<NotionBloc>();
    bloc.add(fetchEvent);
    await bloc.stream.firstWhere((state) => state is! NotionLoadingState);
  }
}
