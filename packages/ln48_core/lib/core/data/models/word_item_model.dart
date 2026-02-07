import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ln48_core/core/domain/entities/word_item.dart';

part 'word_item_model.freezed.dart';
part 'word_item_model.g.dart';

@freezed
class WordItemModel with _$WordItemModel {
  const factory WordItemModel({
    required String id,
    required String term,
    required String translation,
    String? audioAsset,
    String? example,
    String? article,
    String? plural,
  }) = _WordItemModel;

  factory WordItemModel.fromJson(Map<String, dynamic> json) =>
      _$WordItemModelFromJson(json);
}

extension WordItemModelMapper on WordItemModel {
  WordItem toEntity() {
    return WordItem(
      id: id,
      term: term,
      translation: translation,
      audioAsset: audioAsset,
      example: example,
      article: article,
      plural: plural,
    );
  }
}
