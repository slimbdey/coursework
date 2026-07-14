import 'package:coursework/application/infrastructure/notion_repository.dart';
import 'package:coursework/domain/notion.dart';

class ShuffledNotionProvider {
  final NotionRepository repository;

  const ShuffledNotionProvider({required this.repository});

  Future<List<Notion>> getIdioms(String query) =>
      _getShuffled(repository.getIdiomsFor, query);

  Future<List<Notion>> getPhrases(String query) =>
      _getShuffled(repository.getPhrasesFor, query);

  Future<List<Notion>> getGerunds(String query) =>
      _getShuffled(repository.getGerundsFor, query);

  Future<List<Notion>> getGenerals(String query) =>
      _getShuffled(repository.getGeneralsFor, query);

  Future<List<Notion>> _getShuffled(
    Future<List<Notion>> Function(String) getNotionsFor,
    String query,
  ) async {
    final notions = await getNotionsFor(query);
    return List<Notion>.from(notions)..shuffle();
  }
}
