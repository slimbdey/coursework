// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../application/dtos/db_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DbInfoDto {

@JsonKey(name: 'Gerunds') int get gerunds;@JsonKey(name: 'Idioms') int get idioms;@JsonKey(name: 'Phrasals') int get phrasals;@JsonKey(name: 'Phrases') int get phrases;@JsonKey(name: 'Words') int get words;
/// Create a copy of DbInfoDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DbInfoDtoCopyWith<DbInfoDto> get copyWith => _$DbInfoDtoCopyWithImpl<DbInfoDto>(this as DbInfoDto, _$identity);

  /// Serializes this DbInfoDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DbInfoDto&&(identical(other.gerunds, gerunds) || other.gerunds == gerunds)&&(identical(other.idioms, idioms) || other.idioms == idioms)&&(identical(other.phrasals, phrasals) || other.phrasals == phrasals)&&(identical(other.phrases, phrases) || other.phrases == phrases)&&(identical(other.words, words) || other.words == words));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gerunds,idioms,phrasals,phrases,words);

@override
String toString() {
  return 'DbInfoDto(gerunds: $gerunds, idioms: $idioms, phrasals: $phrasals, phrases: $phrases, words: $words)';
}


}

/// @nodoc
abstract mixin class $DbInfoDtoCopyWith<$Res>  {
  factory $DbInfoDtoCopyWith(DbInfoDto value, $Res Function(DbInfoDto) _then) = _$DbInfoDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Gerunds') int gerunds,@JsonKey(name: 'Idioms') int idioms,@JsonKey(name: 'Phrasals') int phrasals,@JsonKey(name: 'Phrases') int phrases,@JsonKey(name: 'Words') int words
});




}
/// @nodoc
class _$DbInfoDtoCopyWithImpl<$Res>
    implements $DbInfoDtoCopyWith<$Res> {
  _$DbInfoDtoCopyWithImpl(this._self, this._then);

  final DbInfoDto _self;
  final $Res Function(DbInfoDto) _then;

/// Create a copy of DbInfoDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gerunds = null,Object? idioms = null,Object? phrasals = null,Object? phrases = null,Object? words = null,}) {
  return _then(_self.copyWith(
gerunds: null == gerunds ? _self.gerunds : gerunds // ignore: cast_nullable_to_non_nullable
as int,idioms: null == idioms ? _self.idioms : idioms // ignore: cast_nullable_to_non_nullable
as int,phrasals: null == phrasals ? _self.phrasals : phrasals // ignore: cast_nullable_to_non_nullable
as int,phrases: null == phrases ? _self.phrases : phrases // ignore: cast_nullable_to_non_nullable
as int,words: null == words ? _self.words : words // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DbInfoDto].
extension DbInfoDtoPatterns on DbInfoDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DbInfoDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DbInfoDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DbInfoDto value)  $default,){
final _that = this;
switch (_that) {
case _DbInfoDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DbInfoDto value)?  $default,){
final _that = this;
switch (_that) {
case _DbInfoDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Gerunds')  int gerunds, @JsonKey(name: 'Idioms')  int idioms, @JsonKey(name: 'Phrasals')  int phrasals, @JsonKey(name: 'Phrases')  int phrases, @JsonKey(name: 'Words')  int words)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DbInfoDto() when $default != null:
return $default(_that.gerunds,_that.idioms,_that.phrasals,_that.phrases,_that.words);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Gerunds')  int gerunds, @JsonKey(name: 'Idioms')  int idioms, @JsonKey(name: 'Phrasals')  int phrasals, @JsonKey(name: 'Phrases')  int phrases, @JsonKey(name: 'Words')  int words)  $default,) {final _that = this;
switch (_that) {
case _DbInfoDto():
return $default(_that.gerunds,_that.idioms,_that.phrasals,_that.phrases,_that.words);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Gerunds')  int gerunds, @JsonKey(name: 'Idioms')  int idioms, @JsonKey(name: 'Phrasals')  int phrasals, @JsonKey(name: 'Phrases')  int phrases, @JsonKey(name: 'Words')  int words)?  $default,) {final _that = this;
switch (_that) {
case _DbInfoDto() when $default != null:
return $default(_that.gerunds,_that.idioms,_that.phrasals,_that.phrases,_that.words);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DbInfoDto implements DbInfoDto {
  const _DbInfoDto({@JsonKey(name: 'Gerunds') required this.gerunds, @JsonKey(name: 'Idioms') required this.idioms, @JsonKey(name: 'Phrasals') required this.phrasals, @JsonKey(name: 'Phrases') required this.phrases, @JsonKey(name: 'Words') required this.words});
  factory _DbInfoDto.fromJson(Map<String, dynamic> json) => _$DbInfoDtoFromJson(json);

@override@JsonKey(name: 'Gerunds') final  int gerunds;
@override@JsonKey(name: 'Idioms') final  int idioms;
@override@JsonKey(name: 'Phrasals') final  int phrasals;
@override@JsonKey(name: 'Phrases') final  int phrases;
@override@JsonKey(name: 'Words') final  int words;

/// Create a copy of DbInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DbInfoDtoCopyWith<_DbInfoDto> get copyWith => __$DbInfoDtoCopyWithImpl<_DbInfoDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DbInfoDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DbInfoDto&&(identical(other.gerunds, gerunds) || other.gerunds == gerunds)&&(identical(other.idioms, idioms) || other.idioms == idioms)&&(identical(other.phrasals, phrasals) || other.phrasals == phrasals)&&(identical(other.phrases, phrases) || other.phrases == phrases)&&(identical(other.words, words) || other.words == words));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gerunds,idioms,phrasals,phrases,words);

@override
String toString() {
  return 'DbInfoDto(gerunds: $gerunds, idioms: $idioms, phrasals: $phrasals, phrases: $phrases, words: $words)';
}


}

/// @nodoc
abstract mixin class _$DbInfoDtoCopyWith<$Res> implements $DbInfoDtoCopyWith<$Res> {
  factory _$DbInfoDtoCopyWith(_DbInfoDto value, $Res Function(_DbInfoDto) _then) = __$DbInfoDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Gerunds') int gerunds,@JsonKey(name: 'Idioms') int idioms,@JsonKey(name: 'Phrasals') int phrasals,@JsonKey(name: 'Phrases') int phrases,@JsonKey(name: 'Words') int words
});




}
/// @nodoc
class __$DbInfoDtoCopyWithImpl<$Res>
    implements _$DbInfoDtoCopyWith<$Res> {
  __$DbInfoDtoCopyWithImpl(this._self, this._then);

  final _DbInfoDto _self;
  final $Res Function(_DbInfoDto) _then;

/// Create a copy of DbInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gerunds = null,Object? idioms = null,Object? phrasals = null,Object? phrases = null,Object? words = null,}) {
  return _then(_DbInfoDto(
gerunds: null == gerunds ? _self.gerunds : gerunds // ignore: cast_nullable_to_non_nullable
as int,idioms: null == idioms ? _self.idioms : idioms // ignore: cast_nullable_to_non_nullable
as int,phrasals: null == phrasals ? _self.phrasals : phrasals // ignore: cast_nullable_to_non_nullable
as int,phrases: null == phrases ? _self.phrases : phrases // ignore: cast_nullable_to_non_nullable
as int,words: null == words ? _self.words : words // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
