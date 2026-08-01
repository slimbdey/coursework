import 'package:flutter/material.dart';

class ProfileFormRow extends StatelessWidget {
  final String label;
  final Widget trailing;

  const ProfileFormRow({
    super.key,
    required this.label,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              height: 1.2,
              color: colorScheme.onSurface.withValues(alpha: 0.65),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(child: trailing),
      ],
    );
  }
}
