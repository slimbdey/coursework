import 'package:coursework/application/dtos/word_dto.dart';
import 'package:coursework/domain/word.dart';

extension WordDtoMapper on WordDto {
  Word toDomain() => Word(
    id: id,
    word: word,
    ipa: ipa,
    translation: translation,
    addDate: addDate,
    example: example,
    answer: answer,
    issue: issue,
  );
}
