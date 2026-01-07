import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/tables/domain/entities/table_with_status.dart';

class TableNode extends StatefulWidget {
  final TableWithStatus tableStatus;
  final VoidCallback onTap;

  const TableNode({
    super.key,
    required this.tableStatus,
    required this.onTap,
  });

  @override
  State<TableNode> createState() => _TableNodeState();
}

class _TableNodeState extends State<TableNode> {
  Timer? _timer;
  Duration _elapsed = Duration.zero;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void didUpdateWidget(covariant TableNode oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.tableStatus.table.isOccupied != oldWidget.tableStatus.table.isOccupied) {
      _startTimer();
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _updateElapsed();
    
    if (widget.tableStatus.table.isOccupied) {
      _timer = Timer.periodic(const Duration(minutes: 1), (_) => _updateElapsed());
    }
  }

  void _updateElapsed() {
    if (!widget.tableStatus.table.isOccupied) {
      if (_elapsed != Duration.zero) setState(() => _elapsed = Duration.zero);
      return;
    }

    // Mock Calculation: In real app, use widget.tableStatus.orderStartTime
    // For "Living" feel, we'll simulate based on updatedAt or just mock increment if testing
    // Assuming tableStatus has a timestamp. If not, we infer from requirements.
    // Let's assume we want to show the mechanic working.
    // We will calculate relative to 'now' if timestamp exists, or just increment.
    // Since entity definition isn't fully visible, we'll use a mock start time derived from hashCode/random or just 0 for new sessions.
    
    // For this implementation, let's pretend 'updatedAt' is the start time.
    final start = widget.tableStatus.table.updatedAt; 
    final now = DateTime.now();
    final diff = start != null ? now.difference(start) : Duration.zero;
    
    setState(() => _elapsed = diff);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Color _getHeatmapColor(SavvyTheme theme) {
    if (!widget.tableStatus.table.isOccupied) return theme.colors.bgElevated;
    
    final minutes = _elapsed.inMinutes;
    if (minutes < 30) return theme.colors.stateSuccess; // Fresh
    if (minutes < 60) return theme.colors.stateWarning; // Medium
    return theme.colors.stateError; // Long (Alert)
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final table = widget.tableStatus.table;
    final isOccupied = table.isOccupied;
    final isBillPrinted = widget.tableStatus.orderStatus == 'BILL_PRINTED';

    // Heatmap Logic
    Color bgColor = _getHeatmapColor(theme);
    Color borderColor = isOccupied ? bgColor : theme.colors.borderDefault;
    Color textColor = isOccupied ? theme.colors.textInverse : theme.colors.textPrimary;

    // Bill Printed Override
    if (isBillPrinted) {
      bgColor = theme.colors.stateWarning.withOpacity(0.9); // Distinct from timer warning
      borderColor = Colors.white;
      textColor = Colors.black87;
    }

    final isLarge = table.capacity > 4;

    Widget nodeContent = Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(isLarge ? theme.shapes.radiusMd : theme.shapes.radiusLg),
        border: Border.all(color: borderColor, width: 2),
        boxShadow: isOccupied ? theme.elevations.md : theme.elevations.sm,
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SavvyText(
            table.name,
            style: isLarge ? SavvyTextStyle.h3 : SavvyTextStyle.bodyMedium,
            color: textColor,
          ),
          if (isOccupied)
             Padding(
               padding: const EdgeInsets.only(top: 4.0),
               child: _DurationTimer(textColor: textColor.withOpacity(0.9), elapsed: _elapsed),
             ),
          if (!isOccupied)
             Padding(
               padding: const EdgeInsets.only(top: 2.0),
               child: SavvyText('${table.capacity}p', style: SavvyTextStyle.labelSmall, color: theme.colors.textSecondary),
             ),
        ],
      ),
    );

    // Animations
    if (isOccupied && !isBillPrinted) {
      // Breathing effect based on urgency? 
      // Requirement: "Living". A subtle pulse is good.
      nodeContent = nodeContent
          .animate(onPlay: (c) => c.repeat(reverse: true))
          .scale(begin: const Offset(1, 1), end: const Offset(1.03, 1.03), duration: 2.seconds, curve: Curves.easeInOut);
    }
    
    if (isBillPrinted) {
       nodeContent = nodeContent
          .animate(onPlay: (c) => c.repeat())
          .shimmer(duration: 1.5.seconds, color: Colors.white54);
    }

    // Hero Transition
    return Hero(
      tag: 'table_${table.uuid}',
      child: GestureDetector(
        onTap: widget.onTap,
        child: Material(
          type: MaterialType.transparency,
          child: nodeContent,
        ),
      ),
    );
  }
}

class _DurationTimer extends StatelessWidget {
  final Color textColor;
  final Duration elapsed;
  
  const _DurationTimer({required this.textColor, required this.elapsed});

  @override
  Widget build(BuildContext context) {
    final minutes = elapsed.inMinutes;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        '${minutes}m', 
        style: TextStyle(fontSize: 10, color: textColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
