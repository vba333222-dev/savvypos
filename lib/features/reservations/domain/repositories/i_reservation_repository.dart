import 'package:savvy_pos/core/database/database.dart';

abstract class IReservationRepository {
  Stream<List<ReservationTableData>> watchReservations();
  Future<List<ReservationTableData>> getReservations(
      DateTime start, DateTime end);
  Future<void> createReservation(ReservationTableCompanion reservation);
  Future<void> updateStatus(String uuid, String status,
      {String? tableUuid}); // PENDING, SEATED, CANCELLED
}
