import 'package:coursework/presentation/bloc/db_info/db_info_bloc.dart';
import 'package:coursework/presentation/bloc/db_info/db_info_state.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/widgets/shared/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DbInformation extends StatelessWidget {
  const DbInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return BlocBuilder<DbInfoBloc, DbInfoState>(
      builder: (context, state) {
        return switch (state) {
          DbInfoLoadingState() => const Center(
            child: Loader(),
          ),
          DbInfoLoadedState() => DefaultTextStyle(
            style: theme.labelLarge!,
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.infoTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: theme.headlineMedium?.color,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('${l10n.infoWords} ${state.dbInfo.words}'),
                  Text('${l10n.infoPhrases} ${state.dbInfo.phrases}'),
                  Text('${l10n.infoGerunds} ${state.dbInfo.gerunds}'),
                  Text('${l10n.infoPhrasals} ${state.dbInfo.phrasals}'),
                  Text('${l10n.infoIdioms} ${state.dbInfo.idioms}'),
                ],
              ),
            ),
          ),
          DbInfoErrorState(:final message) => Center(
            child: Text(message, textAlign: TextAlign.center),
          ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}
