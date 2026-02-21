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

class _FloorPlanCanvas extends StatefulWidget {
  final FloorMode mode;
  final VoidCallback onModeToggle;

  const _FloorPlanCanvas({required this.mode, required this.onModeToggle});

  @override
  State<_FloorPlanCanvas> createState() => _FloorPlanCanvasState();
}

class _FloorPlanCanvasState extends State<_FloorPlanCanvas> {
  // State for Ghost Snapping
  Rect? _ghostRect;
  
  // State for HUD Interaction
  bool _isInteracting = false;

  // Constants
  static const double canvasWidth = 2000.0;
  static const double canvasHeight = 1500.0;
  static const double gridSize = 40.0;
  final GlobalKey _canvasKey = GlobalKey();

  void _handleDragUpdate(DragUpdateDetails details, Size tableSize) {
    final RenderBox? box = _canvasKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null) return;

    // Convert global drag position to local canvas position
    // Note: Draggable feedback is under finger, usually centered or top-left depending on anchor.
    // We assume default anchor. We might need to adjust offset.
    final localPos = box.globalToLocal(details.globalPosition);

    // Grid Snap Logic
    double snappedX = (localPos.dx / gridSize).round() * gridSize;
    double snappedY = (localPos.dy / gridSize).round() * gridSize;

    // Clamp
    if (snappedX < 0) snappedX = 0;
    if (snappedY < 0) snappedY = 0;
    if (snappedX > canvasWidth - tableSize.width) snappedX = canvasWidth - tableSize.width;
    if (snappedY > canvasHeight - tableSize.height) snappedY = canvasHeight - tableSize.height;

