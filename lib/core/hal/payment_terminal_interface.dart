import 'dart:async';

// ─────────────────────────────────────────────────────────
// Result Model (Sealed Pattern with Dart 3)
// ─────────────────────────────────────────────────────────
sealed class EdcPaymentResult {
  final String referenceId;
  const EdcPaymentResult(this.referenceId);
}

class EdcPaymentSuccess extends EdcPaymentResult {
  final double approvedAmount;
  final String? approvalCode;

  const EdcPaymentSuccess({
    required String referenceId,
    required this.approvedAmount,
    this.approvalCode,
  }) : super(referenceId);
}

class EdcPaymentFailed extends EdcPaymentResult {
  final String reason;

  const EdcPaymentFailed({
    required String referenceId,
    required this.reason,
  }) : super(referenceId);
}

class EdcPaymentTimeout extends EdcPaymentResult {
  const EdcPaymentTimeout({required String referenceId}) : super(referenceId);
}

class EdcPaymentCancelled extends EdcPaymentResult {
  const EdcPaymentCancelled({required String referenceId}) : super(referenceId);
}

// ─────────────────────────────────────────────────────────
// EDC Terminal Status (for UI feedback akin to PrinterStatus)
// ─────────────────────────────────────────────────────────
enum EdcTerminalStatus {
  idle,
  connecting,
  awaitingCard,
  processing,
  approved,
  declined,
  timeout,
  error,
}

// ─────────────────────────────────────────────────────────
// Abstract Interface
// ─────────────────────────────────────────────────────────
abstract class IPaymentTerminalDevice {
  /// Stream emitting terminal status updates for UI feedback.
  Stream<EdcTerminalStatus> get terminalStatus;

  /// Stream emitting final payment results (Success, Failed, Timeout, Cancelled).
  Stream<EdcPaymentResult> get results;

  /// Sends a payment request to the EDC hardware.
  /// [amount] is the exact amount to charge.
  /// [referenceId] is the unique order/transaction ID for reconciliation.
  Future<void> sendPaymentRequest({
    required double amount,
    required String referenceId,
  });

  /// Cancels an in-flight payment request.
  Future<void> cancelPayment({required String referenceId});

  /// Disposes streams and connections when no longer needed.
  void dispose();
}

// ─────────────────────────────────────────────────────────
// Custom Exception
// ─────────────────────────────────────────────────────────
class PaymentHardwareException implements Exception {
  final String message;
  const PaymentHardwareException(this.message);

  @override
  String toString() => message;
}
