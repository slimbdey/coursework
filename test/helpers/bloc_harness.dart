import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

///
/// Это обвязка для юнит-тестов Bloc.
/// Единственная функция — runBloc: отправить событие, собрать все эмиты, закрыть блок, вернуть список стейтов
///
/// Bloc эмитит стейты в stream. Хелпер складывает каждый новый стейт в список.
/// Начальный стейт сюда не попадает: stream шлёт только то, что вышло после подписки (emit в on\<Event>)
///
/// Далее ждет коллбэк из теста
///
/// pumpEventQueue из flutter_test прокручивает microtask/event queue, пока async-обработчики не дойдут до конца
///
/// Отписка, чтобы не копить слушателей, и close(), чтобы не было утечек стримов и предупреждений Bloc was not closed
///
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
