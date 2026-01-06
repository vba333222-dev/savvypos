import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/features/tables/presentation/bloc/table_bloc.dart';
import 'package:savvy_pos/features/tables/presentation/widgets/floor_stat_badge.dart';
import 'package:savvy_pos/features/tables/presentation/widgets/table_node.dart';
import 'package:savvy_pos/features/pos/presentation/pages/pos_page.dart';

class FloorPlanPage extends StatelessWidget {
  const FloorPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<TableBloc>()..add(const TableEvent.loadTables()),
      child: const _FloorPlanView(),
    );
  }
}

class _FloorPlanView extends StatelessWidget {
  const _FloorPlanView();

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    
    // Canvas dimensions (Fixed virtual canvas for InteractiveViewer)
    // We map 0.0-1.0 coords to this size.
    const double canvasWidth = 2000.0;
    const double canvasHeight = 1500.0;

    return Scaffold(
      backgroundColor: theme.colors.bgPrimary,
      body: Stack(
        children: [
          // 1. Interactive Floor Plan
          InteractiveViewer(
            boundaryMargin: const EdgeInsets.all(double.infinity),
            minScale: 0.5,
            maxScale: 2.0,
            constrained: false, // Infinite canvas feeling
            child: Container(
              width: canvasWidth,
              height: canvasHeight,
              color: theme.colors.bgPrimary,
              child: CustomPaint(
                painter: _DotGridPainter(color: theme.colors.borderDefault.withOpacity(0.3)),
                child: BlocBuilder<TableBloc, TableState>(
                  builder: (context, state) {
                    if (state.isLoading) return const Center(child: CircularProgressIndicator());
                    
                    return Stack(
                      children: state.tables.map((tableStatus) {
                      final t = tableStatus.table;
                      // Mapping 0.0-1.0 to canvas pixels
                      final double left = t.x * canvasWidth;
                      final double top = t.y * canvasHeight;
                      
                      // Using fixed sizes for now, could be dynamic
                      final double width = t.capacity > 4 ? 160.0 : 100.0;
                      final double height = t.capacity > 4 ? 120.0 : 100.0;

                      return Positioned(
                        left: left,
                        top: top,
                        child: SizedBox(
                          width: width,
                          height: height,
                          child: TableNode(
                            tableStatus: tableStatus,
                            onTap: () {
                              // Navigate to POS with table args
                              // Mock passing table via route/bloc
                              // In real app, we set CurrentOrderBloc -> Table
                              Navigator.push(context, MaterialPageRoute(builder: (_) => const PosPage())); 
                            },
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ),
          
          // 2. Sticky Header Badge (Top Center)
          Positioned(
            top: theme.shapes.spacingLg,
            left: 0, 
            right: 0,
            child: Center(
              child: BlocBuilder<TableBloc, TableState>(
                builder: (context, state) {
                  final free = state.tables.where((t) => !t.table.isOccupied).length;
                  final occupied = state.tables.where((t) => t.table.isOccupied).length;
                  // Mock reservations count as it's not in stats yet easily
                  const reserved = 0; 
                  
                  return FloorStatBadge(
                    freeCount: free,
                    occupiedCount: occupied,
                    reservationCount: reserved,
                  );
                },
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
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
