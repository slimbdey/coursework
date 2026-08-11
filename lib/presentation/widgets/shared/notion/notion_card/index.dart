import 'package:coursework/domain/notion.dart';
import 'package:flutter/material.dart';

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
  final void Function(String answer) onSubmit;
  final bool? lastAnswerCorrect;
  final int answerFeedbackKey;
  final bool showFrame;

  const NotionCard({
    super.key,
    required this.notion,
    required this.questionNumber,
    required this.totalCount,
    required this.onSubmit,
    this.previousNotion,
    this.lastAnswerCorrect,
    this.answerFeedbackKey = 0,
    this.showFrame = true,
  });

  @override
  State<NotionCard> createState() => _NotionCardState();
}

class _NotionCardState extends State<NotionCard> {
  final TextEditingController _answerController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final AnswerFeedback _feedback = AnswerFeedback();

  @override
  void initState() {
    super.initState();
    _requestFocus();
    _showFeedbackIfNeeded();
  }

  @override
  void didUpdateWidget(covariant NotionCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.questionNumber != widget.questionNumber ||
        oldWidget.notion.id != widget.notion.id) {
      _answerController.clear();
      _requestFocus();
    }

    if (widget.answerFeedbackKey != oldWidget.answerFeedbackKey) {
      _showFeedbackIfNeeded();
    }
  }

  void _requestFocus() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _focusNode.requestFocus();
      }
    });
  }

  void _showFeedbackIfNeeded() {
    final isCorrect = widget.lastAnswerCorrect;
    if (isCorrect == null || widget.answerFeedbackKey == 0) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _feedback.show(isCorrect: isCorrect);
      }
    });
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

    widget.onSubmit(answer);
  }

  @override
  Widget build(BuildContext context) {
    final previous = widget.previousNotion;

    final content = Column(
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
    );

    if (!widget.showFrame) {
      return content;
    }

    return NotionCardFrame(
      questionNumber: widget.questionNumber,
      totalCount: widget.totalCount,
      child: content,
    );
  }
}
