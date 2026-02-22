import 'package:drift/drift.dart';
import 'package:savvy_pos/core/database/tables.dart';

class CustomerFeedbackTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get orderUuid => text().references(OrderTable, #uuid)();
  TextColumn get customerUuid =>
      text().nullable().references(CustomerTable, #uuid)();
  IntColumn get rating => integer()(); // 1-5
  TextColumn get sentiment => text()
      .withDefault(const Constant('neutral'))(); // positive, negative, neutral
  TextColumn get tags => text().nullable()(); // JSON list of tags
  TextColumn get comment => text().nullable()();

  BoolColumn get isActioned =>
      boolean().withDefault(const Constant(false))(); // For manager workflow
  DateTimeColumn get createdAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
        {uuid}
      ];
}
