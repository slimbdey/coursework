import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AuthFormModeToggle extends StatelessWidget {
  final bool isSignIn;
  final bool isLoading;
  final VoidCallback onToggle;

  const AuthFormModeToggle({
    super.key,
    required this.isSignIn,
    required this.isLoading,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        const SizedBox(height: 16),
        TextButton(
          style: TextButton.styleFrom(
            overlayColor: Colors.transparent,
          ),
          onPressed: isLoading ? null : onToggle,
          child: Text(isSignIn ? l10n.signUpLabel : l10n.signInLabel),
        ),
      ],
    );
  }
}
