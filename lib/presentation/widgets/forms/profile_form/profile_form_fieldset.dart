import 'package:flutter/material.dart';

class ProfileFormFieldset extends StatelessWidget {
  final String title;
  final Widget child;

  const ProfileFormFieldset({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: colorScheme.primaryContainer,
          ),
        ),
        const SizedBox(height: 16),
        child,
      ],
    );
  }
}
