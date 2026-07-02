import 'package:flutter/material.dart';

class FormSubmitButton extends StatelessWidget {
  final bool isOutlined;
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;

  const FormSubmitButton({
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
        minimumSize: const Size(232, 48),
        backgroundColor: isOutlined
            ? colorScheme.tertiary.withValues(alpha: 0.8)
            : colorScheme.primary,
        foregroundColor: isOutlined
            ? colorScheme.primary
            : colorScheme.onPrimaryFixed,
      ).copyWith(
        overlayColor: WidgetStateProperty.resolveWith((states) {
          final tintColor = isOutlined
              ? colorScheme.primary
              : colorScheme.onPrimaryFixed;

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
      child: Text(label),
    );
  }
}
