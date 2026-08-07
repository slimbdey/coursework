import 'package:coursework/presentation/widgets/forms/search_form/highlighted_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_app.dart';

void main() {
  const style = TextStyle(fontSize: 14, color: Colors.black);

  testWidgets('renders plain text when query is empty', (tester) async {
    await pumpApp(
      tester,
      const HighlightedText(text: 'hello', query: '', style: style),
    );

    expect(
      find.byWidgetPredicate(
        (widget) => widget is Text && widget.data == 'hello',
      ),
      findsOneWidget,
    );
  });

  testWidgets('highlights query case-insensitively', (tester) async {
    await pumpApp(
      tester,
      const HighlightedText(text: 'Hello', query: 'he', style: style),
    );

    final richText = tester.widget<RichText>(
      find.descendant(
        of: find.byType(HighlightedText),
        matching: find.byType(RichText),
      ),
    );
    final span = richText.text as TextSpan;
    final texts = <String>[];
    final colors = <Color?>[];

    span.visitChildren((child) {
      if (child is TextSpan && child.text != null) {
        texts.add(child.text!);
        colors.add(child.style?.color);
      }
      return true;
    });

    expect(texts.join(), 'Hello');
    expect(texts, containsAll(['He', 'llo']));
    expect(colors.first, isNot(Colors.black));
  });
}
