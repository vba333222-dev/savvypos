import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/services/socket_service.dart';

part 'cds_bloc.freezed.dart';

@freezed
class CdsEvent with _$CdsEvent {
  const factory CdsEvent.socketMessageReceived(Map<String, dynamic> message) = _SocketMessageReceived;
}

@freezed
class CdsState with _$CdsState {
  const factory CdsState.idle() = _Idle;
  const factory CdsState.activeCart({
    required List<dynamic> items, // Using dynamic for prototype
    required double total,
    required double tax,
  }) = _ActiveCart;
  const factory CdsState.paymentRequest({required String qrData}) = _PaymentRequest;
  const factory CdsState.success({required int pointsEarned}) = _Success;
}

@injectable
class CdsBloc extends Bloc<CdsEvent, CdsState> {
  final SocketService _socketService;

  CdsBloc(this._socketService) : super(const CdsState.idle()) {
    on<_SocketMessageReceived>(_onSocketMessageReceived);

    _socketService.connect();
    _socketService.messages.listen((message) {
      add(CdsEvent.socketMessageReceived(message));
    });
  }

  void _onSocketMessageReceived(_SocketMessageReceived event, Emitter<CdsState> emit) {
    final msg = event.message;
    final type = msg['event'];
    final data = msg['data'];

    switch (type) {
      case 'CDS_IDLE':
        emit(const CdsState.idle());
        break;
      case 'CDS_UPDATE_CART':
        emit(CdsState.activeCart(
          items: data['items'] ?? [],
          total: (data['total'] ?? 0).toDouble(),
          tax: (data['tax'] ?? 0).toDouble(),
        ));
        break;
      case 'CDS_PAYMENT_REQUEST':
        emit(CdsState.paymentRequest(qrData: data['qr_data'] ?? ''));
        break;
      case 'CDS_SUCCESS':
        emit(CdsState.success(pointsEarned: data['points'] ?? 0));
        break;
    }
  }
}
