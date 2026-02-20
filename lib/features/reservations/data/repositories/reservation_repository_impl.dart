import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/reservations/domain/repositories/i_reservation_repository.dart';

@LazySingleton(as: IReservationRepository)
class ReservationRepositoryImpl implements IReservationRepository {
  final AppDatabase db;

  ReservationRepositoryImpl(this.db);

  @override
  Stream<List<ReservationTableData>> watchReservations() {
    return (db.select(db.reservationTable)
          ..orderBy([(t) => OrderingTerm(expression: t.reservationTime)]))
        .watch();
  }

  @override
  Future<List<ReservationTableData>> getReservations(DateTime start, DateTime end) {
    return (db.select(db.reservationTable)
      ..where((t) => t.reservationTime.isBetween(Variable(start), Variable(end)))
      ..orderBy([(t) => OrderingTerm(expression: t.reservationTime)])
    ).get();
  }

  @override
  Future<void> createReservation(ReservationTableCompanion reservation) async {
    await db.into(db.reservationTable).insert(reservation);
  }

  @override
  Future<void> updateStatus(String uuid, String status, {String? tableUuid}) async {
    await (db.update(db.reservationTable)..where((t) => t.uuid.equals(uuid))).write(
      ReservationTableCompanion(
        status: Value(status),
        tableUuid: Value(tableUuid),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}
