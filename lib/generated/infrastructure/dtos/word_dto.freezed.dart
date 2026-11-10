// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../infrastructure/dtos/word_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WordDto {

@JsonKey(name: '#') int? get id;@JsonKey(name: 'Word') String get word;@JsonKey(name: 'IPA') String? get ipa;@JsonKey(name: 'Translation') String get translation;@JsonKey(name: 'Add Date') String get addDate;@JsonKey(name: 'Example') String get example;@JsonKey(name: 'Answer') String get answer;@JsonKey(name: 'Issue') String get issue;
/// Create a copy of WordDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WordDtoCopyWith<WordDto> get copyWith => _$WordDtoCopyWithImpl<WordDto>(this as WordDto, _$identity);

  /// Serializes this WordDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WordDto&&(identical(other.id, id) || other.id == id)&&(identical(other.word, word) || other.word == word)&&(identical(other.ipa, ipa) || other.ipa == ipa)&&(identical(other.translation, translation) || other.translation == translation)&&(identical(other.addDate, addDate) || other.addDate == addDate)&&(identical(other.example, example) || other.example == example)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.issue, issue) || other.issue == issue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,word,ipa,translation,addDate,example,answer,issue);

@override
String toString() {
  return 'WordDto(id: $id, word: $word, ipa: $ipa, translation: $translation, addDate: $addDate, example: $example, answer: $answer, issue: $issue)';
}


}

