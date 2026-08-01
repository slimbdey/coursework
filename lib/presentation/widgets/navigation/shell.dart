import 'package:coursework/presentation/bloc/auth/auth_bloc.dart';
import 'package:coursework/presentation/bloc/auth/auth_state.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/widgets/shared/language_switch.dart';
import 'package:coursework/presentation/widgets/shared/theme_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final foreground = Theme.of(context).appBarTheme.foregroundColor;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 8,
        title: Builder(
          builder: (context) => Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () => Scaffold.of(context).openDrawer(),
              borderRadius: BorderRadius.circular(4),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 4,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.menu),
                    const SizedBox(width: 12),
                    Flexible(
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: foreground,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        actions: [
          const ThemeSwitch(),
          const SizedBox(width: 8),
          const LanguageSwitch(),
          const SizedBox(width: 8),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, authState) {
              final email = authState is AuthSignedInState
                  ? authState.user.email
                  : null;
              final label = email == null || email.isEmpty
                  ? l10n.appBarSignIn
                  : email.split('@').first;

              return TextButton(
                style: TextButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  minimumSize: Size.zero,
                  foregroundColor: foreground,
                ),
                onPressed: () {
                  context.go(AppRoutes.account.path);
                },
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 160),
                  child: Text(
                    label,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: foreground,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
      drawer: AppDrawer(),
      body: child,
    );
  }
}
