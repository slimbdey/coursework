import 'package:flutter/material.dart';

AppBarTheme lightAppBarTheme(Color backgroundColor) {
  const foregroundColor = Color(0xFF5A626A);

  return AppBarTheme(
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    surfaceTintColor: backgroundColor,
    scrolledUnderElevation: 0,
    iconTheme: IconThemeData(color: foregroundColor),
    actionsIconTheme: IconThemeData(color: foregroundColor),
    shadowColor: foregroundColor,
  );
}