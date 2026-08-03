import 'package:coursework/presentation/bloc/training/training_state.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/widgets/shared/notion/notion_header.dart';
import 'package:flutter/material.dart';

import 'training_session.dart';

class TrainingContent extends StatelessWidget {
  final TrainingLoadedState state;
  final String title;
  final String subtitle;

  const TrainingContent({
    super.key,
    required this.state,
    required this.title,
    required this.subtitle,
  });

  static const _formMaxWidth = 560.0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final roundSubtitle =
        '$subtitle\n'
        '${l10n.trainingRound(state.currentRoundNumber, state.totalRounds)}';

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraints.maxWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NotionHeader(title: title, subtitle: roundSubtitle),
                const SizedBox(height: 32),
                Align(
                  alignment: Alignment.topCenter,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: _formMaxWidth),
                    child: TrainingSession(state: state),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
