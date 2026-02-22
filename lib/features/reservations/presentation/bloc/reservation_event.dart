part of 'reservation_bloc.dart';

@freezed
class ReservationEvent with _$ReservationEvent {
  const factory ReservationEvent.loadReservations() = _LoadReservations;
  const factory ReservationEvent.addReservation(
      String name, String phone, int pax, DateTime time) = _AddReservation;
  const factory ReservationEvent.updateStatus(String uuid, String status,
      {String? tableUuid}) = _UpdateStatus;
}
