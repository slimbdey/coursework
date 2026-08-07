import 'package:coursework/presentation/bloc/search/search_bloc.dart';
import 'package:coursework/presentation/bloc/search/search_event.dart';
import 'package:coursework/presentation/bloc/search/search_state.dart';
import 'package:coursework/presentation/widgets/forms/search_form/index.dart';
import 'package:coursework/presentation/widgets/forms/search_form/search_error.dart';
import 'package:coursework/presentation/widgets/forms/search_form/search_results.dart';
import 'package:coursework/presentation/widgets/shared/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/fixtures.dart';
import '../../../helpers/mocks.dart';
import '../../../helpers/pump_app.dart';

void main() {
  Future<MockSearchBloc> pumpForm(
    WidgetTester tester,
    SearchState state,
  ) async {
    final bloc = mockSearchBloc(state);
    await pumpApp(
      tester,
      BlocProvider<SearchBloc>.value(
        value: bloc,
        child: const SizedBox(height: 600, child: SearchForm()),
      ),
    );
    return bloc;
  }

  testWidgets('does not search for empty query', (tester) async {
    final bloc = await pumpForm(tester, const SearchInitialState());

    await tester.tap(find.text('search'));
    await tester.pump();

    verifyNever(() => bloc.add(any()));
  });

  testWidgets('dispatches SearchWordsEvent for non-empty query', (
    tester,
  ) async {
    final bloc = await pumpForm(tester, const SearchInitialState());

    await tester.enterText(find.byType(TextField), '  hello  ');
    await tester.tap(find.text('search'));
    await tester.pump();

    final captured = verify(() => bloc.add(captureAny())).captured;
    expect(captured.single, isA<SearchWordsEvent>());
    expect((captured.single as SearchWordsEvent).query, 'hello');
  });

  testWidgets('shows results for loaded state', (tester) async {
    await pumpForm(tester, SearchLoadedState(query: 'he', words: [word()]));
    expect(find.byType(SearchResults), findsOneWidget);
  });

  testWidgets('shows error and loader by state', (tester) async {
    await pumpForm(
      tester,
      const SearchErrorState(query: 'he', message: 'boom'),
    );
    expect(find.byType(SearchError), findsOneWidget);
    expect(find.text('boom'), findsOneWidget);

    await pumpForm(tester, const SearchLoadingState(query: 'he'));
    expect(find.byType(Loader), findsOneWidget);
  });
}
