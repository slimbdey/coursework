import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/infrastructure/dtos/notion_dto.freezed.dart';
part '../../generated/infrastructure/dtos/notion_dto.g.dart';

@freezed
abstract class NotionDto with _$NotionDto {
  const factory NotionDto({
    @JsonKey(name: '#') int? id,
    @JsonKey(name: 'Issue') required String issue,
    @JsonKey(name: 'Answer') required String answer,
  }) = _NotionDto;

  factory NotionDto.fromJson(Map<String, dynamic> json) =>
      _$NotionDtoFromJson(json);
}
