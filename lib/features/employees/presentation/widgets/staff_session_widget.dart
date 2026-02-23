import 'package:savvy_pos/core/utils/time_helper.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';

class StaffSessionWidget extends StatefulWidget {
  final String employeeName;
  final String employeeInitials;
  final DateTime shiftStartTime;

  const StaffSessionWidget(
      {super.key,
      required this.employeeName,
      required this.employeeInitials,
      required this.shiftStartTime});

  @override
  State<StaffSessionWidget> createState() => _StaffSessionWidgetState();
}

class _StaffSessionWidgetState extends State<StaffSessionWidget> {
  late Timer _timer;
  Duration _duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() => _updateTime());
    });
  }

  void _updateTime() {
    _duration = TimeHelper.now().difference(widget.shiftStartTime);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final h = _duration.inHours.toString().padLeft(2, '0');
    final m = (_duration.inMinutes % 60).toString().padLeft(2, '0');

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colors.bgSurface,
        borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
        border: Border.all(color: theme.colors.borderDefault),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: theme.colors.brandPrimary.withValues(alpha: 0.1),
            foregroundColor: theme.colors.brandPrimary,
            child: Text(widget.employeeInitials),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(widget.employeeName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: theme.colors.textPrimary)),
                Row(
                  children: [
                    Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                            color: theme.colors.stateSuccess,
                            shape: BoxShape.circle)),
                    const SizedBox(width: 4),
                    Text('On Shift • $h:$m',
                        style: TextStyle(
                            fontSize: 12, color: theme.colors.textSecondary)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
