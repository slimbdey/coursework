import 'package:coursework/presentation/bloc/notion/notion_bloc.dart';
import 'package:coursework/presentation/bloc/notion/notion_event.dart';
import 'package:coursework/presentation/bloc/notion/notion_state.dart';
import 'package:coursework/presentation/widgets/shared/notion/notion_card/index.dart';
import 'package:coursework/presentation/widgets/shared/notion/notion_card/notion_card_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionSwitcher extends StatelessWidget {
  final NotionLoadedState state;
  final String finishedLabel;

  const QuestionSwitcher({
    super.key,
    required this.state,
    required this.finishedLabel,
  });

  static const _duration = Duration(milliseconds: 380);
  static const _finishedMinHeight = 220.0;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: _duration,
      curve: Curves.easeInOutCubic,
      alignment: Alignment.topCenter,
      child: state.isFinished
          ? SizedBox(
              key: const ValueKey('finished'),
              height: _finishedMinHeight,
              child: Center(child: Text(finishedLabel)),
            )
          : NotionCardFrame(
              questionNumber: state.currentIndex + 1,
              totalCount: state.notions.length,
              child: AnimatedSwitcher(
                duration: _duration,
                switchInCurve: Curves.easeOutCubic,
                switchOutCurve: Curves.easeInCubic,
                layoutBuilder: (currentChild, previousChildren) {
                  return Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      ...previousChildren,
                      if (currentChild != null) currentChild,
                    ],
                  );
                },
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeInOut,
                    ),
                    child: child,
                  );
                },
                child: NotionCard(
                  key: ValueKey(state.currentIndex),
                  showFrame: false,
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
            ),
    );
  }
}
