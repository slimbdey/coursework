import 'package:coursework/infrastructure/datasource.dart';
import 'package:coursework/infrastructure/dtos/db_info_dto.dart';
import 'package:coursework/infrastructure/dtos/notion_dto.dart';
import 'package:coursework/infrastructure/dtos/word_dto.dart';

import 'network_datasource_endpoints.dart';

class NetworkDatasource extends Datasource {
  NetworkDatasource({required super.networkClient});

  @override
  Future<DbInfoDto> getDbInfo() async {
    return networkClient.get<DbInfoDto>(
      NetworkDatasourceEndpoints.dbInfo.path,
      DbInfoDto.fromJson,
    );
  }

  @override
  Future<List<WordDto>> getFor(String query) async {
    return networkClient.getList<WordDto>(
      NetworkDatasourceEndpoints.search.path,
      WordDto.fromJson,
      queryParameters: {'particle': query},
    );
  }

  @override
  Future<List<WordDto>> getSetFor(String query) async {
    return networkClient.getList<WordDto>(
      NetworkDatasourceEndpoints.training.path,
      WordDto.fromJson,
      queryParameters: {'login': query},
    );
  }

  @override
  Future<List<NotionDto>> getIdiomsFor(String query) =>
      _getByLogin(NetworkDatasourceEndpoints.idioms, query);

  @override
  Future<List<NotionDto>> getPhrasesFor(String query) =>
      _getByLogin(NetworkDatasourceEndpoints.phrases, query);

  @override
  Future<List<NotionDto>> getGerundsFor(String query) =>
      _getByLogin(NetworkDatasourceEndpoints.gerunds, query);

  @override
  Future<List<NotionDto>> getGeneralsFor(String query) =>
      _getByLogin(NetworkDatasourceEndpoints.generals, query);

  Future<List<NotionDto>> _getByLogin(
    NetworkDatasourceEndpoints endpoint,
    String query,
  ) async {
    return networkClient.getList<NotionDto>(
      endpoint.path,
      NotionDto.fromJson,
      queryParameters: {'login': query},
    );
  }
}
