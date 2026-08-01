import 'package:coursework/application/infrastructure/word_repository.dart';
import 'package:coursework/domain/word.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/widgets/shared/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../profile_form_fieldset.dart';
import 'words_table.dart';

class ProfileTodayWords extends StatefulWidget {
  final String login;

  const ProfileTodayWords({super.key, required this.login});

  @override
  State<ProfileTodayWords> createState() => _ProfileTodayWordsState();
}

class _ProfileTodayWordsState extends State<ProfileTodayWords> {
  Future<List<Word>>? _wordsFuture;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _wordsFuture ??= context.read<WordRepository>().getSet(widget.login);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return ProfileFormFieldset(
      title: l10n.profileWordsTitle,
      child: FutureBuilder<List<Word>>(
        future: _wordsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(child: Loader()),
            );
          }

          if (snapshot.hasError) {
            return Text(
              snapshot.error.toString(),
              style: TextStyle(color: colorScheme.error, fontSize: 12),
            );
          }

          final words = snapshot.data ?? const <Word>[];
          if (words.isEmpty) {
            return Text(
              l10n.generalEmpty,
              style: TextStyle(
                fontSize: 14,
                color: colorScheme.onSurfaceVariant,
              ),
            );
          }

          return ProfileTodayWordsTable(
            words: words,
            textStyle: TextStyle(
              fontSize: 14,
              height: 1.45,
              color: colorScheme.onSurfaceVariant,
            ),
          );
        },
      ),
    );
  }
}
