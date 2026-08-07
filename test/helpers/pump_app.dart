import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:coursework/presentation/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget wrapApp(
  Widget child, {
  Locale locale = const Locale('en'),
  List<NavigatorObserver>? navigatorObservers,
}) {
  return MaterialApp(
    locale: locale,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    theme: AppTheme.light(),
    navigatorObservers: navigatorObservers ?? const [],
    home: Scaffold(body: child),
  );
}

Future<void> pumpApp(
  WidgetTester tester,
  Widget child, {
  Locale locale = const Locale('en'),
  Size surfaceSize = const Size(800, 1200),
}) async {
  await tester.binding.setSurfaceSize(surfaceSize);
  addTearDown(() => tester.binding.setSurfaceSize(null));
  await tester.pumpWidget(wrapApp(child, locale: locale));
  await tester.pump();
}
