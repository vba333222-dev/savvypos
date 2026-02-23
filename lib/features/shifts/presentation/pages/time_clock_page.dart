import 'package:savvy_pos/core/utils/time_helper.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:savvy_pos/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:savvy_pos/features/shifts/domain/entities/shift_entities.dart';
import 'package:savvy_pos/features/shifts/domain/repositories/i_shift_repository.dart';
import 'package:savvy_pos/features/cash/presentation/pages/cash_drawer_page.dart';

class TimeClockPage extends StatefulWidget {
  const TimeClockPage({super.key});

  @override
  State<TimeClockPage> createState() => _TimeClockPageState();
}

class _TimeClockPageState extends State<TimeClockPage> {
  final _repo = GetIt.I<IShiftRepository>();
  ShiftSession? _currentShift;
  List<ShiftSession> _activeShifts = [];
  bool _isLoading = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _loadData();
    // Refresh elapsed time every minute
    _timer = Timer.periodic(const Duration(minutes: 1), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final authBloc = context.read<AuthBloc>();
      final employee = authBloc.state.employee;

      if (employee != null) {
        final current = await _repo.getCurrentShift(employee.uuid);
        final activeShifts = await _repo.getActiveShifts();

        if (mounted) {
          setState(() {
            _currentShift = current;
            _activeShifts = activeShifts;
            _isLoading = false;
          });
        }
      } else {
        setState(() => _isLoading = false);
      }
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _clockIn() async {
    final authBloc = context.read<AuthBloc>();
    final employee = authBloc.state.employee;

    if (employee == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please log in first')),
      );
      return;
    }

    try {
      final shift = await _repo.clockIn(employee.uuid, employee.name);
      setState(() => _currentShift = shift);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Clocked in at ${DateFormat('HH:mm').format(shift.startTime)}'),
            backgroundColor: Colors.green,
          ),
        );
      }
      _loadData();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  Future<void> _clockOut() async {
    final authBloc = context.read<AuthBloc>();
    final employee = authBloc.state.employee;

    if (employee == null || _currentShift == null) return;

    // Show tip declaration dialog (Toast-style Shift Review)
    final tips = await showDialog<double>(
      context: context,
      builder: (_) => _TipDeclarationDialog(shift: _currentShift!),
    );

    if (tips == null) return; // User cancelled

    try {
      final shift = await _repo.clockOut(employee.uuid, tipsDeclared: tips);
      setState(() => _currentShift = null);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Clocked out. Total: ${shift.workedHours.toStringAsFixed(1)} hours'),
            backgroundColor: Colors.blue,
          ),
        );
      }
      _loadData();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  String _formatElapsed() {
    if (_currentShift == null) return '00:00:00';
    final elapsed = TimeHelper.now().difference(_currentShift!.startTime);
    final hours = elapsed.inHours.toString().padLeft(2, '0');
    final minutes = (elapsed.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (elapsed.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  void _openCashDrawer() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const CashDrawerPage()));
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const Center(child: CircularProgressIndicator());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Clock'),
        actions: [
          IconButton(onPressed: _loadData, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Row(
        children: [
          // Left: Clock In/Out Panel
          Expanded(
            flex: 2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Status
                  Text(
                    _currentShift != null
                        ? 'Currently Clocked In'
                        : 'Not Clocked In',
                    style: TextStyle(
                      fontSize: 18,
                      color: _currentShift != null ? Colors.green : Colors.grey,
                    ),
                  ),
                  const Gap(16),

                  // Elapsed Time
                  if (_currentShift != null)
                    Text(
                      _formatElapsed(),
                      style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'monospace'),
                    ).animate(onPlay: (c) => c.repeat()).shimmer(
                        duration: 2000.ms,
                        color: Colors.green.withValues(alpha: 0.3)),

                  const Gap(32),

                  // Clock Button
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: ElevatedButton(
                      onPressed: _currentShift != null ? _clockOut : _clockIn,
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor:
                            _currentShift != null ? Colors.red : Colors.green,
                        foregroundColor: Colors.white,
                        elevation: 8,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                              _currentShift != null
                                  ? Icons.logout
                                  : Icons.login,
                              size: 48),
                          const Gap(8),
                          Text(
                            _currentShift != null ? 'Clock Out' : 'Clock In',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ).animate().scale(duration: 300.ms, curve: Curves.elasticOut),

                  const Gap(16),
                  if (_currentShift != null)
                    Text(
                      'Started at ${DateFormat('HH:mm').format(_currentShift!.startTime)}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                ],
              ),
            ),
          ),

          const VerticalDivider(width: 1),

          // Right: Who's Working (Manager View)
          Expanded(
            flex: 1,
            child: Container(
              color: Theme.of(context).colorScheme.surfaceContainerLowest,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.people, size: 20),
                      const Gap(8),
                      Text('Who\'s Working (${_activeShifts.length})',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                  const Gap(16),
                  const Divider(),
                  Expanded(
                    child: _activeShifts.isEmpty
                        ? const Center(
                            child: Text('No one clocked in',
                                style: TextStyle(color: Colors.grey)))
                        : ListView.builder(
                            itemCount: _activeShifts.length,
                            itemBuilder: (context, index) {
                              final shift = _activeShifts[index];
                              final elapsed =
                                  TimeHelper.now().difference(shift.startTime);
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor:
                                      Colors.green.withValues(alpha: 0.2),
                                  child: Text(shift.employeeName.isNotEmpty
                                      ? shift.employeeName[0].toUpperCase()
                                      : '?'),
                                ),
                                title: Text(shift.employeeName),
                                subtitle: Text(
                                    'Since ${DateFormat('HH:mm').format(shift.startTime)}'),
                                trailing: Text(
                                    '${elapsed.inHours}h ${elapsed.inMinutes % 60}m',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ).animate().fadeIn(delay: (index * 100).ms);
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: _currentShift != null
          ? FloatingActionButton.extended(
              onPressed: _openCashDrawer,
              icon: const Icon(Icons.point_of_sale),
              label: const Text('Cash Drawer'),
              backgroundColor: Colors.teal,
            )
          : null,
    );
  }
}

class _TipDeclarationDialog extends StatefulWidget {
  final ShiftSession shift;
  const _TipDeclarationDialog({required this.shift});

  @override
  State<_TipDeclarationDialog> createState() => _TipDeclarationDialogState();
}

class _TipDeclarationDialogState extends State<_TipDeclarationDialog> {
  final _controller = TextEditingController(text: '0');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final elapsed = TimeHelper.now().difference(widget.shift.startTime);

    return AlertDialog(
      title: const Text('Shift Review'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Shift Duration: ${elapsed.inHours}h ${elapsed.inMinutes % 60}m'),
          const Gap(16),
          TextField(
            controller: _controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: 'Tips Collected (\$)',
              prefixIcon: Icon(Icons.attach_money),
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final tips = double.tryParse(_controller.text) ?? 0.0;
            Navigator.pop(context, tips);
          },
          child: const Text('Clock Out'),
        ),
      ],
    );
  }
}
