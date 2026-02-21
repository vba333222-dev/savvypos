import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/services/socket_service.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';

class DigitalPaymentWidget extends StatefulWidget {
  final double amount;
  final String orderId;
  final VoidCallback onPaymentSuccess;
  final VoidCallback? onCancel;

  const DigitalPaymentWidget({
    super.key,
    required this.amount,
    required this.orderId,
    required this.onPaymentSuccess,
    this.onCancel,
  });

  @override
  State<DigitalPaymentWidget> createState() => _DigitalPaymentWidgetState();
}

class _DigitalPaymentWidgetState extends State<DigitalPaymentWidget> {
  // Mock State
  bool _isQrReady = false;
  bool _isSuccess = false;

  @override
  void initState() {
    super.initState();
    _simulateFlow();
  }

  void _simulateFlow() async {
    final socketService = GetIt.I<SocketService>();
    final mockQrString = '00020101021126660016COM.GOJEK.WWW01189360091531580252510209580252515204581253033605407${widget.amount}5802ID5912Savvy Bistro6007Jakarta61051211062070703A016304EE88';
    
    // 1. Simulate API Call to Get QR
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
       setState(() => _isQrReady = true);
       socketService.simulateIncomingMessage('CDS_PAYMENT_REQUEST', {'qr_data': mockQrString});
    }

    // 2. Simulate User Paying (Mock Webhook wait)
    await Future.delayed(const Duration(seconds: 4));

    if (mounted) {
      setState(() => _isSuccess = true);
      // Cha-ching sound here
      socketService.simulateIncomingMessage('CDS_SUCCESS', {'points': (widget.amount * 0.1).toInt()});

      // Auto Close
      await Future.delayed(const Duration(seconds: 2));
      socketService.simulateIncomingMessage('CDS_IDLE', {});
      widget.onPaymentSuccess();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 24),
        SavvyText.h3('Scan to Pay'),
        const SizedBox(height: 8),
        SavvyText.h2('\$${widget.amount.toStringAsFixed(2)}',
            color: context.savvy.colors.primary),
        const SizedBox(height: 24),

        // QR Area
        SizedBox(
          width: 200,
          height: 200,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Placeholder for QR
              if (_isQrReady && !_isSuccess)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 4),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Icon(Icons.qr_code_2, size: 150),
                  ),
                ).animate().fade().scale(),

              // Loading Spinner
              if (!_isQrReady) const CircularProgressIndicator(),

              // Success State
              if (_isSuccess)
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 80),
                )
                    .animate()
                    .scale(curve: Curves.elasticOut, duration: 500.ms)
                    .then()
                    .shake(),

              // Pulse Ring (Waiting)
              if (_isQrReady && !_isSuccess)
                Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.amber, width: 2),
                    shape: BoxShape.circle,
                  ),
                )
                    .animate(onPlay: (c) => c.repeat())
                    .scale(
                        begin: const Offset(1, 1),
                        end: const Offset(1.1, 1.1),
                        duration: 1.seconds)
                    .fadeOut(),
            ],
          ),
        ),

        const SizedBox(height: 24),
        if (!_isSuccess)
          SavvyText.body(
            _isQrReady ? 'Waiting for payment...' : 'Generating secure QR...',
            color: context.savvy.colors.textSecondary,
          )
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .fade(begin: 0.5, end: 1.0),

        if (_isSuccess)
          const SavvyText.h3('Payment Received!', color: Colors.green)
              .animate()
              .fadeIn(),

        const SizedBox(height: 24),

        // Cancel Button (Critical Hardware Fallback)
        if (!_isSuccess)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: OutlinedButton.icon(
              icon: const Icon(Icons.cancel, color: Colors.red),
              label: const Text('Batalkan Pembayaran',
                  style: TextStyle(color: Colors.red)),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.red),
              ),
              onPressed: () {
                if (widget.onCancel != null) widget.onCancel!();
              },
            ),
          ).animate().fadeIn(delay: 500.ms),
      ],
    );
  }
}
