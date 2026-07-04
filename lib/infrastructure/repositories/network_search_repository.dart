import 'package:coursework/application/common/datasource.dart';
import 'package:coursework/application/infrastructure/search_repository.dart';
import 'package:coursework/domain/word.dart';

class NetworkSearchRepository extends SearchRepository {
  final Datasource datasource;

  NetworkSearchRepository({required this.datasource});

  @override
  Future<List<Word>> searchWords(String query) async {
    final wordDtos = await datasource.getFor(query);

    return wordDtos
        .map(
          (e) => Word(
            id: e.id,
            word: e.word,
            ipa: e.ipa,
            translation: e.translation,
            addDate: e.addDate,
            example: e.example,
            answer: e.answer,
            issue: e.issue,
          ),
        )
        .toList();
  }
}
