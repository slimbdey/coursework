import 'package:flutter/material.dart';

import 'app_bar_theme.dart';
import 'input_theme.dart';
import 'text_theme.dart';

ThemeData buildDarkTheme() {
  const primaryColor = Color(0xFFB0B8C0);
  const onSurfaceColor = Color(0xFFE8EAED);
  const onSurfaceVariantColor = Color(0xFF9AA0A6);
  const tertiaryColor = Color(0xFF2A2F36);
  const primaryContainerColor = Color(0xFF5B93C0);
  const onPrimaryColor = Color(0xFF121417);
  const surfaceColor = Color(0xFF1C1F24);

  const colorScheme = ColorScheme.dark(
    primary: primaryColor,
    primaryContainer: primaryContainerColor,
    onPrimaryContainer: Color(0xFFFFFFFF),
    secondary: Color(0xFFFFB84D),
    surface: surfaceColor,
    error: Color(0xFFE57373),
    onPrimary: onPrimaryColor,
    onSecondary: onPrimaryColor,
    onSurface: onSurfaceColor,
    onSurfaceVariant: onSurfaceVariantColor,
    tertiary: tertiaryColor,
    tertiaryContainer: primaryContainerColor,
    onTertiaryContainer: Color(0xFFFFFFFF),
    surfaceContainerHighest: Color(0xFF2C3138),
    inverseSurface: primaryColor,
    onInverseSurface: onPrimaryColor,
    outline: Color(0xFF6B7280),
    outlineVariant: tertiaryColor,
  );

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121417),
    colorScheme: colorScheme,
    appBarTheme: appBarTheme(
      backgroundColor: Color.alphaBlend(
        primaryContainerColor.withValues(alpha: 0.18),
        surfaceColor,
      ),
      foregroundColor: primaryColor,
      brightness: Brightness.dark,
    ),
    cardTheme: CardThemeData(
      color: colorScheme.surface,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: colorScheme.outlineVariant,
          width: 1,
        ),
      ),
    ),
    inputDecorationTheme: appInputDecorationTheme(colorScheme),
    buttonTheme: ButtonThemeData(
      buttonColor: colorScheme.surfaceContainerHighest,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
    ),
    textTheme: appTextTheme(
      primaryColor: primaryColor,
      onSurfaceColor: onSurfaceColor,
      onSurfaceVariantColor: onSurfaceVariantColor,
      bodySmallColor: const Color(0xFF9AA0A6),
    ),
  );
}
