import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class NotionStats extends StatelessWidget {
  final int correctCount;
  final int incorrectCount;
  final int totalPercent;
  final bool canSkip;
  final bool showSkip;
  final VoidCallback? onSkip;

  const NotionStats({
    super.key,
    required this.correctCount,
    required this.incorrectCount,
    required this.totalPercent,
    this.canSkip = false,
    this.showSkip = true,
    this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final statsStyle = textTheme.bodySmall;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: showSkip
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.center,
      mainAxisSize: showSkip ? MainAxisSize.max : MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.statsCorrect(correctCount), style: statsStyle),
            const SizedBox(width: 16),
            Text(l10n.statsIncorrect(incorrectCount), style: statsStyle),
            const SizedBox(width: 16),
            Text(
              l10n.statsTotal(totalPercent),
              style: statsStyle?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        if (showSkip)
          TextButton(
            onPressed: canSkip ? onSkip : null,
            style: TextButton.styleFrom(
              foregroundColor: colorScheme.error,
              padding: const EdgeInsets.all(8),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(l10n.statsSkip),
          ),
      ],
    );
  }
}
