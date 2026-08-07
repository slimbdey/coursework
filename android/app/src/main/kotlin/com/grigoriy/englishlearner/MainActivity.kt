package com.grigoriy.englishlearner

import android.app.UiModeManager
import android.os.Build
import androidx.appcompat.app.AppCompatDelegate
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val nightModeChannel = "com.grigoriy.englishlearner/night_mode"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            nightModeChannel,
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "followSystem" -> {
                    followSystemNightMode()
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun followSystemNightMode() {
        AppCompatDelegate.setDefaultNightMode(
            AppCompatDelegate.MODE_NIGHT_FOLLOW_SYSTEM,
        )

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            val uiModeManager = getSystemService(UiModeManager::class.java)
            // MODE_NIGHT_AUTO clears a previous YES/NO app override.
            uiModeManager.setApplicationNightMode(UiModeManager.MODE_NIGHT_AUTO)
        }
    }
}
