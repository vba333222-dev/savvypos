import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:savvy_pos/core/hal/payment_terminal_interface.dart';

/// TCP/LAN implementation of IPaymentTerminalDevice.
/// Connects to a LAN-based EDC terminal (e.g., Verifone, Ingenico) on port 8080.
/// Communicates using a simple JSON over raw TCP socket protocol.
class TcpEdcTerminal implements IPaymentTerminalDevice {
  final String terminalIp;
  final int terminalPort;

  final Logger _logger = Logger();

  final _statusController = StreamController<EdcTerminalStatus>.broadcast();
  final _resultsController = StreamController<EdcPaymentResult>.broadcast();

  Socket? _socket;
  Timer? _timeoutTimer;

  TcpEdcTerminal({
    required this.terminalIp,
    this.terminalPort = 8080,
  });

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
      _statusController.add(EdcTerminalStatus.connecting);
      _logger.i('TcpEdcTerminal: Connecting to $terminalIp:$terminalPort');

      // 1. Force close any lingering connections before starting new one
      await cancelPayment(referenceId: referenceId);

      // 2. Strict Timeout Wrapper: Wrap connection and the entire waiting process
      await Future(() async {
        _socket = await Socket.connect(
          terminalIp,
          terminalPort,
        ).timeout(
            const Duration(
                seconds: 5), // Short timeout for just the TCP handshake
            onTimeout: () => throw TimeoutException(
                'Gagal terhubung ke EDC dalam 5 detik.'));

        _statusController.add(EdcTerminalStatus.awaitingCard);
        _logger.i('TcpEdcTerminal: Connected. Sending payment request...');

        // Send JSON payment request
        final payload = jsonEncode({
          'command': 'SALE',
          'amount': amount,
          'reference_id': referenceId,
          'currency': 'IDR',
        });
        _socket!.write(payload);

        // Completer to wait for the stream response so we can wrap the entire flow
        // with the strict 45-second user requirement.
        final completer = Completer<void>();

        _socket!.listen(
          (data) {
            final raw = utf8.decode(data);
            _logger.d('TcpEdcTerminal: Raw response: $raw');
            _handleResponse(raw, referenceId, amount);
            if (!completer.isCompleted) completer.complete();
          },
          onError: (e) {
            if (!completer.isCompleted) completer.completeError(e);
          },
          onDone: () {
            _logger.d('TcpEdcTerminal: Socket closed by server');
            if (!completer.isCompleted) completer.complete();
          },
          cancelOnError: true,
        );

        return completer.future;
      }).timeout(
        const Duration(
            seconds:
                45), // Strict 45s Hard Limit according to prompt requirement
        onTimeout: () {
          _socket?.destroy(); // Aggressive teardown
          throw TimeoutException(
              'EDC tidak merespons dalam batas waktu 45 detik (Timeout).');
        },
      );
    } on TimeoutException catch (e) {
      _logger.w('TcpEdcTerminal: Timeout', error: e);
      _statusController.add(EdcTerminalStatus.timeout);
      throw PaymentHardwareException(
          'EDC tidak merespons. Periksa koneksi atau coba lagi. (${e.message})');
    } on SocketException catch (e) {
      _logger.e('TcpEdcTerminal: Socket Error', error: e);
      _statusController.add(EdcTerminalStatus.error);
      throw PaymentHardwareException(
          'Koneksi ke EDC bermasalah. Pastikan perangkat menyala. ($e)');
    } catch (e) {
      _logger.e('TcpEdcTerminal: Unknown Connection failed', error: e);
      _statusController.add(EdcTerminalStatus.error);
      if (e is PaymentHardwareException) rethrow;
      throw PaymentHardwareException('Gagal memproses pembayaran di EDC: $e');
    }
  }

  void _handleResponse(String raw, String referenceId, double amount) {
    _timeoutTimer?.cancel();

    try {
      final json = jsonDecode(raw) as Map<String, dynamic>;
      final status = json['status'] as String?;
      final approvalCode = json['approval_code'] as String?;

      if (status == 'APPROVED') {
        _statusController.add(EdcTerminalStatus.approved);
        _resultsController.add(EdcPaymentSuccess(
          referenceId: referenceId,
          approvedAmount: amount,
          approvalCode: approvalCode,
        ));
      } else {
        final reason =
            json['message'] as String? ?? 'Terminal declined the transaction';
        _statusController.add(EdcTerminalStatus.declined);
        _resultsController
            .add(EdcPaymentFailed(referenceId: referenceId, reason: reason));
      }
    } catch (e) {
      _logger.e('TcpEdcTerminal: Failed to parse response', error: e);
      _statusController.add(EdcTerminalStatus.error);
      _resultsController.add(EdcPaymentFailed(
          referenceId: referenceId,
          reason: 'Malformed response from terminal'));
    }

    _socket?.destroy();
  }

  @override
  Future<void> cancelPayment({required String referenceId}) async {
    try {
      _timeoutTimer?.cancel();
      if (_socket != null) {
        _logger.i('TcpEdcTerminal: Force cancelling payload to EDC...');

        try {
          final payload =
              jsonEncode({'command': 'CANCEL', 'reference_id': referenceId});
          _socket!.write(payload);
          await _socket!.flush().timeout(const Duration(seconds: 2));
        } catch (_) {
          // Ignore write fails on cancellation
        }

        // AGGRESSIVE CANCEL: Instantly destroy instead of gracefully closing.
        // POS Cashier shouldn't be blocked if the hardware hangs.
        _socket!.destroy();
        _socket = null;
      }
      _statusController.add(EdcTerminalStatus.idle);
      // Manually notify the listeners that the transaction was killed
      _resultsController.add(EdcPaymentCancelled(referenceId: referenceId));
      _logger.i('TcpEdcTerminal: Payment cancelled successfully.');
    } catch (e) {
      _logger.e('TcpEdcTerminal: Cancel failed', error: e);
    }
  }

  @override
  void dispose() {
    _timeoutTimer?.cancel();
    _socket?.destroy();
    _statusController.close();
    _resultsController.close();
  }
}
