import 'dart:async';

import 'package:mocktail/mocktail.dart';

import 'helpers/mocks.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  registerFallbackValue(FakeAuthEvent());
  registerFallbackValue(FakeProfileTodayWordsEvent());
  registerFallbackValue(FakeSearchEvent());
  await testMain();
}
