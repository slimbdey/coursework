import 'package:coursework/application/infrastructure/db_info_repository.dart';
import 'package:coursework/application/infrastructure/login_service.dart';
import 'package:coursework/application/infrastructure/notion_repository.dart';
import 'package:coursework/application/infrastructure/queries/shuffled_notion_provider.dart';
import 'package:coursework/application/infrastructure/queries/training_set_provider.dart';
import 'package:coursework/application/infrastructure/word_repository.dart';
import 'package:coursework/infrastructure/dio_client/index.dart';
import 'package:coursework/infrastructure/datasources/network_datasource.dart';
import 'package:coursework/infrastructure/repositories/network_db_info_repository.dart';
import 'package:coursework/infrastructure/repositories/network_notion_repository.dart';
import 'package:coursework/infrastructure/repositories/network_word_repository.dart';
import 'package:coursework/infrastructure/services/network_login_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<RepositoryProvider> getProviders() {
  final networkClient = DioClient();

  final networkSource = NetworkDatasource(networkClient: networkClient);
  final dataSource = networkSource;
  final loginService = NetworkLoginService(networkClient: networkClient);

  final dbInfoRepository = NetworkDbInfoRepository(datasource: dataSource);
  final wordRepository = NetworkWordRepository(datasource: dataSource);
  final notionRepository = NetworkNotionRepository(datasource: dataSource);
  final trainingSetProvider = TrainingSetProvider(repository: wordRepository);
  final shuffledNotionProvider = ShuffledNotionProvider(
    repository: notionRepository,
  );

  return [
    RepositoryProvider<DbInfoRepository>(create: (_) => dbInfoRepository),
    RepositoryProvider<LoginService>(create: (_) => loginService),
    RepositoryProvider<WordRepository>(create: (_) => wordRepository),
    RepositoryProvider<NotionRepository>(create: (_) => notionRepository),
    RepositoryProvider<TrainingSetProvider>(create: (_) => trainingSetProvider),
    RepositoryProvider<ShuffledNotionProvider>(
      create: (_) => shuffledNotionProvider,
    ),
  ];
}
