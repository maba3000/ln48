import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:ln48_core/core/data/models/content_pack_model.dart';

class ContentLocalDatasource {
  Future<ContentPackModel> loadPack(String assetPath) async {
    final raw = await rootBundle.loadString(assetPath);
    return compute(_decodeContentPack, raw);
  }

  Future<List<Map<String, dynamic>>> loadRawList(String assetPath) async {
    final raw = await rootBundle.loadString(assetPath);
    return compute(_decodeRawList, raw);
  }
}

ContentPackModel _decodeContentPack(String raw) {
  final json = jsonDecode(raw) as Map<String, dynamic>;
  return ContentPackModel.fromJson(json);
}

List<Map<String, dynamic>> _decodeRawList(String raw) {
  final json = jsonDecode(raw);
  if (json is! List) {
    throw const FormatException('Expected a JSON array.');
  }
  return json
      .whereType<Map<Object?, Object?>>()
      .map((entry) => entry.cast<String, dynamic>())
      .toList();
}
