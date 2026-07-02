import 'package:coursework/application/infrastructure/db_info_repository.dart';
import 'package:coursework/application/infrastructure/login_service.dart';
import 'package:coursework/infrastructure/datasources/network_datasource.dart';
import 'package:coursework/infrastructure/repositories/network_db_info_repository.dart';
import 'package:coursework/infrastructure/services/network_login_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


List<RepositoryProvider> getProviders() {
  final networkSource = NetworkDatasource();
  final dataSource = networkSource;
  final loginService = NetworkLoginService();

  final dbInfoRepository = NetworkDbInfoRepository(datasource: dataSource);

  return [
    RepositoryProvider<DbInfoRepository>(create: (_) => dbInfoRepository),
    RepositoryProvider<LoginService>(create: (_) => loginService),
  ];
}
