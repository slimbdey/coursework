import 'package:coursework/application/common/datasource.dart';
import 'package:coursework/application/dtos/notion_dto.dart';
import 'package:coursework/application/infrastructure/notion_repository.dart';
import 'package:coursework/domain/notion.dart';

class NetworkNotionRepository extends NotionRepository {
  final Datasource datasource;

  NetworkNotionRepository({required this.datasource});

  Future<List<Notion>> _fetchNotions(
    String query,
    Future<List<NotionDto>> dtosFuture,
  ) async {
    final notionDtos = await dtosFuture;
    return notionDtos
        .map((e) => Notion(id: e.id, issue: e.issue, answer: e.answer))
        .toList();
  }

  @override
  Future<List<Notion>> getIdiomsFor(String query) =>
      _fetchNotions(query, datasource.getIdiomsFor(query));

  @override
  Future<List<Notion>> getPhrasesFor(String query) =>
      _fetchNotions(query, datasource.getPhrasesFor(query));

  @override
  Future<List<Notion>> getGerundsFor(String query) =>
      _fetchNotions(query, datasource.getGerundsFor(query));

  @override
  Future<List<Notion>> getGeneralsFor(String query) =>
      _fetchNotions(query, datasource.getGeneralsFor(query));
}
