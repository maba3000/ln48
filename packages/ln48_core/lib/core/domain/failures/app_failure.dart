import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_failure.freezed.dart';

@freezed
class AppFailure with _$AppFailure implements Exception {
  const factory AppFailure.assetNotFound({
    required String assetPath,
  }) = _AssetNotFound;

  const factory AppFailure.invalidData({
    required String message,
  }) = _InvalidData;

  const factory AppFailure.database({
    required String message,
  }) = _Database;

  const factory AppFailure.unknown({
    required String message,
  }) = _Unknown;
}
