import 'package:flutter/material.dart';

class LoginInput extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final Function(String) onChanged;
  final bool autoFocus;
  final String? errorText;
  final bool isLoading;
  final bool isPassword;

  const LoginInput(
      {super.key,
      required this.controller,
      required this.label,
      required this.onChanged,
      this.autoFocus = false,
      this.errorText,
      this.isLoading = false,
      this.isPassword = false});

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final hintColor =
        textTheme.headlineMedium?.color ??
        colorScheme.onSurface.withValues(alpha: 0.38);
    final borderRadius = BorderRadius.circular(10.0);
    final defaultBorderSide = BorderSide(
      color: colorScheme.primary,
      width: 1,
    );

    return SizedBox(
      width: 232,
      child: TextFormField(
        autofocus: widget.autoFocus,
        obscureText: widget.isPassword && _obscureText,
        style: TextStyle(color: colorScheme.onSurface),
        cursorColor: colorScheme.primary,
        controller: widget.controller,
        enabled: !widget.isLoading,
        decoration: InputDecoration(
          errorText: widget.errorText,
          errorStyle: TextStyle(color: colorScheme.error),
          hintText: widget.label,
          hintStyle: TextStyle(
            color: hintColor,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          prefixIcon: Icon(
            widget.isPassword ? Icons.lock : Icons.person,
            color: colorScheme.primary,
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 48,
            minHeight: 48,
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: widget.isLoading
                      ? null
                      : () => setState(() => _obscureText = !_obscureText),
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: colorScheme.primary,
                  ),
                )
              : null,
          filled: true,
          fillColor: widget.isLoading
              ? colorScheme.onSurface.withValues(alpha: 0.12)
              : colorScheme.surface,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 13, horizontal: 16.0),
          border: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: defaultBorderSide,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: defaultBorderSide,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: defaultBorderSide,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: colorScheme.error, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: colorScheme.error, width: 1.5),
          ),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
