import 'dart:async';

import 'package:flutter/foundation.dart';

/// Holds the correctness of the last submitted answer while it is shown,
/// then resets itself so the highlight does not stick to the next question.
class AnswerFeedback extends ValueNotifier<bool?> {
  static const _visibleDuration = Duration(milliseconds: 1200);

  Timer? _timer;

  AnswerFeedback() : super(null);

  void show({required bool isCorrect}) {
    _timer?.cancel();
    value = isCorrect;
    _timer = Timer(_visibleDuration, hide);
  }

  void hide() {
    _timer?.cancel();
    if (value == null) {
      return;
    }

    value = null;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
