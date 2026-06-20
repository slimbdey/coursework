import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color.fromRGBO(247, 249, 250, 1),

      colorScheme: const ColorScheme.light(
        primary: Color(0xFF5584AC), // Main blue bar
        secondary: Color(0xFFFFA500), // Active orange outline
        surface: Color(0xFFFFFFFF), // Card background
        error: Color(0xFFD9534F), // Incorrect answer red
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Color(0xFF333333), // Main text color
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFE9EFF4),
        foregroundColor: Color(0xFF5A626A),
        elevation: 0.5,
        surfaceTintColor: Color(0xFFE9EFF4),
        scrolledUnderElevation: 20, // prevents color shift while scroll
        iconTheme: IconThemeData(color: Color(0xFF5A626A)),
        actionsIconTheme: IconThemeData(color: Color(0xFF5A626A)),
        shadowColor: Color(0xFF5A626A),
      ),

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

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(color: Color(0xFFCCCCCC), width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(
            color: Color(0xFFFFA500),
            width: 2.0,
          ), // Active amber border
        ),
      ),

      buttonTheme: ButtonThemeData(
        buttonColor: const Color(0xFFE0E0E0), // Grey 'OK' button background
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      ),

      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          color: Color(0xFF999999),
          fontWeight: FontWeight.w300,
        ), // "ЗАУЧИВАНИЕ СЛОВ"
        bodyLarge: TextStyle(
          color: Color(0xFF333333),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ), // "горячий, пылкий..."
        bodyMedium: TextStyle(color: Color(0xFF5584AC)), // Blue hint text
        bodySmall: TextStyle(color: Color(0xFF778899)), // Top stats text
      ),
    );
  }
}
