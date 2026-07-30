import 'package:coursework/presentation/bloc/notion/notion_event.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/widgets/shared/notion/notion_training/index.dart';
import 'package:flutter/material.dart';

class CommonPage extends StatelessWidget {
  const CommonPage({super.key});

  static const _formHeight = 350.0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return NotionTraining(
      fetchEvent: (query) => FetchGeneralsEvent(query: query),
      title: l10n.generalTitle,
      subtitle: l10n.generalSubtitle,
      emptyMessage: l10n.generalEmpty,
      formHeight: _formHeight,
    );
  }
}
