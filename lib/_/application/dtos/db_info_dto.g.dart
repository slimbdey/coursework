// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../application/dtos/db_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DbInfoDto _$DbInfoDtoFromJson(Map<String, dynamic> json) => _DbInfoDto(
  gerunds: (json['Gerunds'] as num).toInt(),
  idioms: (json['Idioms'] as num).toInt(),
  phrasals: (json['Phrasals'] as num).toInt(),
  phrases: (json['Phrases'] as num).toInt(),
  words: (json['Words'] as num).toInt(),
);

Map<String, dynamic> _$DbInfoDtoToJson(_DbInfoDto instance) =>
    <String, dynamic>{
      'Gerunds': instance.gerunds,
      'Idioms': instance.idioms,
      'Phrasals': instance.phrasals,
      'Phrases': instance.phrases,
      'Words': instance.words,
    };
