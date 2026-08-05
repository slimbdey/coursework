import 'package:coursework/presentation/bloc/auth/auth_bloc.dart';
import 'package:coursework/presentation/bloc/auth/auth_guard.dart';
import 'package:coursework/presentation/widgets/pages/account.dart';
import 'package:coursework/presentation/widgets/pages/common.dart';
import 'package:coursework/presentation/widgets/pages/gerunds.dart';
import 'package:coursework/presentation/widgets/pages/home.dart';
import 'package:coursework/presentation/widgets/pages/idioms.dart';
import 'package:coursework/presentation/widgets/pages/phrases.dart';
import 'package:coursework/presentation/widgets/pages/training.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'shell.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      return AuthGuard.redirectPath(
        state: context.read<AuthBloc>().state,
        matchedLocation: state.matchedLocation,
      );
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return Shell(state: state, child: child);
        },
        routes: [
          GoRoute(path: '/', builder: (context, state) => const HomePage()),
          GoRoute(path: '/account', builder: (context, state) => AccountPage()),
          GoRoute(
            path: '/training',
            builder: (context, state) => TrainingPage(),
          ),
          GoRoute(path: '/general', builder: (context, state) => CommonPage()),
          GoRoute(path: '/gerunds', builder: (context, state) => GerundsPage()),
          GoRoute(path: '/phrases', builder: (context, state) => PhrasesPage()),
          GoRoute(path: '/idioms', builder: (context, state) => IdiomsPage()),
        ],
      ),
    ],
  );
}
