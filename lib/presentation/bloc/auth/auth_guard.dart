import 'auth_state.dart';

/// Auth access rules for protected app areas.
class AuthGuard {
  static const protectedPaths = [
    '/training',
    '/general',
    '/gerunds',
    '/phrases',
    '/idioms',
  ];

  static const unauthenticatedRedirectPath = '/account';
  static const postLoginRedirectPath = '/';

  static bool isProtectedPath(String path) =>
      protectedPaths.any((protected) => protected == path);

  static bool allows(AuthState state, String path) =>
      state.isAuthenticated || !isProtectedPath(path);

  static String? redirectPath({
    required AuthState state,
    required String matchedLocation,
  }) {
    if (!allows(state, matchedLocation)) {
      return unauthenticatedRedirectPath;
    }
    return null;
  }
}
