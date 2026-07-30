import 'package:flutter/material.dart';

import '../notion_progress.dart';

class NotionCardFrame extends StatelessWidget {
  final int questionNumber;
  final int totalCount;
  final Widget child;

  const NotionCardFrame({
    super.key,
    required this.questionNumber,
    required this.totalCount,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          NotionProgress(
            questionNumber: questionNumber,
            totalCount: totalCount,
          ),
          Expanded(
            child: Padding(padding: const EdgeInsets.all(24), child: child),
          ),
        ],
      ),
    );
  }
}
