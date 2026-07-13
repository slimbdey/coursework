import 'package:coursework/domain/notion.dart';
import 'package:flutter/material.dart';

class NotionPreviousAnswer extends StatelessWidget {
  final Notion notion;

  const NotionPreviousAnswer({super.key, required this.notion});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Text(
          notion.issue,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: colorScheme.tertiaryContainer,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          notion.answer,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: colorScheme.error,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
