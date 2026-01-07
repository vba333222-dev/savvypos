import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/features/tables/presentation/bloc/table_bloc.dart';
import 'package:savvy_pos/features/tables/presentation/widgets/floor_stat_badge.dart';
import 'package:savvy_pos/features/tables/presentation/widgets/floor_mode_toggle.dart';
import 'package:savvy_pos/features/tables/presentation/widgets/movable_table_node.dart';
import 'package:savvy_pos/features/pos/presentation/pages/pos_page.dart';

class FloorPlanPage extends StatefulWidget {
  const FloorPlanPage({super.key});

  @override
  State<FloorPlanPage> createState() => _FloorPlanPageState();
}

class _FloorPlanPageState extends State<FloorPlanPage> {
  final ValueNotifier<FloorMode> _mode = ValueNotifier(FloorMode.service);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<TableBloc>()..add(const TableEvent.loadTables()),
      child: Scaffold(
        body: ValueListenableBuilder<FloorMode>(
          valueListenable: _mode,
          builder: (context, mode, child) {
            return _FloorPlanCanvas(mode: mode, onModeToggle: () {
               _mode.value = mode == FloorMode.service ? FloorMode.layout : FloorMode.service;
            });
          },
        ),
      ),
    );
  }
}

class _FloorPlanCanvas extends StatelessWidget {
  final FloorMode mode;
  final VoidCallback onModeToggle;

  const _FloorPlanCanvas({required this.mode, required this.onModeToggle});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    
    // Canvas dimensions
    const double canvasWidth = 2000.0;
    const double canvasHeight = 1500.0;
    const double gridSize = 40.0;

    return Stack(
      children: [
        // 1. Zoomable Canvas
        InteractiveViewer(
          boundaryMargin: const EdgeInsets.all(double.infinity),
          minScale: 0.5,
          maxScale: 2.0,
          constrained: false, 
          panEnabled: true, // Should disable if dragging? Usually Draggable swallows events.
          child: DragTarget<String>(
            // Canvas handles Table Moves in Layout Mode
            onWillAccept: (data) => mode == FloorMode.layout && data != null,
            onAcceptWithDetails: (details) {
              final tableUuid = details.data;
              final renderBox = context.findRenderObject() as RenderBox;
              final localPos = renderBox.globalToLocal(details.offset);
              
              // Magnetic Grid Snap
              // 1. Calculate drop position relative to Canvas 0,0 (Need to account for Viewer? 
              //    InteractiveViewer transforms coordinate space. 'localPos' inside this child Container should be correct relative to Canvas origin.)
              
              // Adjust for table center (assuming 100x100 approx) or just snap top-left? Top-Left is easier.
              double x = localPos.dx;
              double y = localPos.dy;

              // Snap Math:
              double snappedX = (x / gridSize).round() * gridSize;
              double snappedY = (y / gridSize).round() * gridSize;

              // Clamp to bounds
              if (snappedX < 0) snappedX = 0;
              if (snappedY < 0) snappedY = 0;
              if (snappedX > canvasWidth - 100) snappedX = canvasWidth - 100;
              if (snappedY > canvasHeight - 100) snappedY = canvasHeight - 100;

              // Convert back to 0.0-1.0 normalized coords
              final normX = snappedX / canvasWidth;
              final normY = snappedY / canvasHeight;

              HapticFeedback.heavyImpact();
              context.read<TableBloc>().add(TableEvent.moveTable(tableUuid, normX, normY));
            },
            builder: (context, candidates, rejected) {
              return Container(
                width: canvasWidth,
                height: canvasHeight,
                color: theme.colors.bgPrimary,
                child: CustomPaint(
                  painter: _DotGridPainter(
                    color: theme.colors.borderDefault.withAlpha(mode == FloorMode.layout ? 100 : 30) // Fade grid in service mode
                  ),
                  child: BlocBuilder<TableBloc, TableState>(
                    builder: (context, state) {
                      if (state.isLoading) return const Center(child: CircularProgressIndicator());
                      
                      return Stack(
                        children: state.tables.map((tableStatus) {
                          final t = tableStatus.table;
                          final double left = t.x * canvasWidth;
                          final double top = t.y * canvasHeight;
                          
                          final double width = t.capacity > 4 ? 160.0 : 100.0;
                          final double height = t.capacity > 4 ? 120.0 : 100.0;
            
                          return Positioned(
                            left: left,
                            top: top,
                            child: SizedBox(
                              width: width,
                              height: height,
                              child: MovableTableNode(
                                tableStatus: tableStatus,
                                mode: mode,
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => const PosPage())); 
                                },
                                onOrderMerge: (src, dst) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Merging Order $src into $dst')));
                                  // Call Bloc to merge
                                },
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
              );
            }
          ),
        ),
        
        // 2. Sticky Header Badge (Top Center) - Only visible in Service Mode to clear clutter? Or always?
        Visibility(
          visible: mode == FloorMode.service,
          child: Positioned(
            top: theme.shapes.spacingLg,
            left: 0, 
            right: 0,
            child: Center(
              child: BlocBuilder<TableBloc, TableState>(
                builder: (context, state) {
                  final free = state.tables.where((t) => !t.table.isOccupied).length;
                  final occupied = state.tables.where((t) => t.table.isOccupied).length;
                  
                  return FloorStatBadge(
                    freeCount: free,
                    occupiedCount: occupied,
                    reservationCount: 0,
                  ).animate().slideY(begin: -1, end: 0, duration: 300.ms, curve: Curves.easeOut);
                },
              ),
            ),
          ),
        ),
        
        // 3. Back Button
        Positioned(
          left: theme.shapes.spacingMd,
          top: theme.shapes.spacingMd,
          child: FloatingActionButton.small(
            backgroundColor: theme.colors.bgElevated,
            child: Icon(Icons.arrow_back, color: theme.colors.textPrimary),
            onPressed: () => Navigator.pop(context),
          ),
        ),

        // 4. Mode Toggle (Bottom Right)
        Positioned(
          right: theme.shapes.spacingLg,
          bottom: theme.shapes.spacingLg,
          child: FloorModeToggle(
            mode: mode,
            onToggle: onModeToggle,
          ),
        ),
      ],
    );
  }
}

class _DotGridPainter extends CustomPainter {
  final Color color;
  const _DotGridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0;

    const double step = 40.0;
    for (double y = 0; y < size.height; y += step) {
      for (double x = 0; x < size.width; x += step) {
        canvas.drawCircle(Offset(x, y), 1.5, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DotGridPainter oldDelegate) => color != oldDelegate.color;
}
