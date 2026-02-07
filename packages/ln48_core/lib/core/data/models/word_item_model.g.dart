// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WordItemModelImpl _$$WordItemModelImplFromJson(Map<String, dynamic> json) =>
    _$WordItemModelImpl(
      id: json['id'] as String,
      term: json['term'] as String,
      translation: json['translation'] as String,
      audioAsset: json['audioAsset'] as String?,
      example: json['example'] as String?,
      article: json['article'] as String?,
      plural: json['plural'] as String?,
    );

Map<String, dynamic> _$$WordItemModelImplToJson(_$WordItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'term': instance.term,
      'translation': instance.translation,
      'audioAsset': instance.audioAsset,
      'example': instance.example,
      'article': instance.article,
      'plural': instance.plural,
    };
