String? resolvePasswordError({
  String? passwordError,
  String? passwordTooShortError,
  String? registerFailedError,
  String? loginFailedError,
  String? emailAlreadyInUseError,
  String? noInternetError,
}) {
  return passwordError ??
      passwordTooShortError ??
      registerFailedError ??
      loginFailedError ??
      emailAlreadyInUseError ??
      noInternetError;
}

String? resolvePasswordAgainError({
  String? passwordAgainError,
  String? passwordsDoNotMatchError,
}) {
  return passwordAgainError ?? passwordsDoNotMatchError;
}
