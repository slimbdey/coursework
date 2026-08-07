import 'package:coursework/presentation/widgets/forms/search_form/search_error.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_app.dart';

void main() {
  testWidgets('renders error message', (tester) async {
    await pumpApp(tester, const SearchError(message: 'network failed'));

    expect(find.text('network failed'), findsOneWidget);
  });
}