    setState(() {
      _ghostRect = Rect.fromLTWH(snappedX, snappedY, tableSize.width, tableSize.height);
    });
  }

  void _handleDragEnd() {
    setState(() => _ghostRect = null);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Stack(
      children: [
        // 1. Zoomable Canvas
        InteractiveViewer(
          boundaryMargin: const EdgeInsets.all(double.infinity),
          minScale: 0.5,
          maxScale: 2.0,
          constrained: false,
          onInteractionStart: (_) => setState(() => _isInteracting = true),
          onInteractionEnd: (_) => setState(() => _isInteracting = false),
          child: DragTarget<String>(
            onWillAcceptWithDetails: (details) => widget.mode == FloorMode.layout,
            onAcceptWithDetails: (details) {
              final tableUuid = details.data;
              final RenderBox box = _canvasKey.currentContext!.findRenderObject() as RenderBox;
              final localPos = box.globalToLocal(details.offset);
              
              // Reuse Snap Logic for final consistency
              double snappedX = (localPos.dx / gridSize).round() * gridSize;
              double snappedY = (localPos.dy / gridSize).round() * gridSize;

               // Clamp
              if (snappedX < 0) snappedX = 0;
              if (snappedY < 0) snappedY = 0;
              if (snappedX > canvasWidth - 100) snappedX = canvasWidth - 100; // conservative clamp
              if (snappedY > canvasHeight - 100) snappedY = canvasHeight - 100;

              final normX = snappedX / canvasWidth;
              final normY = snappedY / canvasHeight;

              HapticFeedback.heavyImpact();
              context.read<TableBloc>().add(TableEvent.moveTable(tableUuid, normX, normY));
              
              _handleDragEnd(); // Clear ghost
            },
            builder: (context, candidates, rejected) {
              return Container(
                key: _canvasKey,
                width: canvasWidth,
                height: canvasHeight,
                color: theme.colors.bgPrimary,
                child: CustomPaint(
                  painter: _DotGridPainter(
                    color: theme.colors.borderDefault.withValues(alpha: widget.mode == FloorMode.layout ? 0.4 : 0.12)
                  ),
                  child: BlocBuilder<TableBloc, TableState>(
                    builder: (context, state) {
                      if (state.isLoading) return const Center(child: CircularProgressIndicator());
                      
                      return Stack(
                        children: [
                          // LAYER A: HOST GHOST
                          if (_ghostRect != null && widget.mode == FloorMode.layout)
                            Positioned(
                              left: _ghostRect!.left,
                              top: _ghostRect!.top,
                              width: _ghostRect!.width,
                              height: _ghostRect!.height,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: theme.colors.brandPrimary.withValues(alpha: 0.2),
                                  border: Border.all(color: theme.colors.brandPrimary, width: 2, style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(theme.shapes.radiusMd),
                                ),
                                child: Center(
                                  child: Icon(Icons.add, color: theme.colors.brandPrimary.withValues(alpha: 0.5)),
                                ),
                              ).animate(onPlay: (c) => c.repeat(reverse: true)).fade(begin: 0.5, end: 0.8),
                            ),

                          // LAYER B: TABLES
                          ...state.tables.map((table) {
                            final t = table;
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
                                  tableStatus: table,
                                  mode: widget.mode,
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (_) => PosPage(heroTag: 'table_${t.id}')
                                    )); 
                                  },
                                  onOrderMerge: (src, dst) {
                                    final targetTable = state.tables.firstWhere((tbl) => tbl.id == dst);
                                    if (targetTable.isOccupied) {
                                      showDialog(
                                        context: context,
                                        builder: (dialogCtx) => AlertDialog(
                                          title: Text('Gabungkan Tagihan?', style: TextStyle(color: theme.colors.textPrimary)),
                                          content: Text('Apakah Anda yakin ingin memindahkan tagihan dari Meja $src ke Meja ${targetTable.name}?', style: TextStyle(color: theme.colors.textSecondary)),
                                          backgroundColor: theme.colors.bgElevated,
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(dialogCtx),
                                              child: Text('Batal', style: TextStyle(color: theme.colors.textSecondary)),
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(backgroundColor: theme.colors.stateWarning, foregroundColor: theme.colors.textInverse),
                                              onPressed: () {
                                                Navigator.pop(dialogCtx);
                                                context.read<TableBloc>().add(TableEvent.mergeTables(src, dst));
                                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Menggabungkan Tagihan...')));
                                              },
                                              child: const Text('Gabungkan'),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      // Transfer
                                      context.read<TableBloc>().add(TableEvent.transferTable(src, dst));
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Memindah pesanan ke Meja ${targetTable.name}...')));
                                    }
                                  },
                                  onDragUpdate: (details) => _handleDragUpdate(details, Size(width, height)),
                                ),
                              ),
                            );
                          }),
                        ],
                      );
                    },
                  ),
                ),
              );
            }
          ),
        ),
        
        // 2. Sticky Header Badge (HUD)
        Visibility(
          visible: widget.mode == FloorMode.service,
          child: Positioned(
            top: theme.shapes.spacingLg,
            left: 0, 
            right: 0,
            child: Center(
              child: BlocBuilder<TableBloc, TableState>(
                builder: (context, state) {
                  final free = state.tables.where((t) => !t.isOccupied).length;
                  final occupied = state.tables.where((t) => t.isOccupied).length;
                  
                  return FloorStatBadge(
                    freeCount: free,
                    occupiedCount: occupied,
                    reservationCount: 0,
                    isCondensed: _isInteracting, // HUD Logic
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
            heroTag: 'back_btn', // avoid hero conflict
            backgroundColor: theme.colors.bgElevated,
            child: Icon(Icons.arrow_back, color: theme.colors.textPrimary),
            onPressed: () => Navigator.pop(context),
          ),
        ),

        // 4. Mode Toggle (Bottom Right)
        Positioned(
          right: theme.shapes.spacingLg,
          bottom: theme.shapes.spacingLg,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (widget.mode == FloorMode.layout)
                Padding(
                  padding: EdgeInsets.only(bottom: theme.shapes.spacingMd),
                  child: FloatingActionButton(
                    heroTag: 'add_table_btn',
                    backgroundColor: theme.colors.brandPrimary,
                    child: const Icon(Icons.add, color: Colors.white),
                    onPressed: () => _showAddTableDialog(context),
                  ).animate().scale(duration: 200.ms, curve: Curves.easeOutBack),
                ),
              FloorModeToggle(
                mode: widget.mode,
                onToggle: widget.onModeToggle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showAddTableDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Table'),
        content: TextField(
          controller: controller, // Use local controller
          decoration: const InputDecoration(
            labelText: 'Table Name / Number',
            hintText: 'e.g. T-10, A1',
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                // Default position center of screen sort of
                context.read<TableBloc>().add(TableEvent.addTable(controller.text, 500, 500));
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
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
