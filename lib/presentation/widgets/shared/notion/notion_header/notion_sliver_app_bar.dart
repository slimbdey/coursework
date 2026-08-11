part of 'index.dart';

class NotionSliverAppBar extends StatelessWidget {
  const NotionSliverAppBar({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  static const double expandedHeight = 104;
  static const double collapsedHeight = 56;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final titleColor = Theme.of(context).colorScheme.onSurfaceVariant;

    return SliverAppBar(
      primary: false,
      pinned: true,
      stretch: true,
      expandedHeight: expandedHeight,
      collapsedHeight: collapsedHeight,
      toolbarHeight: collapsedHeight,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final t =
              ((constraints.maxHeight - collapsedHeight) /
                      (expandedHeight - collapsedHeight))
                  .clamp(0.0, 1.0);

          return ColoredBox(
            color: backgroundColor,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: t > 0.35
                  ? Align(
                      alignment: Alignment.topRight,
                      child: Opacity(
                        opacity: Curves.easeOut.transform(t),
                        child: NotionHeader(title: title, subtitle: subtitle),
                      ),
                    )
                  : Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0,
                          color: titleColor,
                        ),
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
