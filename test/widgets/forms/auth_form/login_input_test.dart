import 'package:coursework/presentation/widgets/forms/auth_form/login_input/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_app.dart';

void main() {
  testWidgets('shows label and error text', (tester) async {
    await pumpApp(
      tester,
      LoginInput(
        controller: TextEditingController(),
        label: 'login (email)',
        onChanged: (_) {},
        errorText: 'login is required',
      ),
    );

    expect(find.text('login (email)'), findsOneWidget);
    expect(find.text('login is required'), findsOneWidget);
  });

  testWidgets('toggles password visibility', (tester) async {
    final controller = TextEditingController(text: 'secret');

    await pumpApp(
      tester,
      LoginInput(
        controller: controller,
        label: 'password',
        onChanged: (_) {},
        isPassword: true,
      ),
    );

    final editable = find.byType(EditableText);
    expect(tester.widget<EditableText>(editable).obscureText, isTrue);

    await tester.tap(find.byIcon(Icons.visibility_off));
    await tester.pump();

    expect(tester.widget<EditableText>(editable).obscureText, isFalse);
    expect(find.byIcon(Icons.visibility), findsOneWidget);
  });

  testWidgets('disables field and obscure toggle while loading', (
    tester,
  ) async {
    await pumpApp(
      tester,
      LoginInput(
        controller: TextEditingController(text: 'secret'),
        label: 'password',
        onChanged: (_) {},
        isPassword: true,
        isLoading: true,
      ),
    );

    expect(
      tester.widget<TextFormField>(find.byType(TextFormField)).enabled,
      isFalse,
    );
    expect(
      tester.widget<IconButton>(find.byType(IconButton)).onPressed,
      isNull,
    );
    expect(
      tester.widget<EditableText>(find.byType(EditableText)).obscureText,
      isTrue,
    );
  });
}
