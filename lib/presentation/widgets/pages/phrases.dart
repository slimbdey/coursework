import 'package:coursework/presentation/bloc/notion/notion_event.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/widgets/shared/notion/notion_training/index.dart';
import 'package:flutter/material.dart';

class PhrasesPage extends StatelessWidget {
  const PhrasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return NotionTraining(
      fetchEvent: const FetchPhrasesEvent(),
      title: l10n.phrasesTitle,
      subtitle: l10n.phrasesSubtitle,
      emptyMessage: l10n.phrasesEmpty,
    );
  }
}
