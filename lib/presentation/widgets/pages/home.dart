import 'package:coursework/application/infrastructure/word_repository.dart';
import 'package:coursework/presentation/bloc/search/search_bloc.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/widgets/forms/search_form/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchBloc(wordRepository: context.read<WordRepository>()),
      child: const _HomePageBody(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final titleColor =
        textTheme.bodyMedium?.color ?? Theme.of(context).colorScheme.primary;
    final hintColor = textTheme.headlineMedium?.color;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png', width: 80, height: 80),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.searchFormTitle,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        color: titleColor,
                      ),
                    ),
                    Text(
                      l10n.searchFormHint1,
                      style: TextStyle(color: hintColor, fontSize: 12),
                    ),
                    Text(
                      l10n.searchFormHint2,
                      style: TextStyle(color: hintColor, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Expanded(child: SearchForm()),
          ],
        ),
      ),
    );
  }
}
