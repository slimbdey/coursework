import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotionHeader extends StatelessWidget {
  const NotionHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final titleColor = Theme.of(context).colorScheme.onSurfaceVariant;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          textAlign: TextAlign.right,
          style: GoogleFonts.roboto(
            fontSize: 32,
            fontWeight: FontWeight.w200,
            letterSpacing: 0,
            color: titleColor,
          ),
        ),
        Text(
          subtitle,
          textAlign: TextAlign.right,
          style: GoogleFonts.roboto(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.2,
            color: titleColor.withValues(alpha: 0.9),
          ),
        ),
      ],
    );
  }
}
