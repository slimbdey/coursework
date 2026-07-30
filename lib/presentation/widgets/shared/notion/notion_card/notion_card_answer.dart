import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/theme/index.dart';
import 'package:coursework/presentation/widgets/shared/form_action_button.dart';
import 'package:coursework/presentation/widgets/shared/form_text_input.dart';
import 'package:flutter/material.dart';

import 'answer_feedback.dart';

class NotionCardAnswer extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final AnswerFeedback feedback;
  final VoidCallback onSubmit;

  const NotionCardAnswer({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.feedback,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final errorColor = Theme.of(context).colorScheme.error;

    return SizedBox(
      height: FormTextInput.controlHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ValueListenableBuilder<bool?>(
              valueListenable: feedback,
              builder: (context, isCorrect, child) => FormTextInput(
                controller: controller,
                focusNode: focusNode,
                onSubmitted: onSubmit,
                onChanged: (_) => feedback.hide(),
                shadowColor: isCorrect == null
                    ? null
                    : (isCorrect ? AppTheme.success : errorColor),
              ),
            ),
          ),
          const SizedBox(width: 8),
          FormActionButton(label: l10n.idiomsSubmit, onPressed: onSubmit),
        ],
      ),
    );
  }
}
