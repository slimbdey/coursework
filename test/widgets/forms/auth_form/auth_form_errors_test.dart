import 'package:coursework/presentation/widgets/forms/auth_form/auth_form_errors.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('resolvePasswordError', () {
    test('returns first non-null error by priority', () {
      expect(
        resolvePasswordError(
          passwordError: 'password',
          passwordTooShortError: 'short',
          loginFailedError: 'login',
        ),
        'password',
      );
      expect(
        resolvePasswordError(
          passwordTooShortError: 'short',
          loginFailedError: 'login',
        ),
        'short',
      );
      expect(resolvePasswordError(noInternetError: 'offline'), 'offline');
    });

    test('returns null when all errors are null', () {
      expect(resolvePasswordError(), isNull);
    });
  });

  group('resolvePasswordAgainError', () {
    test('prefers passwordAgainError over mismatch', () {
      expect(
        resolvePasswordAgainError(
          passwordAgainError: 'again',
          passwordsDoNotMatchError: 'mismatch',
        ),
        'again',
      );
      expect(
        resolvePasswordAgainError(passwordsDoNotMatchError: 'mismatch'),
        'mismatch',
      );
    });
  });
}
