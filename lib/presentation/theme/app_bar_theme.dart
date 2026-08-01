import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBarTheme appBarTheme({
  required Color backgroundColor,
  required Color foregroundColor,
  required Brightness brightness,
}) {
  final isDark = brightness == Brightness.dark;

  return AppBarTheme(
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    surfaceTintColor: backgroundColor,
    scrolledUnderElevation: 0,
    iconTheme: IconThemeData(color: foregroundColor),
    actionsIconTheme: IconThemeData(color: foregroundColor),
    shadowColor: foregroundColor,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
    ),
  );
}
