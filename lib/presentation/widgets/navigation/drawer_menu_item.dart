import 'package:flutter/material.dart';

class DrawerMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  const DrawerMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final foregroundColor = theme.appBarTheme.foregroundColor!.withValues(
      alpha: 0.5,
    );
    final selectedColor = theme.appBarTheme.foregroundColor;
    final color = isSelected ? selectedColor : foregroundColor;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return Colors.black.withValues(alpha: 0.06);
          }
          if (states.contains(WidgetState.pressed)) {
            return Colors.black.withValues(alpha: 0.1);
          }
          return null;
        }),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
          child: Row(
            children: [
              Icon(icon, color: color),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: color,
                    fontWeight: isSelected ? FontWeight.w900 : FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
