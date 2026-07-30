import 'package:coursework/domain/word.dart';

abstract class WordRepository {
  Future<List<Word>> searchWords(String query);
  Future<List<Word>> getSet(String login);
}