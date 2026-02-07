import 'package:drift/native.dart';

import 'package:ln48_core/core/data/db/app_db.dart';

AppDatabase createTestDatabase() {
  return AppDatabase.forTesting(NativeDatabase.memory());
}
