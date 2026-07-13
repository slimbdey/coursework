import 'package:coursework/domain/word.dart';
import 'package:flutter/material.dart';

import 'highlighted_text.dart';

class SearchWordCard extends StatelessWidget {
  final Word word;
  final String query;

  const SearchWordCard({super.key, required this.word, required this.query});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final accentColor = textTheme.bodyMedium?.color ?? colorScheme.primary;
    final mutedColor =
        textTheme.headlineMedium?.color ??
        colorScheme.onSurface.withValues(alpha: 0.6);
    const borderRadius = BorderRadius.all(Radius.circular(4));

    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: borderRadius,
          border: Border.all(color: colorScheme.outline.withValues(alpha: 0.1)),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withValues(alpha: 0.15),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
              child: Row(
                children: [
                  Flexible(
                    child: HighlightedText(
                      text: word.word,
                      query: query,
                      style: TextStyle(
                        color: accentColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      word.ipa ?? '',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(color: mutedColor, fontSize: 14),
                    ),
                  ),
                  Flexible(
                    child: HighlightedText(
                      text: word.translation,
                      query: query,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: accentColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (word.example.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 4),
                child: Text(
                  word.example,
                  style: TextStyle(
                    color: colorScheme.onSurface.withValues(alpha: 0.8),
                    fontSize: 13,
                    height: 1.1,
                  ),
                ),
              ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: colorScheme.tertiary.withValues(alpha: 0.5),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(4),
                ),
                border: Border(
                  left: BorderSide(
                    color: colorScheme.outline.withValues(alpha: 0.05),
                  ),
                  right: BorderSide(
                    color: colorScheme.outline.withValues(alpha: 0.05),
                  ),
                  bottom: BorderSide(
                    color: colorScheme.outline.withValues(alpha: 0.05),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 2,
                ),
                child: Text(
                  word.addDate,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(color: mutedColor, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
