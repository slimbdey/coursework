import 'package:coursework/application/common/datasource.dart';
import 'package:coursework/application/dtos/db_info_dto.dart';
import 'package:coursework/application/dtos/notion_dto.dart';
import 'package:coursework/application/dtos/word_dto.dart';

import 'network_datasource_endpoints.dart';

class NetworkDatasource extends Datasource {
  @override
  Future<DbInfoDto> getDbInfo() async {
    return dioClient.get<DbInfoDto>(
      NetworkDatasourceEndpoints.dbInfo.path,
      DbInfoDto.fromJson,
    );
  }

  @override
  Future<List<WordDto>> getFor(String query) async {
    return dioClient.getList<WordDto>(
      NetworkDatasourceEndpoints.search.path,
      WordDto.fromJson,
      queryParameters: {'particle': query},
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
    return dioClient.getList<NotionDto>(
      endpoint.path,
      NotionDto.fromJson,
      queryParameters: {'login': query},
    );
  }
}
