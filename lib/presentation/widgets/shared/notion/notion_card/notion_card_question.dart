import 'package:flutter/material.dart';

class NotionCardQuestion extends StatelessWidget {
  final String issue;

  const NotionCardQuestion({super.key, required this.issue});

  static const double minHeight = 96;
  static const double fontSize = 15;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: minHeight),
      child: Center(
        child: Text(
          issue,
          textAlign: TextAlign.center,
          style: textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: fontSize,
            height: 1.35,
            color: colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
