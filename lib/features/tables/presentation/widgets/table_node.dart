import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/tables/domain/entities/table_with_status.dart';

class TableNode extends StatelessWidget {
  final TableWithStatus tableStatus;
  final VoidCallback onTap;

  const TableNode({
    super.key,
    required this.tableStatus,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final table = tableStatus.table;
    final isOccupied = table.isOccupied;
    final isBillPrinted = tableStatus.orderStatus == 'BILL_PRINTED';

    // Determine Color
    Color bgColor = theme.colors.bgElevated;
    Color borderColor = theme.colors.borderDefault;
    Color textColor = theme.colors.textPrimary;

    if (isOccupied) {
      bgColor = theme.colors.brandPrimary;
      borderColor = theme.colors.brandPrimary;
      textColor = theme.colors.textInverse;
    }

    if (isBillPrinted) {
      bgColor = theme.colors.stateWarning;
      borderColor = theme.colors.stateWarning;
      textColor = Colors.black87;
    }

    // Determine Shape/Size
    // Heuristic: Capacity > 4 is Rect, <= 4 is Circle/Squircle? 
    // For consisteny with "Antigravity", let's use Squirciles (Rounded Rects) universally but vary size.
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
               child: _DurationTimer(textColor: textColor.withOpacity(0.8)),
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
    if (isOccupied) {
      nodeContent = nodeContent
          .animate(onPlay: (c) => c.repeat(reverse: true))
          .scale(begin: const Offset(1, 1), end: const Offset(1.05, 1.05), duration: 2.seconds, curve: Curves.easeInOut);
    }
    
    if (isBillPrinted) {
       nodeContent = nodeContent
          .animate(onPlay: (c) => c.repeat())
          .shimmer(duration: 1.5.seconds, color: Colors.white54);
    }

    return GestureDetector(
      onTap: onTap,
      child: nodeContent,
    );
  }
}

class _DurationTimer extends StatelessWidget {
  final Color textColor;
  const _DurationTimer({required this.textColor});

  @override
  Widget build(BuildContext context) {
    // Mock duration for now as start time isn't strictly in TableWithStatus yet
    // In real app, calculate from tableStatus.orderStartTime
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        '25m', // Mock
        style: TextStyle(fontSize: 10, color: textColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
