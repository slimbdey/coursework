import 'package:flutter/material.dart';

class FormWidth extends StatelessWidget {
  final double maxWidth;
  final Widget child;

  const FormWidth({super.key, required this.maxWidth, required this.child});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
