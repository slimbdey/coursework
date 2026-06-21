import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/widgets/shared/language_switch.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'drawer.dart';
import 'routes.dart';

class Shell extends StatelessWidget {
  final Widget child;
  final GoRouterState state;

  const Shell({super.key, required this.child, required this.state});

  @override
  Widget build(BuildContext context) {
    String title = AppRoutes.getLocalizedTitle(context, state.fullPath);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 16,
            children: [
              const LanguageSwitch(),
              TextButton(
                onPressed: () {
                  context.go(AppRoutes.account.path);
                },
                child: Text(
                  l10n.pageAccount,
                  style: TextStyle(
                    color: Theme.of(context).appBarTheme.foregroundColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
        ],
      ),
      drawer: AppDrawer(),
      body: child,
    );
  }
}
