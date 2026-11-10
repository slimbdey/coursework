import 'dart:async';

import 'package:mocktail/mocktail.dart';

import 'helpers/mocks.dart';

///
/// Это глобальная обёртка для всех тестов в папке test/.
/// Flutter сам её находит и запускает перед каждым файлом тестов
/// Здесь она делает одну вещь — регистрирует fallback-значения mocktail
/// три фейка из helpers/mocks.dart регистрируются один раз на весь набор тестов,
/// а не в каждом setUp. После этого await testMain() запускает конкретный тестовый файл
///
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  registerFallbackValue(FakeAuthEvent());
  registerFallbackValue(FakeProfileTodayWordsEvent());
  registerFallbackValue(FakeSearchEvent());
  await testMain();
}
