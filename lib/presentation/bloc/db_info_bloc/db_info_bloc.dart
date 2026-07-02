import 'package:coursework/application/infrastructure/db_info_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'db_info_event.dart';
import 'db_info_state.dart';

class DbInfoBloc extends Bloc<DbInfoEvent, DbInfoState> {
  final DbInfoRepository dbInfoRepository;

  DbInfoBloc({required this.dbInfoRepository})
    : super(const DbInfoInitialState()) {
    on<LoadDbInfoEvent>((event, emit) async {
      emit(const DbInfoLoadingState());
      try {
        final dbInfo = await dbInfoRepository.getDbInfo();
        emit(DbInfoLoadedState(dbInfo: dbInfo));
      } catch (e) {
        emit(DbInfoErrorState(message: e.toString()));
      }
    });
  }
}
