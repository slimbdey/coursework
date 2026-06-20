import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

enum AppRoutes {
  home('/'),
  account('/account'),
  training('/training'),
  general('/general'),
  gerunds('/gerunds'),
  phrases('/phrases'),
  idioms('/idioms'),
  verbs('/verbs');

  final String path;
  const AppRoutes(this.path);

  static String getLocalizedTitle(BuildContext context, String? path) {
    final currentRoute = AppRoutes.values.firstWhere(
      (route) => route.path == path,
      orElse: () => AppRoutes.home,
    );

    final l10n = AppLocalizations.of(context)!;

    switch (currentRoute) {
      case AppRoutes.home:
        return l10n.pageHome;
      case AppRoutes.account:
        return l10n.pageAccount;
      case AppRoutes.training:
        return l10n.pageTraining;
      case AppRoutes.general:
        return l10n.pageGeneral;
      case AppRoutes.gerunds:
        return l10n.pageGerund;
      case AppRoutes.phrases:
        return l10n.pagePhrases;
      case AppRoutes.idioms:
        return l10n.pageIdioms;
      case AppRoutes.verbs:
        return l10n.pageVerbs;
    }
  }
}
