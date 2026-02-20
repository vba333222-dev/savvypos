import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/features/tables/domain/entities/table.dart';
import 'package:savvy_pos/features/tables/presentation/widgets/floor_mode_toggle.dart';
import 'package:savvy_pos/features/tables/presentation/widgets/table_node.dart';

class MovableTableNode extends StatefulWidget {
  final SavvyTable tableStatus;
  final FloorMode mode;
  final VoidCallback onTap;
  final Function(String sourceUuid, String targetUuid)? onOrderMerge; // Service Mode
  final Function(DragUpdateDetails)? onDragUpdate; // Layout Mode: for Ghost

  const MovableTableNode({
    super.key,
    required this.tableStatus,
    required this.mode,
    required this.onTap,
    this.onOrderMerge,
    this.onDragUpdate,
  });

  @override
  State<MovableTableNode> createState() => _MovableTableNodeState();
}

class _MovableTableNodeState extends State<MovableTableNode> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final t = widget.tableStatus;
    final isLayout = widget.mode == FloorMode.layout;

    // --- LAYOUT MODE: Move Furniture ---
    if (isLayout) {
      return LongPressDraggable<String>(
        data: t.id,
        onDragUpdate: widget.onDragUpdate,
        feedback: Material(
          color: Colors.transparent,
          type: MaterialType.transparency,
          child: ConstrainedBox( // Constrain feedback size
             constraints: const BoxConstraints(maxWidth: 160, maxHeight: 120),
             child: TableNode(tableStatus: widget.tableStatus, onTap: () {}),
          ),
        )
        .animate()
        // Pop Effect: Scale from 1.0 to 1.15 elastic
        .scale(begin: const Offset(1, 1), end: const Offset(1.15, 1.15), duration: 400.ms, curve: Curves.elasticOut) 
        .boxShadow(begin: BoxShadow(color: Colors.black26, blurRadius: 0), end: BoxShadow(color: Colors.black45, blurRadius: 20)), 
        
        childWhenDragging: Opacity(
          opacity: 0.3,
          child: TableNode(tableStatus: widget.tableStatus, onTap: () {}), 
        ),
        onDragStarted: () => HapticFeedback.selectionClick(),
        child: TableNode(tableStatus: widget.tableStatus, onTap: () {}), 
      ).animate(target: 1).shimmer(duration: 1.seconds, delay: 2.seconds); // Subtle hint it's editable
    }

    // --- SERVICE MODE: Move Orders ---
    // Using simple String for "Order UUID" (simulated by Table UUID for now as 'Order from Table X')
    return DragTarget<String>(
      onWillAcceptWithDetails: (details) {
        final sourceUuid = details.data;
        if (sourceUuid != t.id) {
          setState(() => _isHovering = true);
          HapticFeedback.lightImpact();
          return true;
        }
        return false;
      },
      onLeave: (_) => setState(() => _isHovering = false),
      onAcceptWithDetails: (details) {
        setState(() => _isHovering = false);
        HapticFeedback.mediumImpact();
        widget.onOrderMerge?.call(details.data, t.id);
      },
      builder: (context, candidates, rejected) {
        Widget child = TableNode(tableStatus: widget.tableStatus, onTap: widget.onTap);
        
        // Pulse effect if hovering
        if (_isHovering) {
          child = child.animate(onPlay: (c) => c.repeat(reverse: true))
              .scale(begin: const Offset(1, 1), end: const Offset(1.1, 1.1), duration: 200.ms)
              .tint(color: Colors.greenAccent.withValues(alpha: 0.4));
        }

        // If Occupied, allow dragging OUT the order
        if (widget.tableStatus.isOccupied) {
          return LongPressDraggable<String>(
            data: t.id, // Source Table UUID
            feedback: Material(
              color: Colors.transparent,
              child: Container(
                width: 60, height: 60,
                decoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)]),
                alignment: Alignment.center,
                child: Icon(Icons.receipt, color: Colors.white),
              ),
            ),
            childWhenDragging: Opacity(opacity: 0.5, child: child),
            onDragStarted: () => HapticFeedback.selectionClick(),
            child: child,
          );
        }
        
        return child;
      },
    );
  }
}
