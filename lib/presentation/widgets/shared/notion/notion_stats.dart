import 'package:coursework/presentation/bloc/notion/notion_bloc.dart';
import 'package:coursework/presentation/bloc/notion/notion_event.dart';
import 'package:coursework/presentation/bloc/notion/notion_state.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotionStats extends StatelessWidget {
  final NotionLoadedState state;

  const NotionStats({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final statsStyle = textTheme.bodySmall;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            style: statsStyle,
            children: [
              TextSpan(
                text:
                    '${l10n.statsCorrect(state.correctCount)} '
                    '${l10n.statsIncorrect(state.incorrectCount)} ',
              ),
              TextSpan(
                text: l10n.statsTotal(state.totalPercent),
                style: statsStyle?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: state.hasNext
              ? () => context.read<NotionBloc>().add(const SkipNotionEvent())
              : null,
          style: TextButton.styleFrom(
            foregroundColor: colorScheme.error,
            padding: EdgeInsets.all(8),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(l10n.statsSkip),
        ),
      ],
    );
  }
}
