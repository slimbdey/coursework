import 'package:coursework/presentation/widgets/forms/search_form/word_card.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/fixtures.dart';
import '../../../helpers/pump_app.dart';

void main() {
  testWidgets('shows word, translation, example and date', (tester) async {
    final item = word(
      text: 'hello',
      translation: 'привет',
      example: 'Hello world',
      addDate: '2024-01-01',
    );

    await pumpApp(tester, SearchWordCard(word: item, query: 'he'));

    expect(find.textContaining('hello'), findsWidgets);
    expect(find.textContaining('привет'), findsWidgets);
    expect(find.text('Hello world'), findsOneWidget);
    expect(find.text('2024-01-01'), findsOneWidget);
  });
}
