import 'package:coursework/presentation/widgets/db_information.dart';
import 'package:coursework/presentation/widgets/navigation/drawer_menu_item.dart';
import 'package:coursework/presentation/widgets/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).matchedLocation;
    final backgroundColor = Theme.of(context).appBarTheme.backgroundColor;

    return Drawer(
      shape: const LinearBorder(),
      width: 200,
      backgroundColor: backgroundColor!.withValues(alpha: 0.9),
      child: ListView(
        padding: const EdgeInsets.only(top: 50.0),
        children: [
          ...AppRoutes.drawerRoutes.map(
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
      ),
    );
  }
}
