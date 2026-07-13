import 'package:flutter/material.dart';

TextTheme lightTextTheme({
  required Color primaryColor,
  required Color onSurfaceColor,
  required Color onSurfaceVariantColor,
  required Color bodySmallColor,
}) {
  return TextTheme(
    headlineMedium: TextStyle(
      color: onSurfaceVariantColor,
      fontWeight: FontWeight.w300,
    ),
    bodyLarge: TextStyle(
      color: onSurfaceColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(color: primaryColor, fontSize: 16),
    bodySmall: TextStyle(color: bodySmallColor, fontSize: 14),
  );
}
