import 'package:coursework/domain/word.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import 'word_card.dart';

class SearchResults extends StatelessWidget {
  final List<Word> words;
  final String query;

  const SearchResults({super.key, required this.words, required this.query});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.searchFormMatches(words.length),
          style: TextStyle(
            color: colorScheme.error,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: ListView.separated(
            itemCount: words.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final word = words[index];
              return SearchWordCard(
                key: ValueKey(
                  '${word.id ?? word.word}-${word.addDate}-${word.example}',
                ),
                word: word,
                query: query,
              );
            },
          ),
        ),
      ],
    );
  }
}
