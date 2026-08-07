import 'package:coursework/domain/notion.dart';

abstract class NotionRepository {
  Future<List<Notion>> getIdiomsFor(String query);
  Future<List<Notion>> getPhrasesFor(String query);
  Future<List<Notion>> getGerundsFor(String query);
  Future<List<Notion>> getGeneralsFor(String query);
}
