import 'dart:async';
import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';

// Mock until DI is fully set up
class MockScannerService {
  final _controller = StreamController<String>.broadcast();
  Stream<String> get scanResults => _controller.stream;

  void simulateScan(String data) => _controller.add(data);
}

class ScannerListenerOverlay extends StatefulWidget {
  final Widget child;
  const ScannerListenerOverlay({super.key, required this.child});

  @override
  State<ScannerListenerOverlay> createState() => _ScannerListenerOverlayState();
}

class _ScannerListenerOverlayState extends State<ScannerListenerOverlay> {
  final MockScannerService _scanner =
      MockScannerService(); // Should be GetIt.I<ScannerService>()
  String? _lastScan;
  Timer? _dismissTimer;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    // In a real app, subscribe to the real service
    _scanner.scanResults.listen(_handleScan);
  }

  void _handleScan(String data) {
    setState(() {
      _lastScan = data;
      _isVisible = true;
    });

    _dismissTimer?.cancel();
    _dismissTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) setState(() => _isVisible = false);
    });
  }

  // Helper to test overlay (since we don't have a physical scanner attached to emulator usually)
  void testScan() => _scanner
      .simulateScan("SKU-${DateTime.now().millisecondsSinceEpoch % 1000}");

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Stack(
      children: [
        widget.child,

        // Debug Trigger (Remove in Prod)
        Positioned(
            bottom: 100,
            right: 16,
            child: Opacity(
              opacity: 0.3,
              child: FloatingActionButton.small(
                heroTag: 'scanner_test',
                onPressed: testScan,
                child: const Icon(Icons.qr_code_scanner),
              ),
            )),

        // The Capsule Notification
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutBack,
          top: _isVisible ? MediaQuery.of(context).padding.top + 16 : -100,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: theme.colors.bgInverse,
                borderRadius: BorderRadius.circular(30),
                boxShadow: theme.elevations.lg,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.qr_code,
                      color: Colors.greenAccent, size: 20),
                  const SizedBox(width: 12),
                  Text(
                    "SCANNER ACTIVE",
                    style: TextStyle(
                      color: theme.colors.textInverse.withValues(alpha: 0.7),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(width: 1, height: 16, color: Colors.white24),
                  const SizedBox(width: 8),
                  Text(
                    _lastScan ?? '',
                    style: TextStyle(
                        color: theme.colors.textInverse,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'monospace'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
