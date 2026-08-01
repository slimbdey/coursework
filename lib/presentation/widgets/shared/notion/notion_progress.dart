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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final leftColor = isDark
        ? const Color(0xFF355F82)
        : colorScheme.primaryContainer;
    final rightColor = isDark
        ? const Color(0xFF3A3F46)
        : colorScheme.inverseSurface;
    final leftTextColor = colorScheme.onPrimaryContainer;
    final rightTextColor =
        isDark ? colorScheme.onSurface : colorScheme.onInverseSurface;

    return SizedBox(
      height: 30,
      child: Row(
        children: [
          Expanded(
            child: ColoredBox(
              color: leftColor,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    l10n.idiomsQuestion(questionNumber),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: leftTextColor,
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
              color: rightColor,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    l10n.idiomsTotalCount(totalCount),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: rightTextColor,
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
