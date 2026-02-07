import 'package:drift/drift.dart';

class ProgressEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get gameId => text()();
  TextColumn get itemId => text()();
  IntColumn get score => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastPlayed => dateTime()();
}
