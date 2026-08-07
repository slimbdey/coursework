import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/loader.gif', width: 52, height: 28);
  }
}
