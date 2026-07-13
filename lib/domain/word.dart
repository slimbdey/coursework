import 'package:coursework/domain/notion.dart';

class Word extends Notion {
  final String word;
  final String? ipa;
  final String translation;
  final String addDate;
  final String example;

  Word({
    required this.word,
    this.ipa,
    required this.translation,
    required this.addDate,
    required this.example,
    required super.id,
    required super.issue,
    required super.answer,
  });
}
