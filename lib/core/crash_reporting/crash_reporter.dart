import 'dart:ui' show PlatformDispatcher;

import 'package:firebase_crashlytics/firebase_crashlytics.dart'
    show FirebaseCrashlytics;
import 'package:flutter/foundation.dart' show FlutterError, kDebugMode, kIsWeb;

/// Crashlytics ships no web implementation, so every call is a no-op on web.
class CrashReporter {
  const CrashReporter._();

  static bool get _isSupported => !kIsWeb;

  /// Routes framework and platform errors to Crashlytics.
  static Future<void> attach() async {
    if (!_isSupported) {
      return;
    }

    final crashlytics = FirebaseCrashlytics.instance;
    await crashlytics.setCrashlyticsCollectionEnabled(!kDebugMode);

    FlutterError.onError = crashlytics.recordFlutterFatalError;
    PlatformDispatcher.instance.onError = (error, stack) {
      crashlytics.recordError(error, stack, fatal: true);

      return true;
    };
  }

  /// Reports an error that escaped into the guarded root zone.
  static Future<void> recordZoneError(Object error, StackTrace stack) async {
    if (!_isSupported) {
      return;
    }

    await FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  }
}
