import 'package:flutter/material.dart';

class NotionCardQuestion extends StatelessWidget {
  final String issue;

  const NotionCardQuestion({super.key, required this.issue});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Center(
        child: Text(
          issue,
          textAlign: TextAlign.center,
          style: textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
