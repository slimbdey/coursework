import 'package:coursework/domain/notion.dart';

abstract class NotionRepository {
  Future<List<Notion>> getIdiomsFor(String query);
}