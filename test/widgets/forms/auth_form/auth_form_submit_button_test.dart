import 'package:coursework/presentation/widgets/forms/auth_form/auth_form_submit_button.dart';
import 'package:coursework/presentation/widgets/shared/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_app.dart';

void main() {
  testWidgets('shows label and calls onPressed', (tester) async {
    var pressed = false;

    await pumpApp(
      tester,
      AuthFormSubmitButton(
        isOutlined: true,
        label: 'sign in',
        isLoading: false,
        onPressed: () => pressed = true,
      ),
    );

    expect(find.text('sign in'), findsOneWidget);
    await tester.tap(find.byType(FilledButton));
    expect(pressed, isTrue);
  });

  testWidgets('shows loader and disables button while loading', (tester) async {
    var pressed = false;

    await pumpApp(
      tester,
      AuthFormSubmitButton(
        isOutlined: false,
        label: 'sign in',
        isLoading: true,
        onPressed: () => pressed = true,
      ),
    );

    expect(find.byType(Loader), findsOneWidget);
    expect(find.text('sign in'), findsNothing);
    await tester.tap(find.byType(FilledButton));
    expect(pressed, isFalse);
  });
}
