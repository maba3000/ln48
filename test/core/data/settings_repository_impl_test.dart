import 'package:flutter_test/flutter_test.dart';
import 'package:ln48_core/core/data/db/app_db.dart';
import 'package:ln48_core/core/data/repositories_impl/settings_repository_impl.dart';

import '../../support/test_app_db.dart';

void main() {
  test(
      'SettingsRepositoryImpl saves and retrieves values by key (setString/getString)',
      () async {
    final AppDatabase db = createTestDatabase();
    addTearDown(db.close);
    final repo = SettingsRepositoryImpl(db);

    await repo.setString('theme_mode', 'dark');
    final stored = await repo.getString('theme_mode');

    expect(stored, 'dark');
  });

  test(
      'SettingsRepositoryImpl overwrites existing values when the same key is set again',
      () async {
    final AppDatabase db = createTestDatabase();
    addTearDown(db.close);
    final repo = SettingsRepositoryImpl(db);

    await repo.setString('theme_mode', 'dark');
    await repo.setString('theme_mode', 'light');
    final stored = await repo.getString('theme_mode');

    expect(stored, 'light');
  });
}
