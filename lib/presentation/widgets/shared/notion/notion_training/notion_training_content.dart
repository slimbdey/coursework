import 'package:coursework/presentation/bloc/notion/notion_bloc.dart';
import 'package:coursework/presentation/bloc/notion/notion_event.dart';
import 'package:coursework/presentation/bloc/notion/notion_state.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/widgets/shared/notion/notion_card/index.dart';
import 'package:coursework/presentation/widgets/shared/notion/notion_header/index.dart';
import 'package:coursework/presentation/widgets/shared/notion/notion_stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    return CustomScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      slivers: [
        NotionSliverAppBar(title: title, subtitle: subtitle),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              _FormWidth(
                maxWidth: _formMaxWidth,
                child: NotionStats(
                  correctCount: state.correctCount,
                  incorrectCount: state.incorrectCount,
                  totalPercent: state.totalPercent,
                  canSkip: state.hasNext,
                  onSkip: () => context.read<NotionBloc>().add(
                    const SkipNotionEvent(),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              _FormWidth(
                maxWidth: _formMaxWidth,
                child: state.isFinished
                    ? SizedBox(
                        height: _finishedMinHeight,
                        child: Center(child: Text(l10n.idiomsFinished)),
                      )
                    : NotionCard(
                        notion: state.current!,
                        previousNotion: state.previousNotion,
                        questionNumber: state.currentIndex + 1,
                        totalCount: state.notions.length,
                        lastAnswerCorrect: state.lastAnswerCorrect,
                        answerFeedbackKey: state.answerFeedbackKey,
                        onSubmit: (answer) => context.read<NotionBloc>().add(
                          SubmitAnswerEvent(answer: answer),
                        ),
                      ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}

class _FormWidth extends StatelessWidget {
  final double maxWidth;
  final Widget child;

  const _FormWidth({required this.maxWidth, required this.child});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
