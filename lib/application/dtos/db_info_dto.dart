import 'package:freezed_annotation/freezed_annotation.dart';

part '../../_/application/dtos/db_info_dto.freezed.dart';
part '../../_/application/dtos/db_info_dto.g.dart';

@freezed
abstract class DbInfoDto with _$DbInfoDto {
  const factory DbInfoDto({
    required int gerunds,
    required int idioms,
    required int phrasals,
    required int phrases,
    required int words,
  }) = _DbInfoDto;

  factory DbInfoDto.fromJson(Map<String, dynamic> json) =>
      _$DbInfoDtoFromJson(json);
}
