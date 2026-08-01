import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import 'profile_form_row.dart';
import 'profile_text_action_button.dart';
import 'profile_text_field.dart';

class ProfileFormFields extends StatelessWidget {
  final String login;
  final TextEditingController passwordController;
  final TextEditingController passwordAgainController;
  final bool isChangingPassword;
  final bool isLoading;
  final bool showPasswordChangedNotice;
  final String? passwordError;
  final String? passwordAgainError;
  final VoidCallback onChangePassword;
  final VoidCallback onSignOut;

  const ProfileFormFields({
    super.key,
    required this.login,
    required this.passwordController,
    required this.passwordAgainController,
    required this.isChangingPassword,
    required this.isLoading,
    required this.showPasswordChangedNotice,
    required this.onChangePassword,
    required this.onSignOut,
    this.passwordError,
    this.passwordAgainError,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ProfileFormRow(
          label: l10n.profileLogin,
          trailing: Align(
            alignment: Alignment.centerRight,
            child: Text(
              login,
              style: TextStyle(
                fontSize: 14,
                color: colorScheme.onSurface.withValues(alpha: 0.85),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        if (isChangingPassword) ...[
          ProfileFormRow(
            label: l10n.password,
            trailing: ProfileTextField(
              controller: passwordController,
              enabled: !isLoading,
              obscureText: true,
              errorText: passwordError,
            ),
          ),
          const SizedBox(height: 8),
          ProfileFormRow(
            label: l10n.confirmation,
            trailing: ProfileTextField(
              controller: passwordAgainController,
              enabled: !isLoading,
              obscureText: true,
              errorText: passwordAgainError,
            ),
          ),
        ] else ...[
          ProfileFormRow(
            label: l10n.password,
            trailing: Align(
              alignment: Alignment.centerRight,
              child: ProfileTextActionButton(
                label: l10n.change,
                color: colorScheme.error,
                alignEnd: true,
                onPressed: isLoading ? null : onChangePassword,
              ),
            ),
          ),
          if (passwordError != null) ...[
            const SizedBox(height: 4),
            Text(
              passwordError!,
              style: TextStyle(color: colorScheme.error, fontSize: 12),
            ),
          ],
          if (showPasswordChangedNotice) ...[
            const SizedBox(height: 8),
            Text(
              l10n.passwordChanged,
              style: const TextStyle(color: Colors.green, fontSize: 12),
            ),
          ],
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: ProfileTextActionButton(
              label: l10n.signOut,
              color: colorScheme.error,
              onPressed: isLoading ? null : onSignOut,
            ),
          ),
        ],
      ],
    );
  }
}
