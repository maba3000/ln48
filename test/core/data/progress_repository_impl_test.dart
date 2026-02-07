import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ln48_core/core/data/db/app_db.dart';
import 'package:ln48_core/core/data/repositories_impl/progress_repository_impl.dart';
import 'package:ln48_core/core/domain/entities/word_item.dart';

import '../../support/test_app_db.dart';

void main() {
  test(
      'ProgressRepositoryImpl records attempts and persists rows in the progress table',
      () async {
    final AppDatabase db = createTestDatabase();
    addTearDown(db.close);
    final repo = ProgressRepositoryImpl(db);

    await repo.recordAttempt(
      gameId: 'flashcards',
      item: const WordItem(
        id: 'apple',
        term: 'Apfel',
        translation: 'apple',
      ),
      score: 1,
    );

    final rows = await db.select(db.progressEntries).get();
    expect(rows.length, 1);
    expect(rows.first.gameId, 'flashcards');
    expect(rows.first.itemId, 'apple');
    expect(rows.first.score, 1);
  });

  test('ProgressRepositoryImpl clearAll removes all stored progress entries',
      () async {
    final AppDatabase db = createTestDatabase();
    addTearDown(db.close);
    final repo = ProgressRepositoryImpl(db);

    await db.into(db.progressEntries).insert(
          ProgressEntriesCompanion.insert(
            gameId: 'flashcards',
            itemId: 'apple',
            score: const Value(1),
            lastPlayed: DateTime(2026, 2, 2),
          ),
        );
    await db.into(db.progressEntries).insert(
          ProgressEntriesCompanion.insert(
            gameId: 'memory',
            itemId: 'banana',
            score: const Value(0),
            lastPlayed: DateTime(2026, 2, 2),
          ),
        );

    await repo.clearAll();

    final rows = await db.select(db.progressEntries).get();
    expect(rows, isEmpty);
  });
}
