import 'package:flutter/material.dart';

import 'profile_form_metrics.dart';

class ProfileTextActionButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback? onPressed;
  final bool alignEnd;
  final Widget? child;

  const ProfileTextActionButton({
    super.key,
    required this.label,
    required this.color,
    required this.onPressed,
    this.alignEnd = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final horizontal = profileActionButtonPadding.horizontal / 2;

    return Transform.translate(
      offset: Offset(alignEnd ? horizontal : -horizontal, 0),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: color,
          padding: profileActionButtonPadding,
          minimumSize: const Size(48, 48),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: alignEnd ? Alignment.centerRight : Alignment.centerLeft,
        ),
        child: child ?? Text(label),
      ),
    );
  }
}
