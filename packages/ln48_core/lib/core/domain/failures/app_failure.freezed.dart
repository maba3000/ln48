// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String assetPath) assetNotFound,
    required TResult Function(String message) invalidData,
    required TResult Function(String message) database,
    required TResult Function(String message) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String assetPath)? assetNotFound,
    TResult? Function(String message)? invalidData,
    TResult? Function(String message)? database,
    TResult? Function(String message)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String assetPath)? assetNotFound,
    TResult Function(String message)? invalidData,
    TResult Function(String message)? database,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AssetNotFound value) assetNotFound,
    required TResult Function(_InvalidData value) invalidData,
    required TResult Function(_Database value) database,
    required TResult Function(_Unknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AssetNotFound value)? assetNotFound,
    TResult? Function(_InvalidData value)? invalidData,
    TResult? Function(_Database value)? database,
    TResult? Function(_Unknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AssetNotFound value)? assetNotFound,
    TResult Function(_InvalidData value)? invalidData,
    TResult Function(_Database value)? database,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppFailureCopyWith<$Res> {
  factory $AppFailureCopyWith(
          AppFailure value, $Res Function(AppFailure) then) =
      _$AppFailureCopyWithImpl<$Res, AppFailure>;
}

/// @nodoc
class _$AppFailureCopyWithImpl<$Res, $Val extends AppFailure>
    implements $AppFailureCopyWith<$Res> {
  _$AppFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AssetNotFoundImplCopyWith<$Res> {
  factory _$$AssetNotFoundImplCopyWith(
          _$AssetNotFoundImpl value, $Res Function(_$AssetNotFoundImpl) then) =
      __$$AssetNotFoundImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String assetPath});
}

/// @nodoc
class __$$AssetNotFoundImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$AssetNotFoundImpl>
    implements _$$AssetNotFoundImplCopyWith<$Res> {
  __$$AssetNotFoundImplCopyWithImpl(
      _$AssetNotFoundImpl _value, $Res Function(_$AssetNotFoundImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetPath = null,
  }) {
    return _then(_$AssetNotFoundImpl(
      assetPath: null == assetPath
          ? _value.assetPath
          : assetPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AssetNotFoundImpl implements _AssetNotFound {
  const _$AssetNotFoundImpl({required this.assetPath});

  @override
  final String assetPath;

  @override
  String toString() {
    return 'AppFailure.assetNotFound(assetPath: $assetPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetNotFoundImpl &&
            (identical(other.assetPath, assetPath) ||
                other.assetPath == assetPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, assetPath);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetNotFoundImplCopyWith<_$AssetNotFoundImpl> get copyWith =>
      __$$AssetNotFoundImplCopyWithImpl<_$AssetNotFoundImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String assetPath) assetNotFound,
    required TResult Function(String message) invalidData,
    required TResult Function(String message) database,
    required TResult Function(String message) unknown,
  }) {
    return assetNotFound(assetPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String assetPath)? assetNotFound,
    TResult? Function(String message)? invalidData,
    TResult? Function(String message)? database,
    TResult? Function(String message)? unknown,
  }) {
    return assetNotFound?.call(assetPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String assetPath)? assetNotFound,
    TResult Function(String message)? invalidData,
    TResult Function(String message)? database,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (assetNotFound != null) {
      return assetNotFound(assetPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AssetNotFound value) assetNotFound,
    required TResult Function(_InvalidData value) invalidData,
    required TResult Function(_Database value) database,
    required TResult Function(_Unknown value) unknown,
  }) {
    return assetNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AssetNotFound value)? assetNotFound,
    TResult? Function(_InvalidData value)? invalidData,
    TResult? Function(_Database value)? database,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return assetNotFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AssetNotFound value)? assetNotFound,
    TResult Function(_InvalidData value)? invalidData,
    TResult Function(_Database value)? database,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (assetNotFound != null) {
      return assetNotFound(this);
    }
    return orElse();
  }
}

abstract class _AssetNotFound implements AppFailure {
  const factory _AssetNotFound({required final String assetPath}) =
      _$AssetNotFoundImpl;

