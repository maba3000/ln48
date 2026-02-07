import 'package:ln48_core/core/domain/entities/content_pack.dart';
import 'package:ln48_core/core/domain/entities/word_item.dart';
import 'package:ln48_core/core/domain/repositories/content_repository.dart';
import 'package:ln48_core/core/domain/repositories/progress_repository.dart';
import 'package:ln48_core/core/domain/repositories/settings_repository.dart';

class InMemorySettingsRepository implements SettingsRepository {
  final Map<String, String> _store = {};

  @override
  Future<String?> getString(String key) async => _store[key];

  @override
  Future<void> setString(String key, String value) async {
    _store[key] = value;
  }
}

class NoopProgressRepository implements ProgressRepository {
  @override
  Future<void> clearAll() async {}

  @override
  Future<void> recordAttempt({
    required String gameId,
    required WordItem item,
    required int score,
  }) async {}
}

class SampleContentRepository implements ContentRepository {
  SampleContentRepository(
    this.items, {
    this.title = 'Basic',
  });

  final List<WordItem> items;
  final String title;

  @override
  Future<ContentPack> loadLevelPack(
    String languageCode,
    Set<String> levels,
  ) async {
    return ContentPack(
      language: languageCode,
      title: title,
      items: items,
    );
  }
}
