import 'package:coursework/presentation/bloc/training/training_bloc/index.dart';
import 'package:coursework/presentation/bloc/training/training_event.dart';
import 'package:coursework/presentation/bloc/training/training_state.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/widgets/shared/notion/notion_stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainingFinished extends StatelessWidget {
  final TrainingLoadedState state;

  const TrainingFinished({super.key, required this.state});

  static const _minHeight = 220.0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SizedBox(
      height: _minHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(l10n.trainingFinished, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          NotionStats(
            correctCount: state.correctCount,
            incorrectCount: state.incorrectCount,
            totalPercent: state.totalPercent,
            showSkip: false,
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () => context.read<TrainingBloc>().add(
              const RestartTrainingEvent(),
            ),
            child: Text(l10n.trainingRestart),
          ),
        ],
      ),
    );
  }
}
