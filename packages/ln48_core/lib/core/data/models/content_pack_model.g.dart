// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_pack_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContentPackModelImpl _$$ContentPackModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ContentPackModelImpl(
      language: json['language'] as String,
      title: json['title'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => WordItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ContentPackModelImplToJson(
        _$ContentPackModelImpl instance) =>
    <String, dynamic>{
      'language': instance.language,
      'title': instance.title,
      'items': instance.items,
    };
