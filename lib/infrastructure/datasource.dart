import 'package:coursework/infrastructure/dtos/db_info_dto.dart';
import 'package:coursework/infrastructure/dtos/notion_dto.dart';
import 'package:coursework/infrastructure/dtos/word_dto.dart';
import 'package:coursework/infrastructure/network_client.dart';

abstract class Datasource {
  final NetworkClient networkClient;

  Datasource({required this.networkClient});

  Future<DbInfoDto> getDbInfo();
  Future<List<WordDto>> getFor(String query);
  Future<List<WordDto>> getSetFor(String query);
  Future<List<NotionDto>> getIdiomsFor(String query);
  Future<List<NotionDto>> getPhrasesFor(String query);
  Future<List<NotionDto>> getGerundsFor(String query);
  Future<List<NotionDto>> getGeneralsFor(String query);
}
