import 'package:flutter/material.dart';
import 'package:savvy_pos/core/di/injection.dart';
import 'package:savvy_pos/features/tables/domain/entities/table.dart';
import 'package:savvy_pos/features/tables/domain/entities/zone.dart';
import 'package:savvy_pos/features/tables/domain/usecases/floor_plan_usecases.dart';
import 'package:savvy_pos/features/sales/presentation/pages/order_page.dart';
import 'package:savvy_pos/features/cash/presentation/pages/cash_management_page.dart';

class FloorPlanViewPage extends StatefulWidget {
  const FloorPlanViewPage({super.key});

  @override
  State<FloorPlanViewPage> createState() => _FloorPlanViewPageState();
}

class _FloorPlanViewPageState extends State<FloorPlanViewPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Zone>>(
      stream: getIt<WatchZonesUseCase>().call(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));

        final zones = snapshot.data!;
        if (zones.isEmpty)
          return const Scaffold(
              body: Center(child: Text('No Zones Configured')));

        return DefaultTabController(
          length: zones.length,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Floor Plan'),
              bottom: TabBar(
                isScrollable: true,
                tabs: zones.map((z) => Tab(text: z.name)).toList(),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    // Refresh logic if needed, but streams auto-update
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        foregroundColor: Colors.white,
                        elevation: 0,
                      ),
                      icon: const Icon(Icons.point_of_sale),
                      label: const Text('CASH / SHIFT'),
                      onPressed: () {
                        // Navigate to Cash Management.
                        // Using a fixed Shift UUID for this vertical slice demo.
                        // In a real app, this comes from the Auth/Shift Context.
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CashManagementPage(
                                shiftUuid: 'DEMO-SHIFT-001'),
                          ),
                        );
                      }),
                ),
              ],
            ),
            body: TabBarView(
              children:
                  zones.map((zone) => _ZoneView(zoneId: zone.id)).toList(),
            ),
          ),
        );
      },
    );
  }
}

class _ZoneView extends StatelessWidget {
  final String zoneId;
  const _ZoneView({required this.zoneId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SavvyTable>>(
      stream: getIt<WatchTablesUseCase>().call(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return const Center(child: CircularProgressIndicator());

        final tables = snapshot.data!.where((t) => t.zoneId == zoneId).toList();

        return InteractiveViewer(
          constrained: false,
          boundaryMargin: const EdgeInsets.all(100),
          minScale: 0.1,
          maxScale: 2.0,
          child: Container(
            width: 2000,
            height: 2000,
            color: Colors.white,
            child: Stack(
              children: tables.map((table) {
                return Positioned(
                  left: table.x,
                  top: table.y,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => OrderPage(
                            tableUuid: table.id,
                            tableName: table.name,
                            customerUuid:
                                null, // Could be fetched from table metadata
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: table.width,
                      height: table.height,
                      decoration: BoxDecoration(
                        color: table.isOccupied
                            ? Colors.red[100]
                            : Colors.green[100],
                        border: Border.all(
                            color: table.isOccupied ? Colors.red : Colors.green,
                            width: 2),
                        shape: table.shape == TableShape.round
                            ? BoxShape.circle
                            : BoxShape.rectangle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 4),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(table.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          Text('${table.capacity} Pax',
                              style: const TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
