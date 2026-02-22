import 'package:flutter/material.dart';
import 'package:savvy_pos/features/diagnostics/presentation/widgets/log_terminal_widget.dart';
import 'package:savvy_pos/features/diagnostics/presentation/widgets/network_traffic_widget.dart';

class DiagnosticsHubPage extends StatefulWidget {
  const DiagnosticsHubPage({super.key});

  @override
  State<DiagnosticsHubPage> createState() => _DiagnosticsHubPageState();
}

class _DiagnosticsHubPageState extends State<DiagnosticsHubPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Matrix theme
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text("BLACK BOX DIAGNOSTICS",
            style: TextStyle(
                color: Colors.greenAccent,
                fontFamily: 'monospace',
                letterSpacing: 2)),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.greenAccent,
          labelColor: Colors.greenAccent,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(icon: Icon(Icons.terminal), text: 'LOGS'),
            Tab(icon: Icon(Icons.router), text: 'NET'),
            Tab(icon: Icon(Icons.warning), text: 'DANGER'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          LogTerminalWidget(),
          NetworkTrafficWidget(),
          _DangerZone(),
        ],
      ),
    );
  }
}

class _DangerZone extends StatelessWidget {
  const _DangerZone();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.warning_amber_rounded, size: 80, color: Colors.red),
          const SizedBox(height: 24),
          const Text("EMERGENCY ACTIONS",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2)),
          const SizedBox(height: 48),
          _DangerButton(
            label: "PURGE DATABASE",
            onLongPress: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Database Purged! (Mock)")));
            },
          ),
          const SizedBox(height: 24),
          _DangerButton(
            label: "FORCE CRASH",
            onLongPress: () {
              throw Exception("Manual Force Crash Triggered");
            },
          ),
          const SizedBox(height: 24),
          const Text("Hold for 3 seconds to execute",
              style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class _DangerButton extends StatelessWidget {
  final String label;
  final VoidCallback onLongPress;

  const _DangerButton({required this.label, required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onLongPress,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
        decoration: BoxDecoration(
          color: Colors.red.withValues(alpha: 0.1),
          border: Border.all(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(label,
            style: const TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18)),
      ),
    );
  }
}
