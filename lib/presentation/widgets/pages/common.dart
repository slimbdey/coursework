import 'package:coursework/application/infrastructure/notion_repository.dart';
import 'package:coursework/application/infrastructure/queries/shuffled_notion_provider.dart';
import 'package:coursework/presentation/bloc/auth/auth_bloc.dart';
import 'package:coursework/presentation/bloc/auth/auth_state.dart';
import 'package:coursework/presentation/bloc/notion/notion_bloc.dart';
import 'package:coursework/presentation/bloc/notion/notion_event.dart';
import 'package:coursework/presentation/bloc/notion/notion_state.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/widgets/shared/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/notion/notion_card.dart';
import '../shared/notion/notion_header.dart';
import '../shared/notion/notion_stats.dart';

class CommonPage extends StatelessWidget {
  const CommonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthBloc>().state;
    final login = authState is AuthSignedInState
        ? (authState.user.email ?? '')
        : '';

    return BlocProvider(
      create: (context) => NotionBloc(
        shuffledNotionProvider: ShuffledNotionProvider(
          repository: context.read<NotionRepository>(),
        ),
      )..add(FetchGeneralsEvent(query: login)),
      child: const _CommonPageBody(),
    );
  }
}

class _CommonPageBody extends StatelessWidget {
  const _CommonPageBody();

  static const _formMaxWidth = 560.0;
  static const _formHeight = 350.0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocBuilder<NotionBloc, NotionState>(
      builder: (context, state) {
        if (state is NotionLoadingState || state is NotionInitialState) {
          return const Center(child: Loader());
        }

        if (state is NotionErrorState) {
          return Center(child: Text(state.message));
        }

        if (state is NotionLoadedState) {
          if (state.notions.isEmpty) {
            return Center(child: Text(l10n.idiomsEmpty));
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NotionHeader(
                  title: l10n.generalTitle,
                  subtitle: l10n.generalSubtitle,
                ),
                const SizedBox(height: 32),
                Align(
                  alignment: Alignment.topCenter,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: _formMaxWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        NotionStats(state: state),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: _formHeight,
                          child: state.isFinished
                              ? Center(child: Text(l10n.idiomsFinished))
                              : NotionCard(
                                  notion: state.current!,
                                  previousNotion: state.previousNotion,
                                  questionNumber: state.currentIndex + 1,
                                  totalCount: state.notions.length,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
