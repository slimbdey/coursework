import 'package:coursework/presentation/bloc/notion/notion_event.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/widgets/shared/notion/notion_training/index.dart';
import 'package:flutter/material.dart';

class GerundsPage extends StatelessWidget {
  const GerundsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return NotionTraining(
      fetchEvent: const FetchGerundsEvent(),
      title: l10n.gerundsTitle,
      subtitle: l10n.gerundsSubtitle,
      emptyMessage: l10n.gerundsEmpty,
    );
  }
}
