import 'package:coursework/domain/word.dart';

abstract class SearchRepository {
  Future<List<Word>> searchWords(String query);
}