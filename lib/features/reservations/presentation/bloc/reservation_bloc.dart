import 'package:savvy_pos/core/utils/time_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart' hide JsonKey;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/reservations/domain/repositories/i_reservation_repository.dart';
import 'package:uuid/uuid.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';
part 'reservation_bloc.freezed.dart';

@injectable
class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  final IReservationRepository _repo;
  final Uuid _uuid = const Uuid();

  ReservationBloc(this._repo) : super(const ReservationState.initial()) {
    on<_LoadReservations>(_onLoadReservations);
    on<_AddReservation>(_onAddReservation);
    on<_UpdateStatus>(_onUpdateStatus);
  }

  Future<void> _onLoadReservations(
      _LoadReservations event, Emitter<ReservationState> emit) async {
    emit(const ReservationState.loading());
    await emit.forEach(
      _repo.watchReservations(),
      onData: (List<ReservationTableData> data) =>
          ReservationState.loaded(data),
      onError: (e, s) => ReservationState.error(e.toString()),
    );
  }

  Future<void> _onAddReservation(
      _AddReservation event, Emitter<ReservationState> emit) async {
    try {
      final now = TimeHelper.now();
      await _repo.createReservation(ReservationTableCompanion.insert(
        uuid: _uuid.v4(),
        customerName: event.name,
        phone: Value(event.phone),
        pax: event.pax,
        reservationTime: event.time,
        status: const Value('PENDING'),
        createdAt: now,
        updatedAt: now,
      ));
    } catch (e) {
      // Handle error (maybe emit side-effect or log)
    }
  }

  Future<void> _onUpdateStatus(
      _UpdateStatus event, Emitter<ReservationState> emit) async {
    try {
      await _repo.updateStatus(event.uuid, event.status,
          tableUuid: event.tableUuid);
    } catch (e) {
      // Handle error
    }
  }
}
