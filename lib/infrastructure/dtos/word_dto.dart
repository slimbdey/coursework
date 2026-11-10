import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/infrastructure/dtos/word_dto.freezed.dart';
part '../../generated/infrastructure/dtos/word_dto.g.dart';

@freezed
abstract class WordDto with _$WordDto {
  const factory WordDto({
    @JsonKey(name: '#') int? id,
    @JsonKey(name: 'Word') required String word,
    @JsonKey(name: 'IPA') String? ipa,
    @JsonKey(name: 'Translation') required String translation,
    @JsonKey(name: 'Add Date') required String addDate,
    @JsonKey(name: 'Example') required String example,
    @JsonKey(name: 'Answer') required String answer,
    @JsonKey(name: 'Issue') required String issue,
  }) = _WordDto;

  factory WordDto.fromJson(Map<String, dynamic> json) =>
      _$WordDtoFromJson(json);
}
