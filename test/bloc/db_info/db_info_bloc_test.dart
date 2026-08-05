import 'package:coursework/presentation/bloc/db_info/db_info_bloc.dart';
import 'package:coursework/presentation/bloc/db_info/db_info_event.dart';
import 'package:coursework/presentation/bloc/db_info/db_info_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/bloc_harness.dart';
import '../../helpers/fixtures.dart';
import '../../helpers/mocks.dart';

void main() {
  late MockDbInfoRepository repository;
  final info = dbInfo();

  setUp(() {
    repository = MockDbInfoRepository();
  });

  test('LoadDbInfoEvent emits loaded info', () async {
    when(() => repository.getDbInfo()).thenAnswer((_) async => info);

    final states = await runBloc(
      DbInfoBloc(dbInfoRepository: repository),
      act: (bloc) => bloc.add(const LoadDbInfoEvent()),
    );

    expect(states, [
      isA<DbInfoLoadingState>(),
      isA<DbInfoLoadedState>().having((s) => s.dbInfo, 'dbInfo', info),
    ]);
  });

  test('LoadDbInfoEvent emits error on failure', () async {
    when(() => repository.getDbInfo()).thenThrow(Exception('fail'));

    final states = await runBloc(
      DbInfoBloc(dbInfoRepository: repository),
      act: (bloc) => bloc.add(const LoadDbInfoEvent()),
    );

    expect(states, [isA<DbInfoLoadingState>(), isA<DbInfoErrorState>()]);
  });
}
