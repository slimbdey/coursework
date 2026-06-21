import 'package:flutter/material.dart';

AppBarTheme lightAppBarTheme(Color backgroundColor) {
  const foregroundColor = Color(0xFF5A626A);

  return AppBarTheme(
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    elevation: 0.5,
    surfaceTintColor: backgroundColor,
    scrolledUnderElevation: 20, // prevents color shift while scroll
    iconTheme: IconThemeData(color: foregroundColor),
    actionsIconTheme: IconThemeData(color: foregroundColor),
    shadowColor: foregroundColor,
  );
}