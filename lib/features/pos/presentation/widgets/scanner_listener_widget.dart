import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScannerListenerWidget extends StatefulWidget {
  final Widget child;
  final Function(String) onScanned;

  const ScannerListenerWidget({
    Key? key,
    required this.child,
    required this.onScanned,
  }) : super(key: key);

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

  void _handleKey(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      final now = DateTime.now();
      // If keys are too slow (e.g. manual typing), clear buffer to avoid junk
      if (now.difference(_lastKeyTime).inMilliseconds > 200) {
        _buffer.clear();
      }
      _lastKeyTime = now;

      if (event.logicalKey == LogicalKeyboardKey.enter) {
        if (_buffer.isNotEmpty) {
          widget.onScanned(_buffer.toString());
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

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: _handleKey,
      child: widget.child,
    );
  }
}
