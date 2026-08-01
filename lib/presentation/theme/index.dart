import 'package:flutter/material.dart';

import 'input_theme.dart';
import 'text_theme.dart';
import 'app_bar_theme.dart';

class AppTheme {
  static const success = Color(0xFF5CB85C);

  static ThemeData light() {
    const primaryColor = Color(0xFF5A626A);
    const onSurfaceColor = Color(0xFF333333);
    const onSurfaceVariantColor = Color(0xFF999999);
    const tertiaryColor = Color(0xFFE5E9F0);
    const primaryContainerColor = Color(0xFF5B93C0);
    const onPrimaryColor = Color(0xFFFFFFFF);

    const colorScheme = ColorScheme.light(
      primary: primaryColor,
      primaryContainer: primaryContainerColor,
      onPrimaryContainer: onPrimaryColor,
      secondary: Color(0xFFFFA500),
      surface: Color(0xFFFFFFFF),
      error: Color(0xFFD9534F),
      onPrimary: onPrimaryColor,
      onSecondary: onPrimaryColor,
      onSurface: onSurfaceColor,
      onSurfaceVariant: onSurfaceVariantColor,
      tertiary: tertiaryColor,
      tertiaryContainer: primaryContainerColor,
      onTertiaryContainer: onPrimaryColor,
      surfaceContainerHighest: Color.fromARGB(255, 236, 236, 236),
      inverseSurface: primaryColor,
      onInverseSurface: onPrimaryColor,
      outline: primaryColor,
      outlineVariant: tertiaryColor,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Color.fromRGBO(247, 249, 250, 1),
      colorScheme: colorScheme,
      appBarTheme: lightAppBarTheme(
        backgroundColor: Color.alphaBlend(
          primaryContainerColor.withValues(alpha: 0.22),
          const Color(0xFFFFFFFF),
        ),
        foregroundColor: primaryColor,
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
      inputDecorationTheme: lightInputDecorationTheme(colorScheme),
      buttonTheme: ButtonThemeData(
        buttonColor: colorScheme.surfaceContainerHighest,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      ),
      textTheme: lightTextTheme(
        primaryColor: primaryColor,
        onSurfaceColor: onSurfaceColor,
        onSurfaceVariantColor: onSurfaceVariantColor,
        bodySmallColor: Color(0xFF778899),
      ),
    );
  }
}
