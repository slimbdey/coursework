import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

/// Runs [act] on [bloc], collects emitted states, then closes the bloc.
Future<List<S>> runBloc<B extends BlocBase<S>, S>(
  B bloc, {
  required FutureOr<void> Function(B bloc) act,
}) async {
  final states = <S>[];
  final sub = bloc.stream.listen(states.add);
  await act(bloc);
  await pumpEventQueue();
  await sub.cancel();
  await bloc.close();
  return states;
}
