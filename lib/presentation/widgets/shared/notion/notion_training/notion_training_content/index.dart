import 'package:coursework/presentation/bloc/notion/notion_bloc.dart';
import 'package:coursework/presentation/bloc/notion/notion_event.dart';
import 'package:coursework/presentation/bloc/notion/notion_state.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/widgets/shared/notion/notion_header/index.dart';
import 'package:coursework/presentation/widgets/shared/notion/notion_stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'form_width.dart';
import 'question_switcher.dart';

class NotionTrainingContent extends StatelessWidget {
  final NotionLoadedState state;
  final String title;
  final String subtitle;

  const NotionTrainingContent({
    super.key,
    required this.state,
    required this.title,
    required this.subtitle,
  });

  static const _formMaxWidth = 560.0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return CustomScrollView(
      slivers: [
        NotionSliverAppBar(title: title, subtitle: subtitle),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              FormWidth(
                maxWidth: _formMaxWidth,
                child: NotionStats(
                  correctCount: state.correctCount,
                  incorrectCount: state.incorrectCount,
                  totalPercent: state.totalPercent,
                  canSkip: state.hasNext,
                  onSkip: () =>
                      context.read<NotionBloc>().add(const SkipNotionEvent()),
                ),
              ),
              const SizedBox(height: 8),
              FormWidth(
                maxWidth: _formMaxWidth,
                child: QuestionSwitcher(
                  state: state,
                  finishedLabel: l10n.idiomsFinished,
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
