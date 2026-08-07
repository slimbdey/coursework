import 'package:flutter/material.dart';

class SearchError extends StatelessWidget {
  final String message;

  const SearchError({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(color: colorScheme.error, fontSize: 14),
      ),
    );
  }
}
