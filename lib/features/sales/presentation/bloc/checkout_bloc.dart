import 'package:savvy_pos/core/utils/time_helper.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/hal/payment_terminal_interface.dart';
import 'package:savvy_pos/features/sales/domain/entities/payment_transaction.dart';
import 'package:savvy_pos/features/sales/domain/usecases/checkout_usecases.dart';
import 'package:savvy_pos/features/sales/domain/repositories/i_checkout_repository.dart';
import 'package:savvy_pos/features/loyalty/domain/entities/loyalty_entities.dart';
import 'package:savvy_pos/features/loyalty/domain/usecases/loyalty_usecases.dart';
import 'package:savvy_pos/core/database/database.dart';

part 'checkout_bloc.freezed.dart';

@freezed
class CheckoutEvent with _$CheckoutEvent {
  const factory CheckoutEvent.started(String orderUuid, double totalAmount) =
      _Started;
  const factory CheckoutEvent.processPayment({
    required PaymentMethod method,
    required double amount,
    double? tendered,
    String? note,
  }) = _ProcessPayment;
  const factory CheckoutEvent.addPaymentPart(PaymentPart part) =
      _AddPaymentPart;
  const factory CheckoutEvent.removePaymentPart(int index) = _RemovePaymentPart;
  const factory CheckoutEvent.confirmSplitTenderCheckout() =
      _ConfirmSplitTenderCheckout;
  const factory CheckoutEvent.refreshWithBalance(double balance) =
      _RefreshWithBalance;
  const factory CheckoutEvent.attachLoyaltyMember(LoyaltyMember member) =
      _AttachLoyaltyMember;

  // EDC Events: These replace manual card button confirmation flow
  const factory CheckoutEvent.initiateEdcPayment(double amount) =
      _InitiateEdcPayment;
  const factory CheckoutEvent.edcPaymentConfirmed({
    required double amount,
    required String referenceId,
    String? approvalCode,
  }) = _EdcPaymentConfirmed;
  const factory CheckoutEvent.edcPaymentFailed(String reason) =
      _EdcPaymentFailed;
  const factory CheckoutEvent.cancelEdcPayment() = _CancelEdcPayment;
}

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState({
    required String orderUuid,
    required double totalAmount,
    required double remainingBalance,
    @Default(0.0) double amountPaid,
    @Default([]) List<PaymentPart> paymentParts,
    @Default(false) bool isLoading,
    @Default(false) bool isComplete,
    String? errorMessage,
    LoyaltyMember? attachedMember,
    @Default([]) List<OrderItemTableData> items,
    // EDC State Fields
    @Default(false) bool isAwaitingEdc,
    @Default(EdcTerminalStatus.idle) EdcTerminalStatus edcTerminalStatus,
    String? lastApprovalCode,
  }) = _CheckoutState;
}

