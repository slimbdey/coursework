import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class NotionProgress extends StatelessWidget {
  final int questionNumber;
  final int totalCount;

  const NotionProgress({
    super.key,
    required this.questionNumber,
    required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 30,
      child: Row(
        children: [
          Expanded(
            child: ColoredBox(
              color: colorScheme.primaryContainer,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    l10n.idiomsQuestion(questionNumber),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: colorScheme.onPrimaryContainer,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ColoredBox(
              color: colorScheme.inverseSurface,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    l10n.idiomsTotalCount(totalCount),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: colorScheme.onInverseSurface,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
