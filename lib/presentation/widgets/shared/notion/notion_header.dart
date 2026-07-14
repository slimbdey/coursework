import 'package:coursework/presentation/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotionHeader extends StatelessWidget {
  const NotionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final titleColor = Theme.of(context).colorScheme.onSurfaceVariant;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          l10n.idiomsTitle,
          textAlign: TextAlign.right,
          style: GoogleFonts.roboto(
            fontSize: 32,
            fontWeight: FontWeight.w200,
            letterSpacing: 0,
            color: titleColor,
          ),
        ),
        Text(
          l10n.idiomsSubtitle,
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
