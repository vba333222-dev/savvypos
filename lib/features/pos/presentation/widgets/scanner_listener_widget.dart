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
  final FocusNode _focusNode = FocusNode();
  final StringBuffer _buffer = StringBuffer();
  DateTime _lastKeyTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    // Request focus so we can capture keys immediately
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleKey(KeyEvent event) {
    if (event is KeyDownEvent) {
      final now = DateTime.now();
      // If keys are too slow (e.g. manual typing), clear buffer to avoid junk
      if (now.difference(_lastKeyTime).inMilliseconds > 200) {
        _buffer.clear();
      }
      _lastKeyTime = now;

      if (event.logicalKey == LogicalKeyboardKey.enter) {
        if (_buffer.isNotEmpty) {
          final code = _buffer.toString();
          widget.onScanned(code);
          _showScanFeedback(code);
          _buffer.clear();
        }
      } else {
        // Only append printable characters
        if (event.character != null && event.character!.isNotEmpty) {
           _buffer.write(event.character);
        }
      }
    }
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
                boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                   const Icon(Icons.qr_code_scanner, color: Colors.white, size: 20),
                   const SizedBox(width: 12),
                   Text(code, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: _handleKey,
      child: widget.child,
    );
  }
}
