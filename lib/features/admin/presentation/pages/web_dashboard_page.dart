import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/features/dashboard/presentation/widgets/dashboard_grid.dart';
import 'package:savvy_pos/features/dashboard/presentation/widgets/sales_velocity_chart.dart';
import 'package:savvy_pos/features/dashboard/presentation/widgets/live_pulse_tile.dart';
import 'package:savvy_pos/features/dashboard/presentation/widgets/command_bar.dart';
import 'package:savvy_pos/features/dashboard/presentation/bloc/dashboard_bloc.dart'; 

class WebDashboardPage extends StatelessWidget {
  const WebDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<DashboardBloc>()..add(const DashboardEvent.loadData()),
      child: const _DashboardView(),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return Scaffold(
      backgroundColor: theme.colors.bgCanvas,
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
           if (state is DashboardLoading) {
            return const Center(child: CircularProgressIndicator());
           }
           if (state is DashboardError) {
             return Center(child: Text("Error: ${state.message}"));
           }
           
           // Default/Loaded State
           final salesData = (state is DashboardLoaded) ? state.last7DaysSales.map((e) => e.total).toList() : <double>[];
           // Mock data if empty for visualization
           final displaySalesData = salesData.isEmpty ? [120.0, 150.0, 180.0, 130.0, 220.0, 260.0, 310.0, 290.0] : salesData;
           
           final activeTables = 12; // Standardize/Mock until backend provides
           final pendingOrders = (state is DashboardLoaded) ? state.pendingSyncCount : 0; 

          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Padding(
                    padding: EdgeInsets.fromLTRB(theme.shapes.spacingLg, theme.shapes.spacingLg, theme.shapes.spacingLg, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SavvyText('Commander', style: SavvyTextStyle.h1),
                            SavvyText('Operational Overview • Online', style: SavvyTextStyle.labelMedium, color: theme.colors.stateSuccess),
                          ],
                        ),
                        CircleAvatar(
                          backgroundColor: theme.colors.brandPrimary,
                          child: Text('A', style: TextStyle(color: theme.colors.textInverse)),
                        ),
                      ],
                    ),
                  ),

                  // GRID
                  Expanded(
                    child: DashboardGrid(
                      children: [
                        // A: Sales Velocity (Big Hero Chart) - 2x2
                        StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 2,
                          child: BentoTile(
                            child: Padding(
                              padding: EdgeInsets.all(theme.shapes.spacingMd),
                              child: SalesVelocityChart(hourlyData: displaySalesData), 
                            ),
                          ),
                        ),

                        // B: Live Pulse (Status) - 1x1
                        StaggeredGridTile.count(
                           crossAxisCellCount: 1,
                           mainAxisCellCount: 1,
                           child: BentoTile(
                             child: LivePulseTile(activeTables: activeTables, pendingOrders: pendingOrders, staffActive: 3),
                           ),
                        ),

                        // C: Top Movers - 1x1 (Tall vertical in 2 cols view, usually fits nicely)
                        // Note: If 2 columns, it fills a slot.
                        StaggeredGridTile.count(
                           crossAxisCellCount: 1,
                           mainAxisCellCount: 2, 
                           child: BentoTile(
                             child: Padding(
                               padding: EdgeInsets.all(theme.shapes.spacingMd),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   SavvyText('Top Movers', style: SavvyTextStyle.h3),
                                   SizedBox(height: theme.shapes.spacingSm),
                                   Expanded(
                                     child: (state is DashboardLoaded) 
                                       ? ListView.builder(
                                           itemCount: state.topProducts.length,
                                           itemBuilder: (ctx, idx) => _TopItem(
                                             rank: idx + 1, 
                                             name: state.topProducts[idx].productName, 
                                             count: state.topProducts[idx].quantity.toInt()
                                           ),
                                         )
                                       : const Center(child: Text('No Data')),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                        ),
                        
                        // D: Alerts / Staff
                        StaggeredGridTile.count(
                           crossAxisCellCount: 1,
                           mainAxisCellCount: 1,
                           child: BentoTile(
                             child: Padding(
                               padding: EdgeInsets.all(theme.shapes.spacingMd),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Row(
                                     children: [
                                       Icon(Icons.notifications_active, color: theme.colors.brandPrimary),
                                       SizedBox(width: 8),
                                       SavvyText('Alerts', style: SavvyTextStyle.h3),
                                     ],
                                   ),
                                   Spacer(),
                                   if (state is DashboardLoaded && state.pendingSyncCount > 0)
                                      SavvyText('• ${state.pendingSyncCount} Unsynced', color: theme.colors.stateWarning),
                                   SavvyText('• System Nominal', color: theme.colors.stateSuccess),
                                 ],
                               ),
                             ),
                           ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              // Floating Command Bar
              const Positioned(
                bottom: 32,
                left: 0, 
                right: 0,
                child: Center(child: CommandBar()),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _TopItem extends StatelessWidget {
  final int rank;
  final String name;
  final int count;

  const _TopItem({required this.rank, required this.name, required this.count});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 24, height: 24, 
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
            child: Text('$rank', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          ),
          SizedBox(width: 8),
          Expanded(child: Text(name)),
          Text('$count', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
