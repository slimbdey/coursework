import 'package:coursework/application/infrastructure/notion_repository.dart';
import 'package:coursework/domain/notion.dart';

class GetShuffledIdioms {
  final NotionRepository repository;

  const GetShuffledIdioms({required this.repository});

  Future<List<Notion>> call(String query) async {
    final notions = await repository.getIdiomsFor(query);
    final shuffled = List<Notion>.from(notions)..shuffle();
    return shuffled;
  }
}
