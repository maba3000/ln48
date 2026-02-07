// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WordItem {
  String get id => throw _privateConstructorUsedError;
  String get term => throw _privateConstructorUsedError;
  String get translation => throw _privateConstructorUsedError;
  String? get audioAsset => throw _privateConstructorUsedError;
  String? get example => throw _privateConstructorUsedError;
  String? get article => throw _privateConstructorUsedError;
  String? get plural => throw _privateConstructorUsedError;

  /// Create a copy of WordItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordItemCopyWith<WordItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordItemCopyWith<$Res> {
  factory $WordItemCopyWith(WordItem value, $Res Function(WordItem) then) =
      _$WordItemCopyWithImpl<$Res, WordItem>;
  @useResult
  $Res call(
      {String id,
      String term,
      String translation,
      String? audioAsset,
      String? example,
      String? article,
      String? plural});
}

/// @nodoc
class _$WordItemCopyWithImpl<$Res, $Val extends WordItem>
    implements $WordItemCopyWith<$Res> {
  _$WordItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? term = null,
    Object? translation = null,
    Object? audioAsset = freezed,
    Object? example = freezed,
    Object? article = freezed,
    Object? plural = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      term: null == term
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as String,
      translation: null == translation
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String,
      audioAsset: freezed == audioAsset
          ? _value.audioAsset
          : audioAsset // ignore: cast_nullable_to_non_nullable
              as String?,
      example: freezed == example
          ? _value.example
          : example // ignore: cast_nullable_to_non_nullable
              as String?,
      article: freezed == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as String?,
      plural: freezed == plural
          ? _value.plural
          : plural // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordItemImplCopyWith<$Res>
    implements $WordItemCopyWith<$Res> {
  factory _$$WordItemImplCopyWith(
          _$WordItemImpl value, $Res Function(_$WordItemImpl) then) =
      __$$WordItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String term,
      String translation,
      String? audioAsset,
      String? example,
      String? article,
      String? plural});
}

/// @nodoc
class __$$WordItemImplCopyWithImpl<$Res>
    extends _$WordItemCopyWithImpl<$Res, _$WordItemImpl>
    implements _$$WordItemImplCopyWith<$Res> {
  __$$WordItemImplCopyWithImpl(
      _$WordItemImpl _value, $Res Function(_$WordItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of WordItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? term = null,
    Object? translation = null,
    Object? audioAsset = freezed,
    Object? example = freezed,
    Object? article = freezed,
    Object? plural = freezed,
  }) {
    return _then(_$WordItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      term: null == term
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as String,
      translation: null == translation
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String,
      audioAsset: freezed == audioAsset
          ? _value.audioAsset
          : audioAsset // ignore: cast_nullable_to_non_nullable
              as String?,
      example: freezed == example
          ? _value.example
          : example // ignore: cast_nullable_to_non_nullable
              as String?,
      article: freezed == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as String?,
      plural: freezed == plural
          ? _value.plural
          : plural // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$WordItemImpl implements _WordItem {
  const _$WordItemImpl(
      {required this.id,
      required this.term,
      required this.translation,
      this.audioAsset,
      this.example,
      this.article,
      this.plural});

  @override
  final String id;
  @override
  final String term;
  @override
  final String translation;
  @override
  final String? audioAsset;
  @override
  final String? example;
  @override
  final String? article;
  @override
  final String? plural;

  @override
  String toString() {
    return 'WordItem(id: $id, term: $term, translation: $translation, audioAsset: $audioAsset, example: $example, article: $article, plural: $plural)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.term, term) || other.term == term) &&
            (identical(other.translation, translation) ||
                other.translation == translation) &&
            (identical(other.audioAsset, audioAsset) ||
                other.audioAsset == audioAsset) &&
            (identical(other.example, example) || other.example == example) &&
            (identical(other.article, article) || other.article == article) &&
            (identical(other.plural, plural) || other.plural == plural));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, term, translation, audioAsset, example, article, plural);

  /// Create a copy of WordItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordItemImplCopyWith<_$WordItemImpl> get copyWith =>
      __$$WordItemImplCopyWithImpl<_$WordItemImpl>(this, _$identity);
}

abstract class _WordItem implements WordItem {
  const factory _WordItem(
      {required final String id,
      required final String term,
      required final String translation,
      final String? audioAsset,
      final String? example,
      final String? article,
      final String? plural}) = _$WordItemImpl;

  @override
  String get id;
  @override
  String get term;
  @override
  String get translation;
  @override
  String? get audioAsset;
  @override
  String? get example;
  @override
  String? get article;
  @override
  String? get plural;

  /// Create a copy of WordItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordItemImplCopyWith<_$WordItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
