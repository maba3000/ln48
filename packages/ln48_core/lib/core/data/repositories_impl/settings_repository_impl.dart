import 'package:ln48_core/core/data/db/app_db.dart';
import 'package:ln48_core/core/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this._db);

  final AppDatabase _db;

  @override
  Future<String?> getString(String key) async {
    final query = _db.select(_db.settings)..where((row) => row.key.equals(key));
    final row = await query.getSingleOrNull();
    return row?.value;
  }

  @override
  Future<void> setString(String key, String value) async {
    await _db.into(_db.settings).insertOnConflictUpdate(
          SettingsCompanion.insert(
            key: key,
            value: value,
          ),
        );
  }
}
