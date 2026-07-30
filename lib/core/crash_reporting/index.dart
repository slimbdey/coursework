import 'dart:async' show runZonedGuarded;

import 'package:coursework/core/crash_reporting/crash_reporter.dart'
    show CrashReporter;

export 'package:coursework/core/crash_reporting/crash_reporter.dart'
    show CrashReporter;

/// Runs [body] inside a guarded root zone so that uncaught asynchronous errors
/// are reported to Crashlytics instead of being silently swallowed.
void runGuarded(Future<void> Function() body) {
  runZonedGuarded<Future<void>>(body, CrashReporter.recordZoneError);
}
