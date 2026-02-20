import 'dart:async';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:savvy_pos/core/hal/payment_terminal_interface.dart';

/// Android App-to-App (Intent) implementation of IPaymentTerminalDevice.
/// Communicates with a partner EDC Android app by launching it via
/// Android Intent / MethodChannel. The partner app shows the payment
/// UI on the terminal's own screen, then broadcasts a result back.
///
/// Requires the Android platform side (MainActivity) to implement the
/// method channel handler that calls startActivityForResult().
///
/// Method Channel Contract:
///   Channel: 'com.savvypos/edc'
///   Method 'sendPaymentRequest': { amount, referenceId } → { status, approvalCode, message }
///   Method 'cancelPayment': { referenceId } → void
class IntentEdcTerminal implements IPaymentTerminalDevice {
  static const _methodChannel = MethodChannel('com.savvypos/edc');

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
    try {
      _statusController.add(EdcTerminalStatus.awaitingCard);
      _logger.i('IntentEdcTerminal: Launching EDC partner app via Intent...');

      // This call launches the partner EDC app and WAITS for its result
      // (blocking until user completes payment on the terminal device)
      final Map<dynamic, dynamic>? response = await _methodChannel.invokeMethod(
        'sendPaymentRequest',
        {
          'amount': amount,
          'referenceId': referenceId,
        },
      );

      if (response == null) {
        _statusController.add(EdcTerminalStatus.error);
        _resultsController.add(EdcPaymentFailed(
          referenceId: referenceId,
          reason: 'No response from EDC partner app',
        ));
        return;
      }

      final status = response['status'] as String? ?? '';
      final approvalCode = response['approvalCode'] as String?;
      final message = response['message'] as String? ?? 'Unknown error';

      if (status == 'APPROVED') {
        _statusController.add(EdcTerminalStatus.approved);
        _resultsController.add(EdcPaymentSuccess(
          referenceId: referenceId,
          approvedAmount: amount,
          approvalCode: approvalCode,
        ));
      } else if (status == 'CANCELLED') {
        _statusController.add(EdcTerminalStatus.idle);
        _resultsController.add(EdcPaymentCancelled(referenceId: referenceId));
      } else {
        _statusController.add(EdcTerminalStatus.declined);
        _resultsController.add(EdcPaymentFailed(referenceId: referenceId, reason: message));
      }
    } on PlatformException catch (e) {
      _logger.e('IntentEdcTerminal: PlatformException', error: e);
      _statusController.add(EdcTerminalStatus.error);
      _resultsController.add(EdcPaymentFailed(
        referenceId: referenceId,
        reason: 'EDC app error: ${e.message}',
      ));
    }
  }

  @override
  Future<void> cancelPayment({required String referenceId}) async {
    try {
      await _methodChannel.invokeMethod('cancelPayment', {'referenceId': referenceId});
      _statusController.add(EdcTerminalStatus.idle);
      _resultsController.add(EdcPaymentCancelled(referenceId: referenceId));
    } on PlatformException catch (e) {
      _logger.w('IntentEdcTerminal: Cancel failed with PlatformException: ${e.message}');
    }
  }

  @override
  void dispose() {
    _statusController.close();
    _resultsController.close();
  }
}
