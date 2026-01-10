import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';

class LivePulseTile extends StatelessWidget {
  final int activeTables;
  final int pendingOrders;
  final int staffActive;

  const LivePulseTile({
    super.key,
    required this.activeTables,
    required this.pendingOrders,
    required this.staffActive,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Stack(
      children: [
        // Background Pulse
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [theme.colors.stateSuccess.withValues(alpha: 0.1), Colors.transparent],
                stops: const [0.5, 1.0],
                center: Alignment.center,
                radius: 1.2,
              ),
            ),
          )
          .animate(onPlay: (c) => c.repeat(reverse: true))
          .scale(begin: const Offset(0.9, 0.9), end: const Offset(1.1, 1.1), duration: 2.seconds)
          .fade(begin: 0.3, end: 0.6),
        ),

        // Content
        Padding(
          padding: EdgeInsets.all(theme.shapes.spacingMd),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.monitor_heart, color: theme.colors.stateSuccess),
                  SizedBox(width: 8),
                  SavvyText('Live Pulse', style: SavvyTextStyle.labelMedium, color: theme.colors.textSecondary),
                ],
              ),
              Spacer(),
              
              _StatRow(label: 'Active Tables', value: '$activeTables', color: theme.colors.textPrimary),
              SizedBox(height: 8),
              _StatRow(label: 'Pending Orders', value: '$pendingOrders', color: theme.colors.stateWarning),
               SizedBox(height: 8),
              _StatRow(label: 'Staff Online', value: '$staffActive', color: theme.colors.brandSecondary),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatRow extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _StatRow({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: Colors.black54, fontSize: 13)),
        Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
      ],
    );
  }
}
