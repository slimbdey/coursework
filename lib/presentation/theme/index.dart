import 'package:flutter/material.dart';

import 'dark_theme.dart';
import 'light_theme.dart';

class AppTheme {
  static const success = Color(0xFF5CB85C);

  static ThemeData light() => buildLightTheme();

  static ThemeData dark() => buildDarkTheme();
}
