import 'dart:async';

import 'package:coursework/presentation/bloc/auth/auth_bloc.dart';
import 'package:coursework/presentation/bloc/auth/auth_event.dart';
import 'package:coursework/presentation/bloc/auth/auth_state.dart';
import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_form_actions.dart';
import 'profile_form_errors.dart';
import 'profile_form_fields.dart';
import 'profile_form_fieldset.dart';
import 'profile_form_metrics.dart';
import 'profile_today_words/index.dart';

class ProfileForm extends StatefulWidget {
  final User user;

  const ProfileForm({super.key, required this.user});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordAgainController;
  Timer? _passwordChangedNoticeTimer;
  bool _showPasswordChangedNotice = false;

  String get _login => widget.user.email ?? '';

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _passwordAgainController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordChangedNoticeTimer?.cancel();
    _passwordController.dispose();
    _passwordAgainController.dispose();
    super.dispose();
  }

  void _clearPasswordFields() {
    _passwordController.clear();
    _passwordAgainController.clear();
  }

  void _showPasswordChanged() {
    _passwordChangedNoticeTimer?.cancel();
    setState(() => _showPasswordChangedNotice = true);
    _passwordChangedNoticeTimer = Timer(const Duration(seconds: 2), () {
      if (!mounted) return;
      setState(() => _showPasswordChangedNotice = false);
    });
  }

  void _onCancel() {
    _clearPasswordFields();
    context.read<AuthBloc>().add(const CancelCredentialsEditEvent());
  }

  void _onSubmit() {
    context.read<AuthBloc>().add(
      AlterCredentialsEvent(
        _login,
        _passwordController.text,
        _passwordAgainController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) {
        final wasUpdating =
            previous is AuthSignedInState && previous.isUpdating;
        final isClean = current is AuthSignedInState &&
            !current.isUpdating &&
            current.error == null &&
            !current.isChangingPassword;
        return wasUpdating && isClean;
      },
      listener: (context, state) {
        _clearPasswordFields();
        _showPasswordChanged();
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        buildWhen: (previous, current) => current is AuthSignedInState,
        builder: (context, state) {
          final signedIn = state is AuthSignedInState
              ? state
              : AuthSignedInState(user: widget.user);

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
                              login: _login,
                              passwordController: _passwordController,
                              passwordAgainController:
                                  _passwordAgainController,
                              isChangingPassword:
                                  signedIn.isChangingPassword,
                              isLoading: signedIn.isUpdating,
                              showPasswordChangedNotice:
                                  _showPasswordChangedNotice,
                              passwordError: resolveProfilePasswordError(
                                l10n,
                                signedIn.error,
                              ),
                              passwordAgainError:
                                  resolveProfilePasswordAgainError(
                                l10n,
                                signedIn.error,
                              ),
                              onChangePassword: () => context
                                  .read<AuthBloc>()
                                  .add(const ToggleChangePasswordEvent()),
                              onSignOut: () => context
                                  .read<AuthBloc>()
                                  .add(const SignOutEvent()),
                            ),
                            if (signedIn.isChangingPassword) ...[
                              const SizedBox(height: 8),
                              ProfileFormActions(
                                cancelLabel: l10n.cancel,
                                okLabel: l10n.ok,
                                isLoading: signedIn.isUpdating,
                                onCancel: _onCancel,
                                onSubmit: _onSubmit,
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                      ProfileTodayWords(login: _login),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
