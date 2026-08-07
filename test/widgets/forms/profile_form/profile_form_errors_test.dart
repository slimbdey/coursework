import 'package:coursework/application/infrastructure/auth.dart';
import 'package:coursework/presentation/l10n/app_localizations_en.dart';
import 'package:coursework/presentation/widgets/forms/profile_form/profile_form_errors.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final l10n = AppLocalizationsEn();

  group('resolveProfilePasswordError', () {
    test('maps known password errors', () {
      expect(
        resolveProfilePasswordError(l10n, AuthValidationError.passwordRequired),
        l10n.passwordRequired,
      );
      expect(
        resolveProfilePasswordError(l10n, AuthValidationError.passwordTooShort),
        l10n.passwordTooShort,
      );
      expect(
        resolveProfilePasswordError(l10n, AuthValidationError.noInternet),
        l10n.noInternet,
      );
      expect(
        resolveProfilePasswordError(
          l10n,
          AuthValidationError.alterCredentialsFailed,
        ),
        l10n.alterCredentialsFailed,
      );
    });

    test('returns null for unrelated errors', () {
      expect(
        resolveProfilePasswordError(l10n, AuthValidationError.loginRequired),
        isNull,
      );
      expect(resolveProfilePasswordError(l10n, null), isNull);
    });
  });

  group('resolveProfilePasswordAgainError', () {
    test('maps confirmation errors', () {
      expect(
        resolveProfilePasswordAgainError(
          l10n,
          AuthValidationError.passwordAgainRequired,
        ),
        l10n.passwordAgainRequired,
      );
      expect(
        resolveProfilePasswordAgainError(
          l10n,
          AuthValidationError.passwordsDoNotMatch,
        ),
        l10n.passwordsDoNotMatch,
      );
      expect(
        resolveProfilePasswordAgainError(
          l10n,
          AuthValidationError.passwordRequired,
        ),
        isNull,
      );
    });
  });
}
