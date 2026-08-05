import 'package:coursework/presentation/bloc/training/training_bloc/index.dart';
import 'package:coursework/presentation/bloc/training/training_event.dart';
import 'package:coursework/presentation/bloc/training/training_state.dart';
import 'package:coursework/presentation/widgets/shared/notion/notion_card/index.dart';
import 'package:coursework/presentation/widgets/shared/notion/notion_stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../training_finished.dart';

class TrainingSession extends StatelessWidget {
  final TrainingLoadedState state;

  const TrainingSession({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.isFinished) {
      return TrainingFinished(state: state);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        NotionStats(
          correctCount: state.correctCount,
          incorrectCount: state.incorrectCount,
          totalPercent: state.totalPercent,
          canSkip: !state.isFinished && state.current != null,
          onSkip: () =>
              context.read<TrainingBloc>().add(const SkipTrainingEvent()),
        ),
        const SizedBox(height: 8),
        NotionCard(
          notion: state.current!,
          previousNotion: state.previousWord,
          questionNumber: state.currentIndex + 1,
          totalCount: state.roundWords.length,
          lastAnswerCorrect: state.lastAnswerCorrect,
          answerFeedbackKey: state.answerFeedbackKey,
          onSubmit: (answer) => context.read<TrainingBloc>().add(
            SubmitTrainingAnswerEvent(answer: answer),
          ),
        ),
      ],
    );
  }
}
