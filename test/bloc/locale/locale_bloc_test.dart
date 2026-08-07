import 'package:coursework/presentation/bloc/locale/locale_bloc.dart';
import 'package:coursework/presentation/bloc/locale/locale_event.dart';
import 'package:coursework/presentation/bloc/locale/locale_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/bloc_harness.dart';

void main() {
  test('initial locale is ru', () {
    final bloc = LocaleBloc();
    expect(bloc.state.locale, const Locale('ru'));
    bloc.close();
  });

  test('ChangeLocaleEvent updates locale', () async {
    final states = await runBloc(
      LocaleBloc(),
      act: (bloc) => bloc.add(ChangeLocaleEvent('en')),
    );

    expect(states, [
      isA<LocaleState>().having((s) => s.locale, 'locale', const Locale('en')),
    ]);
  });
}
