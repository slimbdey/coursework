import 'package:coursework/presentation/theme/index.dart';
import 'package:coursework/presentation/widgets/shared/loader.dart';
import 'package:flutter/material.dart';

import 'profile_text_action_button.dart';

class ProfileFormActions extends StatelessWidget {
  final String cancelLabel;
  final String okLabel;
  final bool isLoading;
  final VoidCallback onCancel;
  final VoidCallback onSubmit;

  const ProfileFormActions({
    super.key,
    required this.cancelLabel,
    required this.okLabel,
    required this.isLoading,
    required this.onCancel,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ProfileTextActionButton(
          label: cancelLabel,
          color: colorScheme.error,
          onPressed: isLoading ? null : onCancel,
        ),
        const SizedBox(width: 24),
        ProfileTextActionButton(
          label: okLabel,
          color: AppTheme.success,
          onPressed: isLoading ? null : onSubmit,
          child: isLoading
              ? const SizedBox(width: 16, height: 16, child: Loader())
              : null,
        ),
      ],
    );
  }
}
