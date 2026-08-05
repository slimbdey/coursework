import 'package:coursework/presentation/bloc/notion/notion_event.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/widgets/shared/notion/notion_training/index.dart';
import 'package:flutter/material.dart';

class IdiomsPage extends StatelessWidget {
  const IdiomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return NotionTraining(
      fetchEvent: const FetchIdiomsEvent(),
      title: l10n.idiomsTitle,
      subtitle: l10n.idiomsSubtitle,
      emptyMessage: l10n.idiomsEmpty,
    );
  }
}
