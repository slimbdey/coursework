import 'package:coursework/presentation/widgets/forms/search_form/search_results.dart';
import 'package:coursework/presentation/widgets/forms/search_form/word_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/fixtures.dart';
import '../../../helpers/pump_app.dart';

void main() {
  testWidgets('shows match count and word cards', (tester) async {
    final words = [
      word(id: 1, text: 'hello'),
      word(id: 2, text: 'help', translation: 'помощь'),
    ];

    await pumpApp(
      tester,
      SizedBox(
        height: 400,
        child: SearchResults(words: words, query: 'he'),
      ),
    );

    expect(find.text('MATCHES: 2'), findsOneWidget);
    expect(find.byType(SearchWordCard), findsNWidgets(2));
  });
}
