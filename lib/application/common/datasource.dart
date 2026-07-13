import 'package:coursework/application/dtos/notion_dto.dart';
import 'package:coursework/application/dtos/word_dto.dart';
import 'package:coursework/core/dio_client.dart';
import 'package:coursework/application/dtos/db_info_dto.dart';

abstract class Datasource {
  final DioClient dioClient = DioClient();

  Future<DbInfoDto> getDbInfo();
  Future<List<WordDto>> getFor(String query);
  Future<List<NotionDto>> getIdiomsFor(String query);
}
