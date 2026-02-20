import 'dart:async';
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
  final List<String> _scannedChars = [];
  DateTime _lastKeyTime = DateTime.now();
  Timer? _bufferTimer;

  @override
  void dispose() {
    _focusNode.dispose();
    _bufferTimer?.cancel();
    super.dispose();
  }

  void _handleKey(KeyEvent event) {
    if (event is KeyDownEvent) {
      final key = event.logicalKey;
      
      // Check for Enter key (End of barcode)
      if (key == LogicalKeyboardKey.enter) {
        if (_scannedChars.isNotEmpty) {
          widget.onScanned(_scannedChars.join());
          _scannedChars.clear();
        }
        return;
      }

      // Check for timing - Scanners type very fast (<50ms between keys)
      // Manually typing is usually >100ms
      final now = DateTime.now();
      if (now.difference(_lastKeyTime).inMilliseconds > 100) {
         // Reset if too slow (likely manual typing)
         _scannedChars.clear();
      }
      _lastKeyTime = now;

      // Add char if printable
      if (event.character != null && event.character!.isNotEmpty) {
        _scannedChars.add(event.character!);
        
        // Safety buffer flush
        _bufferTimer?.cancel();
        _bufferTimer = Timer(const Duration(milliseconds: 200), () {
           _scannedChars.clear();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: _handleKey,
      autofocus: true,
      child: widget.child,
    );
  }
}
