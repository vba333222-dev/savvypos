import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class LogEntry {
  final DateTime timestamp;
  final String level;
  final String tag;
  final String message;
  final Color? color;

  LogEntry(this.timestamp, this.level, this.tag, this.message, {this.color});
}

class LogTerminalWidget extends StatefulWidget {
  const LogTerminalWidget({super.key});

  @override
  State<LogTerminalWidget> createState() => _LogTerminalWidgetState();
}

class _LogTerminalWidgetState extends State<LogTerminalWidget> {
  final ScrollController _scrollController = ScrollController();
  final List<LogEntry> _logs = [];
  Timer? _simTimer;
  bool _autoScroll = true;

  @override
  void initState() {
    super.initState();
    // Simulate incoming logs
    _simTimer = Timer.periodic(const Duration(milliseconds: 800), (_) {
      if (!mounted) return;
      _addLog(_generateMockLog());
    });
  }

  void _addLog(LogEntry log) {
    setState(() {
      _logs.add(log);
      if (_logs.length > 200) _logs.removeAt(0); // Buffer limit
    });

    if (_autoScroll && _scrollController.hasClients) {
      // Scroll to bottom
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      });
    }
  }

  LogEntry _generateMockLog() {
    final now = DateTime.now();
    final types = ['INFO', 'DEBUG', 'WARN', 'ERROR', 'NET'];
    final tags = [
      'AuthBloc',
      'PrinterService',
      'SyncWorker',
      'Database',
      'Dio'
    ];
    final msgs = [
      'User session refreshed',
      'Heartbeat sent to server',
      'Connection timeout, retrying...',
      'INSERT INTO orders (id, total) VALUES ...',
      'GET /api/v1/health 200 OK',
      'Scanning for peripherals...',
    ];

    final type = types[now.microsecond % types.length];
    Color color = Colors.greenAccent;
    if (type == 'WARN') color = Colors.orangeAccent;
    if (type == 'ERROR') color = Colors.redAccent;
    if (type == 'NET') color = Colors.lightBlueAccent;

    return LogEntry(
      now,
      type,
      tags[now.microsecond % tags.length],
      msgs[now.microsecond % msgs.length],
      color: color,
    );
  }

  @override
  void dispose() {
    _simTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            color: Colors.grey[900],
            child: Row(
              children: [
                const Icon(Icons.terminal, color: Colors.green, size: 16),
                const SizedBox(width: 8),
                const Text("SYS.LOG_STREAM",
                    style: TextStyle(
                        color: Colors.green,
                        fontFamily: 'monospace',
                        fontSize: 12)),
                const Spacer(),
                IconButton(
                  icon: Icon(_autoScroll ? Icons.arrow_downward : Icons.pause,
                      color: Colors.white70, size: 16),
                  onPressed: () => setState(() => _autoScroll = !_autoScroll),
                  tooltip: 'Auto Scroll',
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline,
                      color: Colors.white70, size: 16),
                  onPressed: () => setState(() => _logs.clear()),
                  tooltip: 'Clear',
                ),
                IconButton(
                  icon:
                      const Icon(Icons.share, color: Colors.white70, size: 16),
                  onPressed: () {
                    // Clipboard
                    final text = _logs
                        .map((l) => "${l.timestamp} [${l.level}] ${l.message}")
                        .join("\n");
                    Clipboard.setData(ClipboardData(text: text));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Logs copied to clipboard")));
                  },
                  tooltip: 'Copy All',
                ),
              ],
            ),
          ),

          // Log List
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(8),
              itemCount: _logs.length,
              itemBuilder: (context, index) {
                final log = _logs[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                          fontFamily: 'monospace', fontSize: 11),
                      children: [
                        TextSpan(
                            text:
                                "${DateFormat('HH:mm:ss').format(log.timestamp)} ",
                            style: TextStyle(color: Colors.grey[600])),
                        TextSpan(
                            text: "[${log.level}] ",
                            style: TextStyle(
                                color: log.color, fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "${log.tag}: ",
                            style: const TextStyle(color: Colors.white60)),
                        TextSpan(
                            text: log.message,
                            style: TextStyle(color: Colors.grey[300])),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
