import 'package:coursework/presentation/bloc/auth/auth_bloc.dart';
import 'package:coursework/presentation/bloc/auth/auth_event.dart';
import 'package:coursework/presentation/bloc/auth/auth_state.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_form_actions.dart';
import 'profile_form_errors.dart';
import 'profile_form_fields.dart';
import 'profile_form_fieldset.dart';
import 'profile_form_metrics.dart';
import 'profile_today_words/index.dart';

class ProfileFormContent extends StatelessWidget {
  final String login;
  final AuthSignedInState signedIn;
  final TextEditingController passwordController;
  final TextEditingController passwordAgainController;
  final bool showPasswordChangedNotice;
  final VoidCallback onCancel;
  final VoidCallback onSubmit;

  const ProfileFormContent({
    super.key,
    required this.login,
    required this.signedIn,
    required this.passwordController,
    required this.passwordAgainController,
    required this.showPasswordChangedNotice,
    required this.onCancel,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            profileFormHorizontalPadding,
            24,
            profileFormHorizontalPadding,
            16,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ProfileFormFieldset(
                  title: l10n.profileTitle,
                  child: Column(
                    children: [
                      ProfileFormFields(
                        login: login,
                        passwordController: passwordController,
                        passwordAgainController: passwordAgainController,
                        isChangingPassword: signedIn.isChangingPassword,
                        isLoading: signedIn.isUpdating,
                        showPasswordChangedNotice: showPasswordChangedNotice,
                        passwordError: resolveProfilePasswordError(
                          l10n,
                          signedIn.error,
                        ),
                        passwordAgainError: resolveProfilePasswordAgainError(
                          l10n,
                          signedIn.error,
                        ),
                        onChangePassword: () => context.read<AuthBloc>().add(
                          const ToggleChangePasswordEvent(),
                        ),
                        onSignOut: () =>
                            context.read<AuthBloc>().add(const SignOutEvent()),
                      ),
                      if (signedIn.isChangingPassword) ...[
                        const SizedBox(height: 8),
                        ProfileFormActions(
                          cancelLabel: l10n.cancel,
                          okLabel: l10n.ok,
                          isLoading: signedIn.isUpdating,
                          onCancel: onCancel,
                          onSubmit: onSubmit,
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                const ProfileTodayWords(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
