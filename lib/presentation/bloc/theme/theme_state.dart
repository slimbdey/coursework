import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeState {
  final ThemeMode themeMode;

  const ThemeState(this.themeMode);

  bool get isDark {
    return switch (themeMode) {
      ThemeMode.dark => true,
      ThemeMode.light => false,
      ThemeMode.system =>
        SchedulerBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark,
    };
  }
}
