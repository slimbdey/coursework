import 'package:coursework/presentation/widgets/shared/login_input/login_input_cursor.dart';
import 'package:coursework/presentation/widgets/shared/login_input/login_input_decoration.dart';
import 'package:coursework/presentation/widgets/shared/login_input/login_input_text_field.dart';
import 'package:flutter/material.dart';

class LoginInputField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final Function(String) onChanged;
  final bool autoFocus;
  final String? errorText;
  final bool isLoading;
  final bool isPassword;

  const LoginInputField({
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
  State<LoginInputField> createState() => _LoginInputFieldState();
}

class _LoginInputFieldState extends State<LoginInputField> {
  late bool _obscureText;
  late final FocusNode _focusNode;
  final GlobalKey _fieldKey = GlobalKey();
  Offset? _lastTapLocalPosition;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
    _focusNode = FocusNode();
    if (widget.autoFocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _focusNode.requestFocus();
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleTap() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      LoginInputCursor.placeAtTap(
        controller: widget.controller,
        fieldKey: _fieldKey,
        tapPosition: _lastTapLocalPosition,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final hasError = widget.errorText != null;

    return SizedBox(
      width: 232,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoginInputTextField(
            fieldKey: _fieldKey,
            focusNode: _focusNode,
            controller: widget.controller,
            label: widget.label,
            onChanged: widget.onChanged,
            isPassword: widget.isPassword,
            obscureText: _obscureText,
            isLoading: widget.isLoading,
            hasError: hasError,
            onTap: _handleTap,
            onPointerDown: (event) =>
                _lastTapLocalPosition = event.localPosition,
            onToggleObscure: widget.isLoading
                ? null
                : () => setState(() => _obscureText = !_obscureText),
          ),
          LoginInputDecoration.errorSlot(
            context: context,
            errorText: widget.errorText,
          ),
        ],
      ),
    );
  }
}
