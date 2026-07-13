import 'package:coursework/domain/notion.dart';
import 'package:coursework/presentation/bloc/notion/notion_bloc.dart';
import 'package:coursework/presentation/bloc/notion/notion_event.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/widgets/shared/form_action_button.dart';
import 'package:coursework/presentation/widgets/shared/form_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'notion_previous_answer.dart';
import 'notion_progress.dart';

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
    _answerController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onSubmit() {
    final answer = _answerController.text.trim();
    if (answer.isEmpty) {
      return;
    }

    context.read<NotionBloc>().add(SubmitAnswerEvent(answer: answer));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final previous = widget.previousNotion;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          NotionProgress(
            questionNumber: widget.questionNumber,
            totalCount: widget.totalCount,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        widget.notion.issue,
                        textAlign: TextAlign.center,
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: FormTextInput.controlHeight,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: FormTextInput(
                            controller: _answerController,
                            focusNode: _focusNode,
                            onSubmitted: _onSubmit,
                          ),
                        ),
                        const SizedBox(width: 8),
                        FormActionButton(
                          label: l10n.idiomsSubmit,
                          onPressed: _onSubmit,
                        ),
                      ],
                    ),
                  ),
                  if (previous != null) ...[
                    const SizedBox(height: 24),
                    Flexible(
                      child: SingleChildScrollView(
                        child: NotionPreviousAnswer(notion: previous),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
