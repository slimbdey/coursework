import 'package:coursework/presentation/widgets/shared/login_input/login_input_field.dart';
import 'package:flutter/material.dart';

class LoginInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Function(String) onChanged;
  final bool autoFocus;
  final String? errorText;
  final bool isLoading;
  final bool isPassword;

  const LoginInput({
    super.key,
    required this.controller,
    required this.label,
    required this.onChanged,
    this.autoFocus = false,
    this.errorText,
    this.isLoading = false,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return LoginInputField(
      controller: controller,
      label: label,
      onChanged: onChanged,
      autoFocus: autoFocus,
      errorText: errorText,
      isLoading: isLoading,
      isPassword: isPassword,
    );
  }
}
