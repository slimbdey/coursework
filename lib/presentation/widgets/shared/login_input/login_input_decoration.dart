import 'package:flutter/material.dart';

class LoginInputDecoration {
  LoginInputDecoration._();

  static InputDecoration build({
    required BuildContext context,
    required String label,
    required bool hasError,
    required bool isPassword,
    required bool isLoading,
    required bool obscureText,
    required VoidCallback? onToggleObscure,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final hintColor =
        textTheme.headlineMedium?.color ??
        colorScheme.onSurface.withValues(alpha: 0.38);
    final borderRadius = BorderRadius.circular(10.0);

    OutlineInputBorder border({double width = 1}) => OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(
        color: hasError ? colorScheme.error : colorScheme.primary,
        width: width,
      ),
    );

    return InputDecoration(
      hintText: label,
      hintStyle: TextStyle(
        color: hintColor,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      prefixIcon: Icon(
        isPassword ? Icons.lock : Icons.person,
        color: colorScheme.primary,
      ),
      prefixIconConstraints: const BoxConstraints(minWidth: 48, minHeight: 48),
      suffixIcon: isPassword
          ? IconButton(
              onPressed: onToggleObscure,
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: colorScheme.primary,
              ),
            )
          : null,
      filled: true,
      fillColor: isLoading
          ? colorScheme.onSurface.withValues(alpha: 0.12)
          : colorScheme.surface,
      contentPadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
      border: border(),
      enabledBorder: border(),
      focusedBorder: border(width: hasError ? 1.5 : 1),
    );
  }

  static Widget errorSlot({
    required BuildContext context,
    required String? errorText,
  }) {
    if (errorText == null) {
      return const SizedBox(height: 20);
    }

    return SizedBox(
      height: 20,
      child: Text(
        errorText,
        style: TextStyle(
          color: Theme.of(context).colorScheme.error,
          fontSize: 12,
        ),
      ),
    );
  }
}