  String get assetPath;

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssetNotFoundImplCopyWith<_$AssetNotFoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidDataImplCopyWith<$Res> {
  factory _$$InvalidDataImplCopyWith(
          _$InvalidDataImpl value, $Res Function(_$InvalidDataImpl) then) =
      __$$InvalidDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$InvalidDataImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$InvalidDataImpl>
    implements _$$InvalidDataImplCopyWith<$Res> {
  __$$InvalidDataImplCopyWithImpl(
      _$InvalidDataImpl _value, $Res Function(_$InvalidDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$InvalidDataImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InvalidDataImpl implements _InvalidData {
  const _$InvalidDataImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'AppFailure.invalidData(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidDataImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidDataImplCopyWith<_$InvalidDataImpl> get copyWith =>
      __$$InvalidDataImplCopyWithImpl<_$InvalidDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String assetPath) assetNotFound,
    required TResult Function(String message) invalidData,
    required TResult Function(String message) database,
    required TResult Function(String message) unknown,
  }) {
    return invalidData(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String assetPath)? assetNotFound,
    TResult? Function(String message)? invalidData,
    TResult? Function(String message)? database,
    TResult? Function(String message)? unknown,
  }) {
    return invalidData?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String assetPath)? assetNotFound,
    TResult Function(String message)? invalidData,
    TResult Function(String message)? database,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (invalidData != null) {
      return invalidData(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AssetNotFound value) assetNotFound,
    required TResult Function(_InvalidData value) invalidData,
    required TResult Function(_Database value) database,
    required TResult Function(_Unknown value) unknown,
  }) {
    return invalidData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AssetNotFound value)? assetNotFound,
    TResult? Function(_InvalidData value)? invalidData,
    TResult? Function(_Database value)? database,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return invalidData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AssetNotFound value)? assetNotFound,
    TResult Function(_InvalidData value)? invalidData,
    TResult Function(_Database value)? database,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (invalidData != null) {
      return invalidData(this);
    }
    return orElse();
  }
}

abstract class _InvalidData implements AppFailure {
  const factory _InvalidData({required final String message}) =
      _$InvalidDataImpl;

  String get message;

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvalidDataImplCopyWith<_$InvalidDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DatabaseImplCopyWith<$Res> {
  factory _$$DatabaseImplCopyWith(
          _$DatabaseImpl value, $Res Function(_$DatabaseImpl) then) =
      __$$DatabaseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$DatabaseImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$DatabaseImpl>
    implements _$$DatabaseImplCopyWith<$Res> {
  __$$DatabaseImplCopyWithImpl(
      _$DatabaseImpl _value, $Res Function(_$DatabaseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$DatabaseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DatabaseImpl implements _Database {
  const _$DatabaseImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'AppFailure.database(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatabaseImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DatabaseImplCopyWith<_$DatabaseImpl> get copyWith =>
      __$$DatabaseImplCopyWithImpl<_$DatabaseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String assetPath) assetNotFound,
    required TResult Function(String message) invalidData,
    required TResult Function(String message) database,
    required TResult Function(String message) unknown,
  }) {
    return database(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String assetPath)? assetNotFound,
    TResult? Function(String message)? invalidData,
    TResult? Function(String message)? database,
    TResult? Function(String message)? unknown,
  }) {
    return database?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String assetPath)? assetNotFound,
    TResult Function(String message)? invalidData,
    TResult Function(String message)? database,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (database != null) {
      return database(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AssetNotFound value) assetNotFound,
    required TResult Function(_InvalidData value) invalidData,
    required TResult Function(_Database value) database,
    required TResult Function(_Unknown value) unknown,
  }) {
    return database(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AssetNotFound value)? assetNotFound,
    TResult? Function(_InvalidData value)? invalidData,
    TResult? Function(_Database value)? database,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return database?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AssetNotFound value)? assetNotFound,
    TResult Function(_InvalidData value)? invalidData,
    TResult Function(_Database value)? database,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (database != null) {
      return database(this);
    }
    return orElse();
  }
}

abstract class _Database implements AppFailure {
  const factory _Database({required final String message}) = _$DatabaseImpl;

  String get message;

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DatabaseImplCopyWith<_$DatabaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownImplCopyWith<$Res> {
  factory _$$UnknownImplCopyWith(
          _$UnknownImpl value, $Res Function(_$UnknownImpl) then) =
      __$$UnknownImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnknownImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$UnknownImpl>
    implements _$$UnknownImplCopyWith<$Res> {
  __$$UnknownImplCopyWithImpl(
      _$UnknownImpl _value, $Res Function(_$UnknownImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnknownImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnknownImpl implements _Unknown {
  const _$UnknownImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'AppFailure.unknown(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownImplCopyWith<_$UnknownImpl> get copyWith =>
      __$$UnknownImplCopyWithImpl<_$UnknownImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String assetPath) assetNotFound,
    required TResult Function(String message) invalidData,
    required TResult Function(String message) database,
    required TResult Function(String message) unknown,
  }) {
    return unknown(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String assetPath)? assetNotFound,
    TResult? Function(String message)? invalidData,
    TResult? Function(String message)? database,
    TResult? Function(String message)? unknown,
  }) {
    return unknown?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String assetPath)? assetNotFound,
    TResult Function(String message)? invalidData,
    TResult Function(String message)? database,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AssetNotFound value) assetNotFound,
    required TResult Function(_InvalidData value) invalidData,
    required TResult Function(_Database value) database,
    required TResult Function(_Unknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AssetNotFound value)? assetNotFound,
    TResult? Function(_InvalidData value)? invalidData,
    TResult? Function(_Database value)? database,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AssetNotFound value)? assetNotFound,
    TResult Function(_InvalidData value)? invalidData,
    TResult Function(_Database value)? database,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _Unknown implements AppFailure {
  const factory _Unknown({required final String message}) = _$UnknownImpl;

  String get message;

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownImplCopyWith<_$UnknownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
