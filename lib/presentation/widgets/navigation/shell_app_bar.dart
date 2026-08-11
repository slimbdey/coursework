import 'package:coursework/presentation/bloc/auth/auth_bloc.dart';
import 'package:coursework/presentation/bloc/auth/auth_state.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/widgets/shared/language_switch.dart';
import 'package:coursework/presentation/widgets/shared/theme_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';

class ShellAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const ShellAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final foreground = Theme.of(context).appBarTheme.foregroundColor;

    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 8,
      title: Builder(
        builder: (context) => Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () => Scaffold.of(context).openDrawer(),
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
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
        const LanguageSwitch(),
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                minimumSize: const Size(48, 48),
                tapTargetSize: MaterialTapTargetSize.padded,
                foregroundColor: foreground,
              ),
              onPressed: () => context.go(AppRoutes.account.path),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 160),
                child: Text(
                  label.toUpperCase(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
