import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ln48_core/core/domain/entities/word_item.dart';

part 'content_pack.freezed.dart';

@freezed
class ContentPack with _$ContentPack {
  const factory ContentPack({
    required String language,
    required String title,
    required List<WordItem> items,
  }) = _ContentPack;
}
