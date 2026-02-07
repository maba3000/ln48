import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ln48_core/core/data/models/word_item_model.dart';
import 'package:ln48_core/core/domain/entities/content_pack.dart';

part 'content_pack_model.freezed.dart';
part 'content_pack_model.g.dart';

@freezed
class ContentPackModel with _$ContentPackModel {
  const factory ContentPackModel({
    required String language,
    required String title,
    required List<WordItemModel> items,
  }) = _ContentPackModel;

  factory ContentPackModel.fromJson(Map<String, dynamic> json) =>
      _$ContentPackModelFromJson(json);
}

extension ContentPackModelMapper on ContentPackModel {
  ContentPack toEntity() {
    return ContentPack(
      language: language,
      title: title,
      items: items.map((item) => item.toEntity()).toList(),
    );
  }
}
