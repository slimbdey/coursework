import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SearchFormInput extends StatelessWidget {
  static const double controlHeight = 48;

  final TextEditingController controller;
  final bool isLoading;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSubmitted;

  const SearchFormInput({
    super.key,
    required this.controller,
    this.isLoading = false,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final hintColor =
        textTheme.headlineMedium?.color ??
        colorScheme.onSurface.withValues(alpha: 0.38);
    final borderRadius = BorderRadius.circular(4.0);

    OutlineInputBorder border({double width = 1}) => OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: colorScheme.secondary, width: width),
    );

    return TextField(
      controller: controller,
      enabled: !isLoading,
      onChanged: onChanged,
      onSubmitted: onSubmitted != null ? (_) => onSubmitted!() : null,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: l10n.searchFormPlaceholder,
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
    );
  }
}
