// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_pack.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ContentPack {
  String get language => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<WordItem> get items => throw _privateConstructorUsedError;

  /// Create a copy of ContentPack
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentPackCopyWith<ContentPack> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentPackCopyWith<$Res> {
  factory $ContentPackCopyWith(
          ContentPack value, $Res Function(ContentPack) then) =
      _$ContentPackCopyWithImpl<$Res, ContentPack>;
  @useResult
  $Res call({String language, String title, List<WordItem> items});
}

/// @nodoc
class _$ContentPackCopyWithImpl<$Res, $Val extends ContentPack>
    implements $ContentPackCopyWith<$Res> {
  _$ContentPackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentPack
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? title = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<WordItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentPackImplCopyWith<$Res>
    implements $ContentPackCopyWith<$Res> {
  factory _$$ContentPackImplCopyWith(
          _$ContentPackImpl value, $Res Function(_$ContentPackImpl) then) =
      __$$ContentPackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String language, String title, List<WordItem> items});
}

/// @nodoc
class __$$ContentPackImplCopyWithImpl<$Res>
    extends _$ContentPackCopyWithImpl<$Res, _$ContentPackImpl>
    implements _$$ContentPackImplCopyWith<$Res> {
  __$$ContentPackImplCopyWithImpl(
      _$ContentPackImpl _value, $Res Function(_$ContentPackImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContentPack
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? title = null,
    Object? items = null,
  }) {
    return _then(_$ContentPackImpl(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<WordItem>,
    ));
  }
}

/// @nodoc

class _$ContentPackImpl implements _ContentPack {
  const _$ContentPackImpl(
      {required this.language,
      required this.title,
      required final List<WordItem> items})
      : _items = items;

  @override
  final String language;
  @override
  final String title;
  final List<WordItem> _items;
  @override
  List<WordItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ContentPack(language: $language, title: $title, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentPackImpl &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language, title,
      const DeepCollectionEquality().hash(_items));

  /// Create a copy of ContentPack
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentPackImplCopyWith<_$ContentPackImpl> get copyWith =>
      __$$ContentPackImplCopyWithImpl<_$ContentPackImpl>(this, _$identity);
}

abstract class _ContentPack implements ContentPack {
  const factory _ContentPack(
      {required final String language,
      required final String title,
      required final List<WordItem> items}) = _$ContentPackImpl;

  @override
  String get language;
  @override
  String get title;
  @override
  List<WordItem> get items;

  /// Create a copy of ContentPack
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentPackImplCopyWith<_$ContentPackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
