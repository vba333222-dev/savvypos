import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/reservations/presentation/bloc/reservation_bloc.dart';
import 'package:savvy_pos/features/reservations/presentation/pages/reservation_calendar_page.dart';
import 'package:savvy_pos/features/reservations/presentation/pages/create_reservation_wizard.dart'; // Wizard
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/tables/presentation/bloc/table_bloc.dart';

class ReservationListPage extends StatefulWidget {
  const ReservationListPage({super.key});

  @override
  State<ReservationListPage> createState() => _ReservationListPageState();
}

class _ReservationListPageState extends State<ReservationListPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservations'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'List View', icon: Icon(Icons.list)),
            Tab(text: 'Host View', icon: Icon(Icons.calendar_month)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
               // Use new Wizard
               Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CreateReservationWizard()));
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(), // Calendar needs its own touch handling
        children: const [
           _ReservationListView(),
           ReservationCalendarPage(),
        ],
      ),
    );
  }
}

class _ReservationListView extends StatelessWidget {
  const _ReservationListView();

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    
    return BlocBuilder<ReservationBloc, ReservationState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox(),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (msg) => Center(child: Text('Error: $msg')),
          loaded: (reservations) {
            if (reservations.isEmpty) return const Center(child: Text('No Reservations'));
            
            // Sort by time
            final sorted = List<ReservationTableData>.from(reservations)
              ..sort((a, b) => a.reservationTime.compareTo(b.reservationTime));

            return ListView.builder(
              itemCount: sorted.length,
              itemBuilder: (context, index) {
                final r = sorted[index];
                final timeStr = DateFormat('MMM dd, HH:mm').format(r.reservationTime);
                
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: colors.brandPrimary,
                      child: Text('${r.pax}', style: TextStyle(color: colors.textInverse)),
                    ),
                    title: Text(r.customerName),
                    subtitle: Text('$timeStr - ${r.phone ?? "No Phone"}\nStatus: ${r.status}'),
                    trailing: (r.status == 'PENDING') 
                      ? ElevatedButton(
                          onPressed: () => _showCheckInDialog(context, r),
                          child: const Text('Check In'),
                        )
                      : Text(r.status, style: TextStyle(fontWeight: FontWeight.bold, color: r.status == 'SEATED' ? colors.stateSuccess : colors.textSecondary)),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  void _showCheckInDialog(BuildContext context, ReservationTableData r) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Check In ${r.customerName}'),
        content: SizedBox(
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Assign to Table:'),
              const SizedBox(height: 16),
              BlocBuilder<TableBloc, TableState>(
                builder: (context, state) {
                  if (state.isLoading) return const CircularProgressIndicator();
                  final availableTables = state.tables.where((t) => !t.isOccupied).toList();
                  
                  if (availableTables.isEmpty) return const Text('No available tables!', style: TextStyle(color: Colors.red));
                  
                  return SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: availableTables.length,
                      itemBuilder: (ctx, idx) {
                        final t = availableTables[idx];
                        return ListTile(
                          title: Text(t.name),
                          subtitle: Text('Capacity: ${t.capacity}'),
                          onTap: () {
                            context.read<ReservationBloc>().add(ReservationEvent.updateStatus(r.uuid, 'SEATED'));
                            context.read<TableBloc>().add(TableEvent.toggleOccupied(t.id, true));
                            Navigator.pop(ctx);
                          },

                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
        ],
      ),
    );
  }
}
