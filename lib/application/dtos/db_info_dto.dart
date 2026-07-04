import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/application/dtos/db_info_dto.freezed.dart';
part '../../generated/application/dtos/db_info_dto.g.dart';

@freezed
abstract class DbInfoDto with _$DbInfoDto {
  const factory DbInfoDto({
    @JsonKey(name: 'Gerunds') required int gerunds,
    @JsonKey(name: 'Idioms') required int idioms,
    @JsonKey(name: 'Phrasals') required int phrasals,
    @JsonKey(name: 'Phrases') required int phrases,
    @JsonKey(name: 'Words') required int words,
  }) = _DbInfoDto;

  factory DbInfoDto.fromJson(Map<String, dynamic> json) =>
      _$DbInfoDtoFromJson(json);
}