/// @nodoc
abstract mixin class $WordDtoCopyWith<$Res>  {
  factory $WordDtoCopyWith(WordDto value, $Res Function(WordDto) _then) = _$WordDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '#') int? id,@JsonKey(name: 'Word') String word,@JsonKey(name: 'IPA') String? ipa,@JsonKey(name: 'Translation') String translation,@JsonKey(name: 'Add Date') String addDate,@JsonKey(name: 'Example') String example,@JsonKey(name: 'Answer') String answer,@JsonKey(name: 'Issue') String issue
});




}
/// @nodoc
class _$WordDtoCopyWithImpl<$Res>
    implements $WordDtoCopyWith<$Res> {
  _$WordDtoCopyWithImpl(this._self, this._then);

  final WordDto _self;
  final $Res Function(WordDto) _then;

/// Create a copy of WordDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? word = null,Object? ipa = freezed,Object? translation = null,Object? addDate = null,Object? example = null,Object? answer = null,Object? issue = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,ipa: freezed == ipa ? _self.ipa : ipa // ignore: cast_nullable_to_non_nullable
as String?,translation: null == translation ? _self.translation : translation // ignore: cast_nullable_to_non_nullable
as String,addDate: null == addDate ? _self.addDate : addDate // ignore: cast_nullable_to_non_nullable
as String,example: null == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as String,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,issue: null == issue ? _self.issue : issue // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WordDto].
extension WordDtoPatterns on WordDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WordDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WordDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WordDto value)  $default,){
final _that = this;
switch (_that) {
case _WordDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WordDto value)?  $default,){
final _that = this;
switch (_that) {
case _WordDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '#')  int? id, @JsonKey(name: 'Word')  String word, @JsonKey(name: 'IPA')  String? ipa, @JsonKey(name: 'Translation')  String translation, @JsonKey(name: 'Add Date')  String addDate, @JsonKey(name: 'Example')  String example, @JsonKey(name: 'Answer')  String answer, @JsonKey(name: 'Issue')  String issue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WordDto() when $default != null:
return $default(_that.id,_that.word,_that.ipa,_that.translation,_that.addDate,_that.example,_that.answer,_that.issue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '#')  int? id, @JsonKey(name: 'Word')  String word, @JsonKey(name: 'IPA')  String? ipa, @JsonKey(name: 'Translation')  String translation, @JsonKey(name: 'Add Date')  String addDate, @JsonKey(name: 'Example')  String example, @JsonKey(name: 'Answer')  String answer, @JsonKey(name: 'Issue')  String issue)  $default,) {final _that = this;
switch (_that) {
case _WordDto():
return $default(_that.id,_that.word,_that.ipa,_that.translation,_that.addDate,_that.example,_that.answer,_that.issue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '#')  int? id, @JsonKey(name: 'Word')  String word, @JsonKey(name: 'IPA')  String? ipa, @JsonKey(name: 'Translation')  String translation, @JsonKey(name: 'Add Date')  String addDate, @JsonKey(name: 'Example')  String example, @JsonKey(name: 'Answer')  String answer, @JsonKey(name: 'Issue')  String issue)?  $default,) {final _that = this;
switch (_that) {
case _WordDto() when $default != null:
return $default(_that.id,_that.word,_that.ipa,_that.translation,_that.addDate,_that.example,_that.answer,_that.issue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WordDto implements WordDto {
  const _WordDto({@JsonKey(name: '#') this.id, @JsonKey(name: 'Word') required this.word, @JsonKey(name: 'IPA') this.ipa, @JsonKey(name: 'Translation') required this.translation, @JsonKey(name: 'Add Date') required this.addDate, @JsonKey(name: 'Example') required this.example, @JsonKey(name: 'Answer') required this.answer, @JsonKey(name: 'Issue') required this.issue});
  factory _WordDto.fromJson(Map<String, dynamic> json) => _$WordDtoFromJson(json);

@override@JsonKey(name: '#') final  int? id;
@override@JsonKey(name: 'Word') final  String word;
@override@JsonKey(name: 'IPA') final  String? ipa;
@override@JsonKey(name: 'Translation') final  String translation;
@override@JsonKey(name: 'Add Date') final  String addDate;
@override@JsonKey(name: 'Example') final  String example;
@override@JsonKey(name: 'Answer') final  String answer;
@override@JsonKey(name: 'Issue') final  String issue;

/// Create a copy of WordDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WordDtoCopyWith<_WordDto> get copyWith => __$WordDtoCopyWithImpl<_WordDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WordDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WordDto&&(identical(other.id, id) || other.id == id)&&(identical(other.word, word) || other.word == word)&&(identical(other.ipa, ipa) || other.ipa == ipa)&&(identical(other.translation, translation) || other.translation == translation)&&(identical(other.addDate, addDate) || other.addDate == addDate)&&(identical(other.example, example) || other.example == example)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.issue, issue) || other.issue == issue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,word,ipa,translation,addDate,example,answer,issue);

@override
String toString() {
  return 'WordDto(id: $id, word: $word, ipa: $ipa, translation: $translation, addDate: $addDate, example: $example, answer: $answer, issue: $issue)';
}


}

/// @nodoc
abstract mixin class _$WordDtoCopyWith<$Res> implements $WordDtoCopyWith<$Res> {
  factory _$WordDtoCopyWith(_WordDto value, $Res Function(_WordDto) _then) = __$WordDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '#') int? id,@JsonKey(name: 'Word') String word,@JsonKey(name: 'IPA') String? ipa,@JsonKey(name: 'Translation') String translation,@JsonKey(name: 'Add Date') String addDate,@JsonKey(name: 'Example') String example,@JsonKey(name: 'Answer') String answer,@JsonKey(name: 'Issue') String issue
});




}
/// @nodoc
class __$WordDtoCopyWithImpl<$Res>
    implements _$WordDtoCopyWith<$Res> {
  __$WordDtoCopyWithImpl(this._self, this._then);

  final _WordDto _self;
  final $Res Function(_WordDto) _then;

/// Create a copy of WordDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? word = null,Object? ipa = freezed,Object? translation = null,Object? addDate = null,Object? example = null,Object? answer = null,Object? issue = null,}) {
  return _then(_WordDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,ipa: freezed == ipa ? _self.ipa : ipa // ignore: cast_nullable_to_non_nullable
as String?,translation: null == translation ? _self.translation : translation // ignore: cast_nullable_to_non_nullable
as String,addDate: null == addDate ? _self.addDate : addDate // ignore: cast_nullable_to_non_nullable
as String,example: null == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as String,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,issue: null == issue ? _self.issue : issue // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
