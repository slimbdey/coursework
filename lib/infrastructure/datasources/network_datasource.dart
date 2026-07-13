import 'package:coursework/application/common/datasource.dart';
import 'package:coursework/application/dtos/db_info_dto.dart';
import 'package:coursework/application/dtos/notion_dto.dart';
import 'package:coursework/application/dtos/word_dto.dart';

class NetworkDatasource extends Datasource {
  @override
  Future<DbInfoDto> getDbInfo() async {
    return dioClient.get<DbInfoDto>('users/getdbinfo', DbInfoDto.fromJson);
  }

  @override
  Future<List<WordDto>> getFor(String query) async {
    return dioClient.getList<WordDto>(
      'words/getfor',
      WordDto.fromJson,
      queryParameters: {'particle': query},
    );
  }

  @override
  Future<List<NotionDto>> getIdiomsFor(String query) async {
    return dioClient.getList<NotionDto>(
      'words/getidiomsfor',
      NotionDto.fromJson,
      queryParameters: {'login': query},
    );
  }
}
