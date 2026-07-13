import 'package:coursework/presentation/widgets/shared/form_text_input.dart';
import 'package:coursework/presentation/widgets/shared/loader.dart';
import 'package:flutter/material.dart';

class FormActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;

  const FormActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final labelColor =
        textTheme.headlineMedium?.color ??
        colorScheme.onSurface.withValues(alpha: 0.6);

    final activeBackgroundColor = colorScheme.tertiary;
    final idleBackgroundColor = colorScheme.surface;

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: Size(72, FormTextInput.controlHeight),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        foregroundColor: labelColor,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        side: BorderSide(color: colorScheme.outline.withValues(alpha: 0.3)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      ).copyWith(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return idleBackgroundColor;
          }
          if (states.contains(WidgetState.pressed) ||
              states.contains(WidgetState.focused)) {
            return activeBackgroundColor;
          }
          return idleBackgroundColor;
        }),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed) ||
              states.contains(WidgetState.focused)) {
            return colorScheme.onSurface.withValues(alpha: 0.08);
          }
          return null;
        }),
      ),
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? const SizedBox(width: 20, height: 20, child: Loader())
          : Text(label),
    );
  }
}
