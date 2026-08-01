import 'package:coursework/presentation/widgets/shared/loader.dart';
import 'package:flutter/material.dart';

import 'auth_form_metrics.dart';

class AuthFormSubmitButton extends StatelessWidget {
  final bool isOutlined;
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;

  const AuthFormSubmitButton({
    super.key,
    required this.isOutlined,
    required this.label,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return FilledButton(
      style: FilledButton.styleFrom(
        minimumSize: const Size(double.infinity, authFormSubmitButtonHeight),
        backgroundColor: isOutlined
            ? colorScheme.tertiary.withValues(alpha: 0.8)
            : colorScheme.primary,
        foregroundColor: isOutlined
            ? colorScheme.primary
            : colorScheme.onPrimary,
      ).copyWith(
        overlayColor: WidgetStateProperty.resolveWith((states) {
          final tintColor = isOutlined
              ? colorScheme.primary
              : colorScheme.onPrimary;

          if (states.contains(WidgetState.pressed)) {
            return tintColor.withValues(alpha: 0.1);
          }
          if (states.contains(WidgetState.hovered)) {
            return tintColor.withValues(alpha: 0.1);
          }
          if (states.contains(WidgetState.focused)) {
            return tintColor.withValues(alpha: 0.1);
          }
          return null;
        }),
      ),
      onPressed: isLoading ? null : onPressed,
      child: isLoading ? const Loader() : Text(label),
    );
  }
}
