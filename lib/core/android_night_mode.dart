import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class AndroidNightMode {
  static const _channel = MethodChannel(
    'com.grigoriy.englishlearner/night_mode',
  );

  /// Clears per-app night-mode override so the app follows the device theme.
  static Future<void> followSystem() async {
    if (kIsWeb || !Platform.isAndroid) {
      return;
    }

    try {
      await _channel.invokeMethod<void>('followSystem');
    } on PlatformException {
      // Native side unavailable (e.g. tests) — ignore.
    } on MissingPluginException {
      // Hot reload without native restart — ignore.
    }
  }
}
