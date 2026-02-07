import 'package:flutter/foundation.dart';
import 'package:ln48_core/core/data/datasources/content_local_datasource.dart';
import 'package:ln48_core/core/domain/entities/content_pack.dart';
import 'package:ln48_core/core/domain/entities/word_item.dart';
import 'package:ln48_core/core/domain/failures/app_failure.dart';
import 'package:ln48_core/core/domain/repositories/content_repository.dart';

class ContentRepositoryImpl implements ContentRepository {
  ContentRepositoryImpl(this._datasource);

  final ContentLocalDatasource _datasource;
  final Map<String, ContentPack> _cache = {};
  static const List<String> _levelOrder = ['A1', 'A2', 'B1', 'B2'];

  @override
  Future<ContentPack> loadLevelPack(
    String languageCode,
    Set<String> levels,
  ) async {
    final normalizedLevels = _normalizeLevels(levels);
    final cacheKey = 'pool:$languageCode:${normalizedLevels.join(',')}';
    final cached = _cache[cacheKey];
    if (cached != null) return cached;

    final items = <WordItem>[];
    final missingAssets = <String>[];
    for (final level in normalizedLevels) {
      final assetPath =
          'assets/content/$languageCode/german_${level.toLowerCase()}.json';
      try {
        final entries = await _datasource.loadRawList(assetPath);
        items.addAll(_mapEntries(entries, level));
        // ignore: avoid_catching_errors
      } on FlutterError {
        missingAssets.add(assetPath);
      } on FormatException catch (error) {
        throw AppFailure.invalidData(message: error.message);
      }
    }

    if (missingAssets.isNotEmpty) {
      throw AppFailure.assetNotFound(assetPath: missingAssets.first);
    }

    if (items.isEmpty) {
      throw const AppFailure.invalidData(
        message: 'No vocabulary found for the selected levels.',
      );
    }

    final entity = ContentPack(
      language: languageCode,
      title: _poolTitle(normalizedLevels),
      items: items,
    );
    _cache[cacheKey] = entity;
    return entity;
  }
}

List<String> _normalizeLevels(Set<String> levels) {
  final normalized = levels.isEmpty
      ? <String>['A1']
      : levels.map((level) => level.toUpperCase()).toList();
  normalized.sort((a, b) {
    final ai = ContentRepositoryImpl._levelOrder.indexOf(a);
    final bi = ContentRepositoryImpl._levelOrder.indexOf(b);
    if (ai != -1 || bi != -1) {
      final aRank = ai == -1 ? 999 : ai;
      final bRank = bi == -1 ? 999 : bi;
      final byRank = aRank.compareTo(bRank);
      if (byRank != 0) return byRank;
    }
    return a.compareTo(b);
  });
  return normalized;
}

List<WordItem> _mapEntries(List<Map<String, dynamic>> entries, String level) {
  final items = <WordItem>[];
  final levelSlug = level.toLowerCase();
  var index = 0;
  for (final entry in entries) {
    final term = _stringOrNull(entry['word']) ?? _stringOrNull(entry['term']);
    final translation = _stringOrNull(entry['english_translation']) ??
        _stringOrNull(entry['translation']);
    if (term == null || translation == null) {
      continue;
    }

    index++;
    final idBase = _slug(term);
    final id = idBase.isEmpty
        ? 'item_${levelSlug}_$index'
        : '${idBase}_${levelSlug}_$index';

    final exampleNative = _stringOrNull(entry['example_sentence_native']) ??
        _stringOrNull(entry['example']);
    final exampleEnglish = _stringOrNull(entry['example_sentence_english']);
    final example = _buildExample(exampleNative, exampleEnglish);

    final article =
        _stringOrNull(entry['article']) ?? _articleFromGender(entry['gender']);
    final plural = _stringOrNull(entry['plural']);

    items.add(
      WordItem(
        id: id,
        term: term,
        translation: translation,
        example: example,
        article: article,
        plural: plural,
      ),
    );
  }
  return items;
}

String? _stringOrNull(Object? value) {
  if (value is String && value.trim().isNotEmpty) {
    return value.trim();
  }
  return null;
}

String? _buildExample(String? native, String? english) {
  if (native != null && english != null) {
    return '$native\n$english';
  }
  return native ?? english;
}

String? _articleFromGender(Object? genderValue) {
  final gender = _stringOrNull(genderValue)?.toLowerCase();
  if (gender == null) return null;
  if (gender.contains('masc')) return 'der';
  if (gender.contains('fem')) return 'die';
  if (gender.contains('neut')) return 'das';
  return null;
}

String _poolTitle(List<String> levels) {
  if (levels.isEmpty) return 'German';
  return 'German ${levels.join('+')}';
}

String _slug(String input) {
  final lower = input.toLowerCase();
  final slug = lower
      .replaceAll(RegExp('[^a-z0-9]+'), '_')
      .replaceAll(RegExp(r'^_+|_+$'), '')
      .replaceAll(RegExp('_+'), '_');
  return slug;
}
