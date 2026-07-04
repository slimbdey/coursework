class Word {
  final int? id;
  final String word;
  final String? ipa;
  final String translation;
  final String addDate;
  final String example;
  final String answer;
  final String issue;

  Word({
    required this.id,
    required this.word,
    this.ipa,
    required this.translation,
    required this.addDate,
    required this.example,
    required this.answer,
    required this.issue,
  });
}