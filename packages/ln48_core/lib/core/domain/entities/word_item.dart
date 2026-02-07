import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_item.freezed.dart';

@freezed
class WordItem with _$WordItem {
  const factory WordItem({
    required String id,
    required String term,
    required String translation,
    String? audioAsset,
    String? example,
    String? article,
    String? plural,
  }) = _WordItem;
}
