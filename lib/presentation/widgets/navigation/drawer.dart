import 'package:coursework/presentation/bloc/auth/auth_bloc.dart';
import 'package:coursework/presentation/bloc/auth/auth_state.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/widgets/db_information.dart';
import 'package:coursework/presentation/widgets/navigation/drawer_menu_item.dart';
import 'package:coursework/presentation/widgets/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).matchedLocation;
    final backgroundColor = Theme.of(
      context,
    ).colorScheme.surfaceContainerHighest;
    final l10n = AppLocalizations.of(context)!;
    final hintColor = Theme.of(
      context,
    ).appBarTheme.foregroundColor!.withValues(alpha: 0.5);

    return Drawer(
      shape: const LinearBorder(),
      width: 200,
      backgroundColor: backgroundColor.withValues(alpha: 0.9),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, authState) {
          final isAuthenticated = authState.isAuthenticated;
          final routes = AppRoutes.visibleDrawerRoutes(
            isAuthenticated: isAuthenticated,
          );

          return ListView(
            padding: const EdgeInsets.only(top: 50.0),
            children: [
              if (!isAuthenticated)
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                  child: Text(
                    l10n.drawerSignInHint,
                    style: TextStyle(fontSize: 12, color: hintColor),
                  ),
                ),
              ...routes.map(
                (route) => DrawerMenuItem(
                  icon: route.icon,
                  title: AppRoutes.getLocalizedTitle(context, route.path),
                  isSelected: currentPath == route.path,
                  onTap: () {
                    context.go(route.path);
                    Navigator.pop(context);
                  },
                ),
              ),
              const DbInformation(),
            ],
          );
        },
      ),
    );
  }
}
