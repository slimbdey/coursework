import 'package:coursework/presentation/widgets/navigation/drawer_menu_item.dart';
import 'package:coursework/presentation/widgets/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFFF0F2F5),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 50),

            DrawerMenuItem(
              icon: Icons.home,
              title: AppRoutes.getLocalizedTitle(context, AppRoutes.home.path),
              onTap: () {
                context.go('/');
                Navigator.pop(context);
              },
            ),
            DrawerMenuItem(
              icon: Icons.directions_run,
              title: AppRoutes.getLocalizedTitle(
                context,
                AppRoutes.training.path,
              ),
              onTap: () {
                context.go('/training');
                Navigator.pop(context);
              },
            ),
            DrawerMenuItem(
              icon: Icons.star_border,
              title: AppRoutes.getLocalizedTitle(
                context,
                AppRoutes.general.path,
              ),
              onTap: () {
                context.go('/general');
                Navigator.pop(context);
              },
            ),
            DrawerMenuItem(
              icon: Icons.g_translate,
              title: AppRoutes.getLocalizedTitle(
                context,
                AppRoutes.gerunds.path,
              ),
              onTap: () {
                context.go('/gerunds');
                Navigator.pop(context);
              },
            ),
            DrawerMenuItem(
              icon: Icons.style,
              title: AppRoutes.getLocalizedTitle(
                context,
                AppRoutes.phrases.path,
              ),
              onTap: () {
                context.go('/phrases');
                Navigator.pop(context);
              },
            ),
            DrawerMenuItem(
              icon: Icons.waves,
              title: AppRoutes.getLocalizedTitle(
                context,
                AppRoutes.idioms.path,
              ),
              onTap: () {
                context.go('/idioms');
                Navigator.pop(context);
              },
            ),
            DrawerMenuItem(
              icon: Icons.chat_bubble_outline,
              title: AppRoutes.getLocalizedTitle(context, AppRoutes.verbs.path),
              onTap: () {
                context.go('/verbs');
                Navigator.pop(context);
              },
            ),

            const Divider(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'СОСТАВ БД:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('Words 3625'),
                  Text('Phrases 462'),
                  Text('Gerunds 299'),
                  Text('Phrasals 876'),
                  Text('Idioms 83'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
