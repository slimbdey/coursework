import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'drawer.dart';
import 'routes.dart';
import 'shell_app_bar.dart';
import 'shell_body.dart';

class Shell extends StatelessWidget {
  final Widget child;
  final GoRouterState state;

  const Shell({super.key, required this.child, required this.state});

  @override
  Widget build(BuildContext context) {
    final title = AppRoutes.getLocalizedTitle(context, state.fullPath);

    return Scaffold(
      appBar: ShellAppBar(title: title),
      drawer: const AppDrawer(),
      body: ShellBody(child: child),
    );
  }
}
