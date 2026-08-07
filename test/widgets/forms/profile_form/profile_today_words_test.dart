import 'package:coursework/presentation/bloc/profile_today_words/profile_today_words_bloc.dart';
import 'package:coursework/presentation/bloc/profile_today_words/profile_today_words_state.dart';
import 'package:coursework/presentation/widgets/forms/profile_form/profile_today_words/index.dart';
import 'package:coursework/presentation/widgets/forms/profile_form/profile_today_words/words_table.dart';
import 'package:coursework/presentation/widgets/shared/loader.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/fixtures.dart';
import '../../../helpers/mocks.dart';
import '../../../helpers/pump_app.dart';

void main() {
  Future<void> pumpTodayWords(
    WidgetTester tester,
    ProfileTodayWordsState state,
  ) async {
    await pumpApp(
      tester,
      BlocProvider<ProfileTodayWordsBloc>.value(
        value: mockProfileTodayWordsBloc(state),
        child: const ProfileTodayWords(),
      ),
    );
  }

  testWidgets('shows loader for initial and loading states', (tester) async {
    await pumpTodayWords(tester, const ProfileTodayWordsInitialState());
    expect(find.byType(Loader), findsOneWidget);

    await pumpTodayWords(tester, const ProfileTodayWordsLoadingState());
    expect(find.byType(Loader), findsOneWidget);
  });

  testWidgets('shows empty, error and table states', (tester) async {
    await pumpTodayWords(tester, const ProfileTodayWordsLoadedState(words: []));
    expect(find.text('No words found'), findsOneWidget);

    await pumpTodayWords(
      tester,
      const ProfileTodayWordsErrorState(message: 'failed'),
    );
    expect(find.text('failed'), findsOneWidget);

    await pumpTodayWords(
      tester,
      ProfileTodayWordsLoadedState(words: [word(text: 'hello')]),
    );
    expect(find.byType(ProfileTodayWordsTable), findsOneWidget);
    expect(find.textContaining('hello'), findsOneWidget);
  });
}
