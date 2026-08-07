import 'package:coursework/presentation/bloc/theme/theme_bloc.dart';
import 'package:coursework/presentation/bloc/theme/theme_event.dart';
import 'package:coursework/presentation/bloc/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/bloc_harness.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('InitThemeEvent sets ThemeMode.system', () async {
    final states = await runBloc(ThemeBloc(), act: (_) async {});

    expect(states, [
      isA<ThemeState>().having(
        (s) => s.themeMode,
        'themeMode',
        ThemeMode.system,
      ),
    ]);
  });

  test('ToggleThemeEvent leaves ThemeMode.system for explicit mode', () async {
    final states = await runBloc(
      ThemeBloc(),
      act: (bloc) async {
        await pumpEventQueue();
        bloc.add(ToggleThemeEvent());
      },
    );

    expect(states.skip(1), [
      isA<ThemeState>().having(
        (s) => s.themeMode,
        'themeMode',
        anyOf(ThemeMode.light, ThemeMode.dark),
      ),
    ]);
  });
}
