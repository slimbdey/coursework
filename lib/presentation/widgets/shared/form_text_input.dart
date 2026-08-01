import 'package:flutter/material.dart';

class FormTextInput extends StatelessWidget {
  static const double controlHeight = 48;

  final TextEditingController controller;
  final bool isLoading;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSubmitted;
  final FocusNode? focusNode;
  final String? hintText;
  final TextInputAction textInputAction;
  final Color? shadowColor;

  const FormTextInput({
    super.key,
    required this.controller,
    this.isLoading = false,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.hintText,
    this.textInputAction = TextInputAction.done,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final hintColor =
        textTheme.headlineMedium?.color ??
        colorScheme.onSurface.withValues(alpha: 0.38);
    final borderRadius = BorderRadius.circular(4.0);

    final glow = shadowColor;

    OutlineInputBorder border({double width = 1}) => OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(
        color: glow ?? colorScheme.secondary,
        width: width,
      ),
    );

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: glow == null
                ? Colors.transparent
                : glow.withValues(alpha: 0.45),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        enabled: !isLoading,
        onChanged: onChanged,
        onSubmitted: onSubmitted != null ? (_) => onSubmitted!() : null,
        textInputAction: textInputAction,
        keyboardAppearance: Theme.of(context).brightness,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintColor,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          filled: true,
          fillColor: isLoading
              ? colorScheme.onSurface.withValues(alpha: 0.04)
              : colorScheme.surface,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          border: border(),
          enabledBorder: border(),
          focusedBorder: border(width: 1.5),
        ),
      ),
    );
  }
}
