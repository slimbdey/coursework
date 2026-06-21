import 'package:flutter/material.dart';

TextTheme lightTextTheme(Color primaryColor, Color onSurfaceColor) {
  return TextTheme(
    headlineMedium: TextStyle(
      color: Color(0xFF999999),
      fontWeight: FontWeight.w300,
    ), // "ЗАУЧИВАНИЕ СЛОВ"
    bodyLarge: TextStyle(
      color: onSurfaceColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ), // "горячий, пылкий..."
    bodyMedium: TextStyle(color: primaryColor), // Blue hint text
    bodySmall: TextStyle(color: Color(0xFF778899)), // Top stats text
  );
}
