import 'package:coursework/core/android_night_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(ThemeMode.system)) {
    on<InitThemeEvent>(_onInit);
    on<ToggleThemeEvent>(_onToggle);
    add(InitThemeEvent());
  }

  Future<void> _onInit(InitThemeEvent event, Emitter<ThemeState> emit) async {
    // Clear any stuck per-app night-mode override from previous sessions,
    // so ThemeMode.system and the keyboard can follow the device again.
    await AndroidNightMode.followSystem();
    const next = ThemeState(ThemeMode.system);
    emit(next);
    _syncOverlay(isDark: next.isDark);
  }

  Future<void> _onToggle(
    ToggleThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final next = state.isDark ? ThemeMode.light : ThemeMode.dark;
    emit(ThemeState(next));
    _syncOverlay(isDark: next == ThemeMode.dark);
  }

  static void _syncOverlay({required bool isDark}) {
    SystemChrome.setSystemUIOverlayStyle(
      isDark
          ? const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark,
              systemNavigationBarColor: Color(0xFF121417),
              systemNavigationBarIconBrightness: Brightness.light,
              systemNavigationBarContrastEnforced: false,
            )
          : const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
              systemNavigationBarColor: Color(0xFFF7F9FA),
              systemNavigationBarIconBrightness: Brightness.dark,
              systemNavigationBarContrastEnforced: false,
            ),
    );
  }
}
