import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotionHeader extends StatelessWidget {
  const NotionHeader({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final titleColor = Theme.of(context).colorScheme.onSurfaceVariant;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
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

class NotionSliverAppBar extends StatelessWidget {
  const NotionSliverAppBar({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  static const double expandedHeight = 120;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return SliverAppBar(
      primary: false,
      pinned: true,
      stretch: true,
      expandedHeight: expandedHeight,
      collapsedHeight: 56,
      toolbarHeight: 56,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Align(
            alignment: Alignment.bottomRight,
            child: NotionHeader(title: title, subtitle: subtitle),
          ),
        ),
      ),
    );
  }
}
