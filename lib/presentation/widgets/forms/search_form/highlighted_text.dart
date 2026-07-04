import 'package:flutter/material.dart';

class HighlightedText extends StatelessWidget {
  final String text;
  final String query;
  final TextStyle style;
  final TextAlign textAlign;

  const HighlightedText({
    super.key,
    required this.text,
    required this.query,
    required this.style,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final highlightColor = colorScheme.error;

    if (query.isEmpty) {
      return Text(
        text,
        textAlign: textAlign,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: style,
      );
    }

    final lowerText = text.toLowerCase();
    final lowerQuery = query.toLowerCase();
    final spans = <TextSpan>[];
    var start = 0;

    while (start < text.length) {
      final index = lowerText.indexOf(lowerQuery, start);
      if (index == -1) {
        spans.add(TextSpan(text: text.substring(start), style: style));
        break;
      }

      if (index > start) {
        spans.add(TextSpan(text: text.substring(start, index), style: style));
      }

      final matchEnd = index + lowerQuery.length;
      spans.add(
        TextSpan(
          text: text.substring(index, matchEnd),
          style: style.copyWith(color: highlightColor),
        ),
      );
      start = matchEnd;
    }

    return Text.rich(
      TextSpan(children: spans),
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
