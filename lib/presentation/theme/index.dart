import 'package:flutter/material.dart';

import 'input_theme.dart';
import 'text_theme.dart';
import 'app_bar_theme.dart';

class AppTheme {
  static ThemeData light() {
    const primaryColor = Color(0xFF5584AC);
    const onSurfaceColor = Color(0xFF333333);
    const backgroundColor = Color.fromARGB(255, 240, 240, 240);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color.fromRGBO(247, 249, 250, 1),

      colorScheme: const ColorScheme.light(
        primary: primaryColor, // Main blue bar
        secondary: Color(0xFFFFA500), // Active orange outline
        surface: Color(0xFFFFFFFF), // Card background
        error: Color(0xFFD9534F), // Incorrect answer red
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: onSurfaceColor, // Main text color
      ),

      appBarTheme: lightAppBarTheme(backgroundColor),

      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(
            color: Color(0xFFE5E9F0),
            width: 1,
          ), // Thin grey border
        ),
      ),

      inputDecorationTheme: lightInputDecorationTheme,

      buttonTheme: ButtonThemeData(
        buttonColor: const Color(0xFFE0E0E0), // Grey 'OK' button background
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      ),

      textTheme: lightTextTheme(primaryColor, onSurfaceColor),
    );
  }
}
