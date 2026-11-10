import 'dart:async';

import 'package:coursework/application/infrastructure/login_service.dart';
import 'package:coursework/application/infrastructure/word_repository.dart';
import 'package:coursework/presentation/bloc/auth/auth_bloc.dart';
import 'package:coursework/presentation/bloc/auth/auth_event.dart';
import 'package:coursework/presentation/bloc/auth/auth_state.dart';
import 'package:coursework/presentation/bloc/profile_today_words/profile_today_words_bloc.dart';
import 'package:coursework/presentation/bloc/profile_today_words/profile_today_words_event.dart';
import 'package:coursework/domain/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_form_content.dart';

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
    return BlocProvider(
      create: (context) => ProfileTodayWordsBloc(
        wordRepository: context.read<WordRepository>(),
        loginService: context.read<LoginService>(),
      )..add(const FetchProfileTodayWordsEvent()),
      child: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) {
          final wasClean =
              previous is! AuthSignedInState || !previous.credentialsUpdated;
          return current is AuthSignedInState &&
              current.credentialsUpdated &&
              wasClean;
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

            return ProfileFormContent(
              login: _login,
              signedIn: signedIn,
              passwordController: _passwordController,
              passwordAgainController: _passwordAgainController,
              showPasswordChangedNotice: _showPasswordChangedNotice,
              onCancel: _onCancel,
              onSubmit: _onSubmit,
            );
          },
        ),
      ),
    );
  }
}
