import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ln48_core/core/data/datasources/content_local_datasource.dart';
import 'package:ln48_core/core/data/db/app_db.dart';
import 'package:ln48_core/core/data/repositories_impl/content_repository_impl.dart';
import 'package:ln48_core/core/data/repositories_impl/progress_repository_impl.dart';
import 'package:ln48_core/core/data/repositories_impl/settings_repository_impl.dart';
import 'package:ln48_core/core/domain/repositories/content_repository.dart';
import 'package:ln48_core/core/domain/repositories/progress_repository.dart';
import 'package:ln48_core/core/domain/repositories/settings_repository.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final contentRepositoryProvider = Provider<ContentRepository>((ref) {
  return ContentRepositoryImpl(ContentLocalDatasource());
});

final progressRepositoryProvider = Provider<ProgressRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return ProgressRepositoryImpl(db);
});

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return SettingsRepositoryImpl(db);
});
