import 'package:coursework/presentation/bloc/notion/notion_event.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/widgets/shared/notion/notion_training/index.dart';
import 'package:flutter/material.dart';

class CommonPage extends StatelessWidget {
  const CommonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return NotionTraining(
      fetchEvent: const FetchGeneralsEvent(),
      title: l10n.generalTitle,
      subtitle: l10n.generalSubtitle,
      emptyMessage: l10n.generalEmpty,
    );
  }
}
