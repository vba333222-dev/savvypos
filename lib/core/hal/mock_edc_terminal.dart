import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:savvy_pos/core/hal/payment_terminal_interface.dart';

/// Mock implementation of IPaymentTerminalDevice for developer testing.
///
/// This replaces the real EDC hardware during emulator/simulator development.
/// When [sendPaymentRequest] is called, it simulates:
///   1. Briefly enters "connecting" state.
///   2. Enters "awaitingCard" state.
///   3. After a 3-second wait, emits EdcPaymentSuccess automatically.
///
/// To simulate a failure, set [shouldSimulateFailure] = true.
/// To simulate a timeout, set [shouldSimulateTimeout] = true.
///
/// Registered as @LazySingleton with injectable environment 'dev' only.
@LazySingleton(as: IPaymentTerminalDevice, env: ['dev'])
class MockEdcTerminal implements IPaymentTerminalDevice {
  final bool shouldSimulateFailure;
  final bool shouldSimulateTimeout;

  MockEdcTerminal({
    this.shouldSimulateFailure = false,
    this.shouldSimulateTimeout = false,
  });

  final Logger _logger = Logger();

  final _statusController = StreamController<EdcTerminalStatus>.broadcast();
  final _resultsController = StreamController<EdcPaymentResult>.broadcast();

  @override
  Stream<EdcTerminalStatus> get terminalStatus => _statusController.stream;

  @override
  Stream<EdcPaymentResult> get results => _resultsController.stream;

  @override
  Future<void> sendPaymentRequest({
    required double amount,
    required String referenceId,
  }) async {
    _logger.i('MockEdcTerminal: Simulating EDC payment (Ref: $referenceId, Amount: $amount)');

    // Step 1: Simulate brief connection phase
    _statusController.add(EdcTerminalStatus.connecting);
    await Future.delayed(const Duration(milliseconds: 500));

    // Step 2: Simulate "tap/swipe your card" screen on EDC
    _statusController.add(EdcTerminalStatus.awaitingCard);
    _logger.i('MockEdcTerminal: Awaiting card... (3 second simulation)');

    // Step 3: Simulate 3-second payment processing delay
    await Future.delayed(const Duration(seconds: 3));

    if (shouldSimulateTimeout) {
      _logger.w('MockEdcTerminal: Simulated TIMEOUT');
      _statusController.add(EdcTerminalStatus.timeout);
      _resultsController.add(EdcPaymentTimeout(referenceId: referenceId));
      return;
    }

    // Step 4: Simulate processing
    _statusController.add(EdcTerminalStatus.processing);
    await Future.delayed(const Duration(milliseconds: 300));

    if (shouldSimulateFailure) {
      _logger.w('MockEdcTerminal: Simulated DECLINED');
      _statusController.add(EdcTerminalStatus.declined);
      _resultsController.add(EdcPaymentFailed(
        referenceId: referenceId,
        reason: 'Simulated card decline (insufficient funds)',
      ));
    } else {
      _logger.i('MockEdcTerminal: Simulated APPROVED ✅');
      _statusController.add(EdcTerminalStatus.approved);
      _resultsController.add(EdcPaymentSuccess(
        referenceId: referenceId,
        approvedAmount: amount,
        approvalCode: 'MOCK-${DateTime.now().millisecondsSinceEpoch}',
      ));
    }
  }

  @override
  Future<void> cancelPayment({required String referenceId}) async {
    _logger.i('MockEdcTerminal: Simulating cancellation for ref: $referenceId');
    await Future.delayed(const Duration(milliseconds: 200));
    _statusController.add(EdcTerminalStatus.idle);
    _resultsController.add(EdcPaymentCancelled(referenceId: referenceId));
  }

  @override
  void dispose() {
    _statusController.close();
    _resultsController.close();
  }
}
