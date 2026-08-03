import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/widgets/shared/training/index.dart';
import 'package:flutter/material.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return WordTraining(
      title: l10n.trainingTitle,
      subtitle: l10n.trainingSubtitle,
      emptyMessage: l10n.trainingEmpty,
    );
  }
}
