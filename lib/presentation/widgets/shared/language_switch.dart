import 'package:coursework/presentation/l10n/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coursework/presentation/bloc/locale/locale_bloc.dart';
import 'package:coursework/presentation/bloc/locale/locale_event.dart';
import 'package:coursework/presentation/bloc/locale/locale_state.dart';

class LanguageSwitch extends StatelessWidget {
  const LanguageSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleBloc, LocaleState>(
      builder: (context, state) {
        final currentLang = state.locale.languageCode;
        final isRu = currentLang == Locales.ru;

        return TextButton.icon(
          onPressed: () {
            context.read<LocaleBloc>().add(
              ChangeLocaleEvent(isRu ? Locales.en : Locales.ru),
            );
          },
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
            visualDensity: VisualDensity.compact,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            minimumSize: Size.zero,
          ),
          icon: const Icon(Icons.language, size: 20),
          label: Text(
            currentLang.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        );
      },
    );
  }
}
