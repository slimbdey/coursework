import 'package:coursework/presentation/bloc/profile_today_words/profile_today_words_bloc.dart';
import 'package:coursework/presentation/bloc/profile_today_words/profile_today_words_state.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/widgets/shared/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../profile_form_fieldset.dart';
import 'words_table.dart';

class ProfileTodayWords extends StatelessWidget {
  const ProfileTodayWords({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return ProfileFormFieldset(
      title: l10n.profileWordsTitle,
      child: BlocBuilder<ProfileTodayWordsBloc, ProfileTodayWordsState>(
        builder: (context, state) {
          if (state is ProfileTodayWordsLoadingState ||
              state is ProfileTodayWordsInitialState) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(child: Loader()),
            );
          }

          if (state is ProfileTodayWordsErrorState) {
            return Text(
              state.message,
              style: TextStyle(color: colorScheme.error, fontSize: 12),
            );
          }

          if (state is ProfileTodayWordsLoadedState) {
            if (state.words.isEmpty) {
              return Text(
                l10n.generalEmpty,
                style: TextStyle(
                  fontSize: 14,
                  color: colorScheme.onSurfaceVariant,
                ),
              );
            }

            return ProfileTodayWordsTable(
              words: state.words,
              textStyle: TextStyle(
                fontSize: 14,
                height: 1.45,
                color: colorScheme.onSurfaceVariant,
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
