import 'package:coursework/presentation/bloc/training/training_bloc/index.dart';
import 'package:coursework/presentation/bloc/training/training_event.dart';
import 'package:coursework/presentation/bloc/training/training_state.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/widgets/shared/form_action_button.dart';
import 'package:coursework/presentation/widgets/shared/notion/notion_stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class TrainingFinished extends StatelessWidget {
  final TrainingLoadedState state;

  const TrainingFinished({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final minHeight = MediaQuery.sizeOf(context).height * 0.55;
    final titleColor = Theme.of(context).colorScheme.onSurfaceVariant;

    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: minHeight),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            l10n.trainingFinished,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              fontSize: 32,
              fontWeight: FontWeight.w200,
              letterSpacing: 0,
              color: titleColor,
            ),
          ),
          const SizedBox(height: 64),
          NotionStats(
            correctCount: state.correctCount,
            incorrectCount: state.incorrectCount,
            totalPercent: state.totalPercent,
            showSkip: false,
          ),
          const SizedBox(height: 24),
          FormActionButton(
            label: l10n.trainingRestart,
            onPressed: () =>
                context.read<TrainingBloc>().add(const RestartTrainingEvent()),
          ),
        ],
      ),
    );
  }
}
