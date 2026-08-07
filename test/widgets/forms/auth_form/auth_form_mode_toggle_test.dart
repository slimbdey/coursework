import 'package:coursework/presentation/widgets/forms/auth_form/auth_form_mode_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_app.dart';

void main() {
  testWidgets('shows create account label in sign-in mode', (tester) async {
    var toggled = false;

    await pumpApp(
      tester,
      AuthFormModeToggle(
        isSignIn: true,
        isLoading: false,
        onToggle: () => toggled = true,
      ),
    );

    expect(find.text('create account'), findsOneWidget);
    await tester.tap(find.byType(TextButton));
    expect(toggled, isTrue);
  });

  testWidgets('shows sign in label in sign-up mode', (tester) async {
    await pumpApp(
      tester,
      AuthFormModeToggle(isSignIn: false, isLoading: false, onToggle: () {}),
    );

    expect(find.text('sign in account'), findsOneWidget);
  });

  testWidgets('disables toggle while loading', (tester) async {
    var toggled = false;

    await pumpApp(
      tester,
      AuthFormModeToggle(
        isSignIn: true,
        isLoading: true,
        onToggle: () => toggled = true,
      ),
    );

    await tester.tap(find.byType(TextButton));
    expect(toggled, isFalse);
  });
}
