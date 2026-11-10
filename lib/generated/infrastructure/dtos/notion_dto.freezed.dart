// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../infrastructure/dtos/notion_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotionDto {

@JsonKey(name: '#') int? get id;@JsonKey(name: 'Issue') String get issue;@JsonKey(name: 'Answer') String get answer;
/// Create a copy of NotionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotionDtoCopyWith<NotionDto> get copyWith => _$NotionDtoCopyWithImpl<NotionDto>(this as NotionDto, _$identity);

  /// Serializes this NotionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.issue, issue) || other.issue == issue)&&(identical(other.answer, answer) || other.answer == answer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,issue,answer);

@override
String toString() {
  return 'NotionDto(id: $id, issue: $issue, answer: $answer)';
}


}

/// @nodoc
abstract mixin class $NotionDtoCopyWith<$Res>  {
  factory $NotionDtoCopyWith(NotionDto value, $Res Function(NotionDto) _then) = _$NotionDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '#') int? id,@JsonKey(name: 'Issue') String issue,@JsonKey(name: 'Answer') String answer
});




}
/// @nodoc
class _$NotionDtoCopyWithImpl<$Res>
    implements $NotionDtoCopyWith<$Res> {
  _$NotionDtoCopyWithImpl(this._self, this._then);

  final NotionDto _self;
  final $Res Function(NotionDto) _then;

/// Create a copy of NotionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? issue = null,Object? answer = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,issue: null == issue ? _self.issue : issue // ignore: cast_nullable_to_non_nullable
as String,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NotionDto].
extension NotionDtoPatterns on NotionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotionDto value)  $default,){
final _that = this;
switch (_that) {
case _NotionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotionDto value)?  $default,){
final _that = this;
switch (_that) {
case _NotionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '#')  int? id, @JsonKey(name: 'Issue')  String issue, @JsonKey(name: 'Answer')  String answer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotionDto() when $default != null:
return $default(_that.id,_that.issue,_that.answer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '#')  int? id, @JsonKey(name: 'Issue')  String issue, @JsonKey(name: 'Answer')  String answer)  $default,) {final _that = this;
switch (_that) {
case _NotionDto():
return $default(_that.id,_that.issue,_that.answer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '#')  int? id, @JsonKey(name: 'Issue')  String issue, @JsonKey(name: 'Answer')  String answer)?  $default,) {final _that = this;
switch (_that) {
case _NotionDto() when $default != null:
return $default(_that.id,_that.issue,_that.answer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotionDto implements NotionDto {
  const _NotionDto({@JsonKey(name: '#') this.id, @JsonKey(name: 'Issue') required this.issue, @JsonKey(name: 'Answer') required this.answer});
  factory _NotionDto.fromJson(Map<String, dynamic> json) => _$NotionDtoFromJson(json);

@override@JsonKey(name: '#') final  int? id;
@override@JsonKey(name: 'Issue') final  String issue;
@override@JsonKey(name: 'Answer') final  String answer;

/// Create a copy of NotionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotionDtoCopyWith<_NotionDto> get copyWith => __$NotionDtoCopyWithImpl<_NotionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.issue, issue) || other.issue == issue)&&(identical(other.answer, answer) || other.answer == answer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,issue,answer);

@override
String toString() {
  return 'NotionDto(id: $id, issue: $issue, answer: $answer)';
}


}

/// @nodoc
abstract mixin class _$NotionDtoCopyWith<$Res> implements $NotionDtoCopyWith<$Res> {
  factory _$NotionDtoCopyWith(_NotionDto value, $Res Function(_NotionDto) _then) = __$NotionDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '#') int? id,@JsonKey(name: 'Issue') String issue,@JsonKey(name: 'Answer') String answer
});




}
/// @nodoc
class __$NotionDtoCopyWithImpl<$Res>
    implements _$NotionDtoCopyWith<$Res> {
  __$NotionDtoCopyWithImpl(this._self, this._then);

  final _NotionDto _self;
  final $Res Function(_NotionDto) _then;

/// Create a copy of NotionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? issue = null,Object? answer = null,}) {
  return _then(_NotionDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,issue: null == issue ? _self.issue : issue // ignore: cast_nullable_to_non_nullable
as String,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
