// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_pack_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContentPackModel _$ContentPackModelFromJson(Map<String, dynamic> json) {
  return _ContentPackModel.fromJson(json);
}

/// @nodoc
mixin _$ContentPackModel {
  String get language => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<WordItemModel> get items => throw _privateConstructorUsedError;

  /// Serializes this ContentPackModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContentPackModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentPackModelCopyWith<ContentPackModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentPackModelCopyWith<$Res> {
  factory $ContentPackModelCopyWith(
          ContentPackModel value, $Res Function(ContentPackModel) then) =
      _$ContentPackModelCopyWithImpl<$Res, ContentPackModel>;
  @useResult
  $Res call({String language, String title, List<WordItemModel> items});
}

/// @nodoc
class _$ContentPackModelCopyWithImpl<$Res, $Val extends ContentPackModel>
    implements $ContentPackModelCopyWith<$Res> {
  _$ContentPackModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentPackModel
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
              as List<WordItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentPackModelImplCopyWith<$Res>
    implements $ContentPackModelCopyWith<$Res> {
  factory _$$ContentPackModelImplCopyWith(_$ContentPackModelImpl value,
          $Res Function(_$ContentPackModelImpl) then) =
      __$$ContentPackModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String language, String title, List<WordItemModel> items});
}

/// @nodoc
class __$$ContentPackModelImplCopyWithImpl<$Res>
    extends _$ContentPackModelCopyWithImpl<$Res, _$ContentPackModelImpl>
    implements _$$ContentPackModelImplCopyWith<$Res> {
  __$$ContentPackModelImplCopyWithImpl(_$ContentPackModelImpl _value,
      $Res Function(_$ContentPackModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContentPackModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? title = null,
    Object? items = null,
  }) {
    return _then(_$ContentPackModelImpl(
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
              as List<WordItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentPackModelImpl implements _ContentPackModel {
  const _$ContentPackModelImpl(
      {required this.language,
      required this.title,
      required final List<WordItemModel> items})
      : _items = items;

  factory _$ContentPackModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentPackModelImplFromJson(json);

  @override
  final String language;
  @override
  final String title;
  final List<WordItemModel> _items;
  @override
  List<WordItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ContentPackModel(language: $language, title: $title, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentPackModelImpl &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, language, title,
      const DeepCollectionEquality().hash(_items));

  /// Create a copy of ContentPackModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentPackModelImplCopyWith<_$ContentPackModelImpl> get copyWith =>
      __$$ContentPackModelImplCopyWithImpl<_$ContentPackModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentPackModelImplToJson(
      this,
    );
  }
}

abstract class _ContentPackModel implements ContentPackModel {
  const factory _ContentPackModel(
      {required final String language,
      required final String title,
      required final List<WordItemModel> items}) = _$ContentPackModelImpl;

  factory _ContentPackModel.fromJson(Map<String, dynamic> json) =
      _$ContentPackModelImpl.fromJson;

  @override
  String get language;
  @override
  String get title;
  @override
  List<WordItemModel> get items;

  /// Create a copy of ContentPackModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentPackModelImplCopyWith<_$ContentPackModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
