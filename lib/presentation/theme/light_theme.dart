import 'package:flutter/material.dart';

import 'app_bar_theme.dart';
import 'input_theme.dart';
import 'text_theme.dart';

ThemeData buildLightTheme() {
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
    scaffoldBackgroundColor: const Color.fromRGBO(247, 249, 250, 1),
    colorScheme: colorScheme,
    appBarTheme: appBarTheme(
      backgroundColor: Color.alphaBlend(
        primaryContainerColor.withValues(alpha: 0.22),
        const Color(0xFFFFFFFF),
      ),
      foregroundColor: primaryColor,
      brightness: Brightness.light,
    ),
    cardTheme: CardThemeData(
      color: colorScheme.surface,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: colorScheme.outlineVariant, width: 1),
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
      bodySmallColor: const Color(0xFF778899),
    ),
  );
}
