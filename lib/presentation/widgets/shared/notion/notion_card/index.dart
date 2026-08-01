import 'package:coursework/domain/notion.dart';
import 'package:coursework/presentation/bloc/notion/notion_bloc.dart';
import 'package:coursework/presentation/bloc/notion/notion_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../notion_previous_answer.dart';
import 'answer_feedback.dart';
import 'notion_card_answer.dart';
import 'notion_card_frame.dart';
import 'notion_card_question.dart';

class NotionCard extends StatefulWidget {
  final Notion notion;
  final Notion? previousNotion;
  final int questionNumber;
  final int totalCount;

  const NotionCard({
    super.key,
    required this.notion,
    required this.questionNumber,
    required this.totalCount,
    this.previousNotion,
  });

  @override
  State<NotionCard> createState() => _NotionCardState();
}

class _NotionCardState extends State<NotionCard> {
  final TextEditingController _answerController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final AnswerFeedback _feedback = AnswerFeedback();

  @override
  void didUpdateWidget(covariant NotionCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.questionNumber != widget.questionNumber) {
      _answerController.clear();
      _focusNode.requestFocus();
    }
  }

  @override
  void dispose() {
    _feedback.dispose();
    _answerController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onSubmit() {
    final answer = _answerController.text.trim();
    if (answer.isEmpty) {
      return;
    }

    _feedback.show(
      isCorrect: NotionBloc.isAnswerCorrect(
        answer: answer,
        expected: widget.notion.answer,
      ),
    );
    context.read<NotionBloc>().add(SubmitAnswerEvent(answer: answer));
  }

  @override
  Widget build(BuildContext context) {
    final previous = widget.previousNotion;

    return NotionCardFrame(
      questionNumber: widget.questionNumber,
      totalCount: widget.totalCount,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NotionCardQuestion(issue: widget.notion.issue),
          const SizedBox(height: 16),
          NotionCardAnswer(
            controller: _answerController,
            focusNode: _focusNode,
            feedback: _feedback,
            onSubmit: _onSubmit,
          ),
          if (previous != null) ...[
            const SizedBox(height: 24),
            NotionPreviousAnswer(notion: previous),
          ],
        ],
      ),
    );
  }
}
