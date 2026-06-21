import 'package:coursework/domain/db_info.dart';

abstract class DbInfoState {
  const DbInfoState();
}

class DbInfoInitialState extends DbInfoState {
  const DbInfoInitialState();
}

class DbInfoLoadingState extends DbInfoState {
  const DbInfoLoadingState();
}

class DbInfoLoadedState extends DbInfoState {
  final DbInfo dbInfo;
  const DbInfoLoadedState({required this.dbInfo});
}

class DbInfoErrorState extends DbInfoState {
  final String message;
  const DbInfoErrorState({required this.message});
}
