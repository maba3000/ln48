import 'package:ln48_core/core/domain/entities/word_item.dart';

abstract class ProgressRepository {
  Future<void> recordAttempt({
    required String gameId,
    required WordItem item,
    required int score,
  });

  Future<void> clearAll();
}
