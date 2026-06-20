import 'package:coursework/presentation/widgets/pages/account.dart';
import 'package:coursework/presentation/widgets/pages/common.dart';
import 'package:coursework/presentation/widgets/pages/gerunds.dart';
import 'package:coursework/presentation/widgets/pages/idioms.dart';
import 'package:coursework/presentation/widgets/pages/phrases.dart';
import 'package:coursework/presentation/widgets/pages/training.dart';
import 'package:coursework/presentation/widgets/pages/verbs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'shell.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return Shell(state: state, child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) =>
                const Center(child: Text('Main Screen')),
          ),
          GoRoute(path: '/account', builder: (context, state) => AccountPage()),
          GoRoute(
            path: '/training',
            builder: (context, state) => TrainingPage(),
          ),
          GoRoute(path: '/general', builder: (context, state) => CommonPage()),
          GoRoute(path: '/gerunds', builder: (context, state) => GerundsPage()),
          GoRoute(path: '/phrases', builder: (context, state) => PhrasesPage()),
          GoRoute(path: '/idioms', builder: (context, state) => IdiomsPage()),
          GoRoute(path: '/verbs', builder: (context, state) => VerbsPage()),
        ],
      ),
    ],
  );
}
