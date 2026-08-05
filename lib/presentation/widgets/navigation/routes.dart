import 'package:coursework/presentation/bloc/auth/auth_guard.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

enum AppRoutes {
  home('/', Icons.home),
  account('/account', Icons.person),
  training('/training', Icons.directions_run),
  general('/general', Icons.star_border),
  gerunds('/gerunds', Icons.g_translate),
  phrases('/phrases', Icons.style),
  idioms('/idioms', Icons.waves);

  final String path;
  final IconData icon;
  const AppRoutes(this.path, this.icon);

  static const drawerRoutes = [
    AppRoutes.home,
    AppRoutes.training,
    AppRoutes.general,
    AppRoutes.gerunds,
    AppRoutes.phrases,
    AppRoutes.idioms,
  ];

  bool get requiresAuth => AuthGuard.isProtectedPath(path);

  static List<AppRoutes> visibleDrawerRoutes({required bool isAuthenticated}) =>
      drawerRoutes
          .where((route) => isAuthenticated || !route.requiresAuth)
          .toList();

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
    }
  }
}
