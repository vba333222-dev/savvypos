import 'package:savvy_pos/core/utils/time_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScannerListenerWidget extends StatefulWidget {
  final Widget child;
  final Function(String) onScanned;

  const ScannerListenerWidget({
    super.key,
    required this.child,
    required this.onScanned,
  });

  @override
  State<ScannerListenerWidget> createState() => _ScannerListenerWidgetState();
}

class _ScannerListenerWidgetState extends State<ScannerListenerWidget> {
  final StringBuffer _buffer = StringBuffer();
  DateTime _lastKeyTime = TimeHelper.now();

  @override
  void initState() {
    super.initState();
    HardwareKeyboard.instance.addHandler(_handleKey);
  }

  @override
  void dispose() {
    HardwareKeyboard.instance.removeHandler(_handleKey);
    super.dispose();
  }

  bool _handleKey(KeyEvent event) {
    if (event is KeyDownEvent) {
      final now = TimeHelper.now();
      final diff = now.difference(_lastKeyTime).inMilliseconds;
      _lastKeyTime = now;

      // If keys are too slow (e.g. manual typing > 50ms), it's a human.
      // Clear buffer to avoid junk and let the OS handle the key normally.
      if (diff > 50) {
        _buffer.clear();
        return false; // Not handled here, let TextFields receive it
      }

      if (event.logicalKey == LogicalKeyboardKey.enter) {
        if (_buffer.length >= 8) {
          // Valid barcode heuristic length
          final code = _buffer.toString();

          // Execute callback safely in next event loop to free keyboard listener
          WidgetsBinding.instance.addPostFrameCallback((_) {
            widget.onScanned(code);
            if (mounted) _showScanFeedback(code);
          });

          _buffer.clear();
          return true; // We handled the scanner ENTER key, don't submit forms accidentally
        } else {
          _buffer.clear();
          return false; // Random fast enter? Let it through just in case
        }
      } else {
        // Only append printable characters.
        if (event.character != null && event.character!.isNotEmpty) {
          // It's typing fast (< 50ms), so it's likely a scanner character.
          // Buffer it and PREVENT it from reaching any focused TextField.
          _buffer.write(event.character);
          return true;
        }
      }
    }

    // Ignore KeyUpEvents or unprintable modifiers but don't consume them randomly
    return false;
  }

  void _showScanFeedback(String code) {
    if (!mounted) return;

    // Quick Overlay
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 80,
        left: 0,
        right: 0,
        child: Material(
          type: MaterialType.transparency,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4))
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.qr_code_scanner,
                      color: Colors.white, size: 20),
                  const SizedBox(width: 12),
                  Text(code,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(entry);
    Future.delayed(const Duration(seconds: 2), () {
      if (entry.mounted) entry.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    // We no longer wrap the child in an obsolete Focus Node KeyboardListener!
    // The HardwareKeyboard singleton interceptor is active globally while this widget lives in the tree.
    return widget.child;
  }
}
