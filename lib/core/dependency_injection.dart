import 'package:coursework/application/common/db_info_repository.dart';
import 'package:coursework/infrastructure/datasources/network_datasource.dart';
import 'package:coursework/infrastructure/repositories/network_db_info_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


List<RepositoryProvider> getProviders() {
  final networkSource = NetworkDatasource();
  final dataSource = networkSource;

  final dbInfoRepository = NetworkDbInfoRepository(datasource: dataSource);

  return [
    RepositoryProvider<DbInfoRepository>(create: (_) => dbInfoRepository),
  ];
}
