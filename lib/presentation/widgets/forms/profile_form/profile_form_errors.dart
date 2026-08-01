import 'package:coursework/application/infrastructure/auth.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';

String? resolveProfilePasswordError(
  AppLocalizations l10n,
  AuthValidationError? error,
) {
  return switch (error) {
    AuthValidationError.passwordRequired => l10n.passwordRequired,
    AuthValidationError.passwordTooShort => l10n.passwordTooShort,
    AuthValidationError.noInternet => l10n.noInternet,
    AuthValidationError.alterCredentialsFailed => l10n.alterCredentialsFailed,
    _ => null,
  };
}

String? resolveProfilePasswordAgainError(
  AppLocalizations l10n,
  AuthValidationError? error,
) {
  return switch (error) {
    AuthValidationError.passwordAgainRequired => l10n.passwordAgainRequired,
    AuthValidationError.passwordsDoNotMatch => l10n.passwordsDoNotMatch,
    _ => null,
  };
}
