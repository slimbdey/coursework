import 'package:coursework/infrastructure/datasource.dart';
import 'package:coursework/application/infrastructure/word_repository.dart';
import 'package:coursework/domain/word.dart';
import 'package:coursework/infrastructure/mappers/word_dto_mapper.dart';

class NetworkWordRepository extends WordRepository {
  final Datasource datasource;

  NetworkWordRepository({required this.datasource});

  @override
  Future<List<Word>> searchWords(String query) async {
    final wordDtos = await datasource.getFor(query);
    return wordDtos.map((e) => e.toDomain()).toList();
  }

  @override
  Future<List<Word>> getSet(String login) async {
    final wordDtos = await datasource.getSetFor(login);
    return wordDtos.map((e) => e.toDomain()).toList();
  }
}
