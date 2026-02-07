import 'package:drift/drift.dart';
import 'package:ln48_core/core/data/db/app_db.dart';
import 'package:ln48_core/core/domain/entities/word_item.dart';
import 'package:ln48_core/core/domain/repositories/progress_repository.dart';

class ProgressRepositoryImpl implements ProgressRepository {
  ProgressRepositoryImpl(this._db);

  final AppDatabase _db;

  @override
  Future<void> recordAttempt({
    required String gameId,
    required WordItem item,
    required int score,
  }) async {
    await _db.into(_db.progressEntries).insert(
          ProgressEntriesCompanion.insert(
            gameId: gameId,
            itemId: item.id,
            score: Value(score),
            lastPlayed: DateTime.now(),
          ),
        );
  }

  @override
  Future<void> clearAll() async {
    await _db.delete(_db.progressEntries).go();
  }
}
