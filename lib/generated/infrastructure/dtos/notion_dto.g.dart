// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../infrastructure/dtos/notion_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotionDto _$NotionDtoFromJson(Map<String, dynamic> json) => _NotionDto(
  id: (json['#'] as num?)?.toInt(),
  issue: json['Issue'] as String,
  answer: json['Answer'] as String,
);

Map<String, dynamic> _$NotionDtoToJson(_NotionDto instance) =>
    <String, dynamic>{
      '#': instance.id,
      'Issue': instance.issue,
      'Answer': instance.answer,
    };
