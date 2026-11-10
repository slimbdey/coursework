// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../infrastructure/dtos/word_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WordDto _$WordDtoFromJson(Map<String, dynamic> json) => _WordDto(
  id: (json['#'] as num?)?.toInt(),
  word: json['Word'] as String,
  ipa: json['IPA'] as String?,
  translation: json['Translation'] as String,
  addDate: json['Add Date'] as String,
  example: json['Example'] as String,
  answer: json['Answer'] as String,
  issue: json['Issue'] as String,
);

Map<String, dynamic> _$WordDtoToJson(_WordDto instance) => <String, dynamic>{
  '#': instance.id,
  'Word': instance.word,
  'IPA': instance.ipa,
  'Translation': instance.translation,
  'Add Date': instance.addDate,
  'Example': instance.example,
  'Answer': instance.answer,
  'Issue': instance.issue,
};
