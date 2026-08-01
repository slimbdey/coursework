import 'package:coursework/presentation/bloc/notion/notion_state.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/widgets/shared/notion/notion_card/index.dart';
import 'package:coursework/presentation/widgets/shared/notion/notion_header.dart';
import 'package:coursework/presentation/widgets/shared/notion/notion_stats.dart';
import 'package:flutter/material.dart';

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
  static const _finishedMinHeight = 220.0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

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
                NotionHeader(title: title, subtitle: subtitle),
                const SizedBox(height: 32),
                Align(
                  alignment: Alignment.topCenter,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: _formMaxWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        NotionStats(state: state),
                        const SizedBox(height: 8),
                        if (state.isFinished)
                          SizedBox(
                            height: _finishedMinHeight,
                            child: Center(child: Text(l10n.idiomsFinished)),
                          )
                        else
                          NotionCard(
                            notion: state.current!,
                            previousNotion: state.previousNotion,
                            questionNumber: state.currentIndex + 1,
                            totalCount: state.notions.length,
                          ),
                      ],
                    ),
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
