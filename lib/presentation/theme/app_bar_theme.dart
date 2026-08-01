import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBarTheme lightAppBarTheme({
  required Color backgroundColor,
  required Color foregroundColor,
}) {
  return AppBarTheme(
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    surfaceTintColor: backgroundColor,
    scrolledUnderElevation: 0,
    iconTheme: IconThemeData(color: foregroundColor),
    actionsIconTheme: IconThemeData(color: foregroundColor),
    shadowColor: foregroundColor,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
}