@injectable
class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final ProcessPaymentUseCase _processPayment;
  final GetOrderBalanceUseCase _getOrderBalance;
  final ICheckoutRepository _repository;
  final EarnPointsUseCase _earnPoints;
  final IPaymentTerminalDevice _edcTerminal;

  StreamSubscription? _balanceSub;
  StreamSubscription? _edcResultSub;
  StreamSubscription? _edcStatusSub;

  CheckoutBloc(
    this._processPayment,
    this._getOrderBalance,
    this._repository,
    this._earnPoints,
    this._edcTerminal,
  ) : super(const CheckoutState(
            orderUuid: '', totalAmount: 0, remainingBalance: 0)) {
    on<_Started>(_onStarted);
    on<_ProcessPayment>(_onProcessPayment);
    on<_AddPaymentPart>(_onAddPaymentPart);
    on<_RemovePaymentPart>(_onRemovePaymentPart);
    on<_ConfirmSplitTenderCheckout>(_onConfirmSplitTenderCheckout);
    on<_RefreshWithBalance>(
        (event, emit) => emit(state.copyWith(remainingBalance: event.balance)));
    on<_AttachLoyaltyMember>(
        (event, emit) => emit(state.copyWith(attachedMember: event.member)));

    // EDC handlers
    on<_InitiateEdcPayment>(_onInitiateEdcPayment);
    on<_EdcPaymentConfirmed>(_onEdcPaymentConfirmed);
    on<_EdcPaymentFailed>((event, emit) => emit(state.copyWith(
          isAwaitingEdc: false,
          edcTerminalStatus: EdcTerminalStatus.declined,
          errorMessage: event.reason,
        )));
    on<_CancelEdcPayment>(_onCancelEdcPayment);
  }

  Future<void> _onStarted(_Started event, Emitter<CheckoutState> emit) async {
    emit(state.copyWith(
      orderUuid: event.orderUuid,
      totalAmount: event.totalAmount,
      remainingBalance: event.totalAmount,
    ));

    try {
      final items = await _repository.getOrderItems(event.orderUuid);
      emit(state.copyWith(items: items));
    } catch (_) {}

    await _balanceSub?.cancel();
    _balanceSub =
        _getOrderBalance(event.orderUuid, event.totalAmount).listen((balance) {
      add(CheckoutEvent.refreshWithBalance(balance));
    });
  }

  Future<void> _onInitiateEdcPayment(
      _InitiateEdcPayment event, Emitter<CheckoutState> emit) async {
    // Cancel any previous EDC subscription before starting new one (memory safety)
    await _edcResultSub?.cancel();

    emit(state.copyWith(
      isAwaitingEdc: true,
      edcTerminalStatus: EdcTerminalStatus.connecting,
      errorMessage: null,
    ));

    final referenceId =
        '${state.orderUuid}-${TimeHelper.now().millisecondsSinceEpoch}';

    // Subscribe to EDC results FIRST, THEN send request
    _edcResultSub = _edcTerminal.results.listen((result) {
      switch (result) {
        case EdcPaymentSuccess r:
          // Auto-confirm: No button press needed by cashier!
          add(CheckoutEvent.edcPaymentConfirmed(
            amount: r.approvedAmount,
            referenceId: r.referenceId,
            approvalCode: r.approvalCode,
          ));
        case EdcPaymentFailed r:
          add(CheckoutEvent.edcPaymentFailed(r.reason));
        case EdcPaymentTimeout r:
          add(CheckoutEvent.edcPaymentFailed(
              'Terminal timeout. Please retry. (Ref: ${r.referenceId})'));
        case EdcPaymentCancelled _:
          add(const CheckoutEvent.cancelEdcPayment());
      }
    });

    // Send the payment request to the hardware
    try {
      await _edcTerminal.sendPaymentRequest(
        amount: event.amount,
        referenceId: referenceId,
      );
    } catch (e) {
      if (e is PaymentHardwareException) {
        // Emit explicit hardware exceptions back to UI state without crashing the bloc
        add(CheckoutEvent.edcPaymentFailed(e.message));
      } else {
        add(CheckoutEvent.edcPaymentFailed(
            'Kesalahan tidak diketahui sistem EDC: $e'));
      }
    }
  }

  Future<void> _onEdcPaymentConfirmed(
      _EdcPaymentConfirmed event, Emitter<CheckoutState> emit) async {
    await _edcResultSub?.cancel();

    emit(state.copyWith(
      isAwaitingEdc: false,
      isLoading: true,
      edcTerminalStatus: EdcTerminalStatus.approved,
      lastApprovalCode: event.approvalCode,
      errorMessage: null,
    ));

    try {
      // 1. DRAFT -> PROCESSING_PAYMENT (Intermediate State to track crashes)
      await _repository.updateOrderStatus(state.orderUuid, 'PROCESSING_PAYMENT');

      // 2. Record the payment in the database (same flow as manual card payment)
      await _processPayment(
        orderUuid: state.orderUuid,
        method: PaymentMethod.card,
        amount: event.amount,
        tendered: event.amount,
        note: 'EDC Approval: ${event.approvalCode ?? event.referenceId}',
      );

      if ((state.remainingBalance - event.amount) <= 0.01) {
        emit(state.copyWith(isLoading: false, isComplete: true));
        await _repository.updateOrderStatus(state.orderUuid, 'COMPLETED');

        if (state.attachedMember != null) {
          try {
            await _earnPoints(
              customerUuid: state.attachedMember!.customerUuid,
              orderTotal: state.totalAmount,
              orderUuid: state.orderUuid,
            );
          } catch (_) {}
        }
      } else {
        emit(state.copyWith(isLoading: false));
        await _repository.updateOrderStatus(state.orderUuid, 'PARTIAL');
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onCancelEdcPayment(
      _CancelEdcPayment event, Emitter<CheckoutState> emit) async {
    await _edcResultSub?.cancel();
    await _edcTerminal.cancelPayment(referenceId: state.orderUuid);
    emit(state.copyWith(
      isAwaitingEdc: false,
      edcTerminalStatus: EdcTerminalStatus.idle,
    ));
  }

  Future<void> _onProcessPayment(
      _ProcessPayment event, Emitter<CheckoutState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      // 1. DRAFT -> PROCESSING_PAYMENT (Intermediate State to track crashes)
      await _repository.updateOrderStatus(state.orderUuid, 'PROCESSING_PAYMENT');

      // 2. Proceed with Payment Execution
      await _processPayment(
        orderUuid: state.orderUuid,
        method: event.method,
        amount: event.amount,
        tendered: event.tendered,
        note: event.note,
      );

      if ((state.remainingBalance - event.amount) <= 0.01) {
        emit(state.copyWith(isLoading: false, isComplete: true));
        await _repository.updateOrderStatus(state.orderUuid, 'COMPLETED');

        if (state.attachedMember != null) {
          try {
            await _earnPoints(
                customerUuid: state.attachedMember!.customerUuid,
                orderTotal: state.totalAmount,
                orderUuid: state.orderUuid);
          } catch (e) {}
        }
      } else {
        emit(state.copyWith(isLoading: false));
        await _repository.updateOrderStatus(state.orderUuid, 'PARTIAL');
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void _onAddPaymentPart(_AddPaymentPart event, Emitter<CheckoutState> emit) {
    if (state.remainingBalance <= 0) return;

    final newParts = List<PaymentPart>.from(state.paymentParts)
      ..add(event.part);

    // Calculate new totals
    double newAmountPaid = state.amountPaid + event.part.amount;
    double newRemaining = state.totalAmount - newAmountPaid;

    if (newRemaining < 0) newRemaining = 0;

    emit(state.copyWith(
      paymentParts: newParts,
      amountPaid: newAmountPaid,
      remainingBalance: newRemaining,
    ));
  }

  void _onRemovePaymentPart(
      _RemovePaymentPart event, Emitter<CheckoutState> emit) {
    if (event.index < 0 || event.index >= state.paymentParts.length) return;

    final newParts = List<PaymentPart>.from(state.paymentParts);
    final removed = newParts.removeAt(event.index);

    double newAmountPaid = state.amountPaid - removed.amount;
    if (newAmountPaid < 0) newAmountPaid = 0;

    double newRemaining = state.totalAmount - newAmountPaid;

    emit(state.copyWith(
      paymentParts: newParts,
      amountPaid: newAmountPaid,
      remainingBalance: newRemaining,
    ));
  }

  Future<void> _onConfirmSplitTenderCheckout(
      _ConfirmSplitTenderCheckout event, Emitter<CheckoutState> emit) async {
    if (state.paymentParts.isEmpty) return;

    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      // Process each part
      for (final part in state.paymentParts) {
        await _processPayment(
          orderUuid: state.orderUuid,
          method: part.method,
          amount: part.amount,
          tendered: part.tendered,
          note: part.note,
        );
      }

      // Mark order complete since remaining balance must be <= 0 to trigger this
      emit(state.copyWith(
          isLoading: false, isComplete: true, remainingBalance: 0));
      await _repository.updateOrderStatus(state.orderUuid, 'COMPLETED');

      if (state.attachedMember != null) {
        try {
          await _earnPoints(
              customerUuid: state.attachedMember!.customerUuid,
              orderTotal: state.totalAmount,
              orderUuid: state.orderUuid);
        } catch (e) {}
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _balanceSub?.cancel();
    _edcResultSub?.cancel();
    _edcStatusSub?.cancel();
    _edcTerminal.dispose();
    return super.close();
  }
}
