import 'package:coursework/presentation/bloc/theme/theme_bloc.dart';
import 'package:coursework/presentation/bloc/theme/theme_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<ThemeBloc>().add(ToggleThemeEvent());
      },
      style: IconButton.styleFrom(
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        padding: const EdgeInsets.all(12),
        minimumSize: const Size(48, 48),
        tapTargetSize: MaterialTapTargetSize.padded,
      ),
      icon: Icon(
        Theme.of(context).brightness == Brightness.dark
            ? Icons.light_mode
            : Icons.dark_mode,
        size: 20,
      ),
    );
  }
}
