import 'login_input_decoration.dart';
import 'package:flutter/material.dart';

class LoginInputTextField extends StatelessWidget {
  final GlobalKey fieldKey;
  final FocusNode focusNode;
  final TextEditingController controller;
  final String label;
  final Function(String) onChanged;
  final bool isPassword;
  final bool obscureText;
  final bool isLoading;
  final bool hasError;
  final VoidCallback onTap;
  final ValueChanged<PointerDownEvent> onPointerDown;
  final VoidCallback? onToggleObscure;

  const LoginInputTextField({
    super.key,
    required this.fieldKey,
    required this.focusNode,
    required this.controller,
    required this.label,
    required this.onChanged,
    required this.isPassword,
    required this.obscureText,
    required this.isLoading,
    required this.hasError,
    required this.onTap,
    required this.onPointerDown,
    required this.onToggleObscure,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Listener(
      onPointerDown: onPointerDown,
      child: TextFormField(
        key: fieldKey,
        focusNode: focusNode,
        selectAllOnFocus: false,
        onTapAlwaysCalled: true,
        onTap: onTap,
        obscureText: isPassword && obscureText,
        keyboardAppearance: Theme.of(context).brightness,
        style: TextStyle(color: colorScheme.onSurface, fontSize: 16),
        cursorColor: colorScheme.primary,
        showCursor: true,
        controller: controller,
        enabled: !isLoading,
        decoration: LoginInputDecoration.build(
          context: context,
          label: label,
          hasError: hasError,
          isPassword: isPassword,
          isLoading: isLoading,
          obscureText: obscureText,
          onToggleObscure: onToggleObscure,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
