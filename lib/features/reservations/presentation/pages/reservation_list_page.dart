import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/reservations/presentation/bloc/reservation_bloc.dart';

import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/tables/presentation/bloc/table_bloc.dart';

class ReservationListPage extends StatelessWidget {
  const ReservationListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Rely on Global ReservationBloc
    return const _ReservationListView();
  }
}

class _ReservationListView extends StatelessWidget {
  const _ReservationListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    
    return Scaffold(
      backgroundColor: colors.bgPrimary,
      appBar: AppBar(title: const Text('Reservations')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(context),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<ReservationBloc, ReservationState>(
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
      ),
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
                            // Assign
                            context.read<ReservationBloc>().add(ReservationEvent.updateStatus(r.uuid, 'SEATED'));
                            // Mark Table Occupied
                            context.read<TableBloc>().add(TableEvent.toggleOccupied(t.uuid, true));
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
  
  void _showAddDialog(BuildContext context) {
    final nameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final paxCtrl = TextEditingController(text: '2');
    DateTime selectedDate = DateTime.now();
    
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('New Reservation'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Name')),
             TextField(controller: phoneCtrl, decoration: const InputDecoration(labelText: 'Phone')),
             TextField(controller: paxCtrl, decoration: const InputDecoration(labelText: 'Pax'), keyboardType: TextInputType.number),
             const SizedBox(height: 16),
             Text('Time: ${DateFormat('yyyy-MM-dd HH:mm').format(selectedDate)}'), // Simplified picker
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
               context.read<ReservationBloc>().add(ReservationEvent.addReservation(
                 nameCtrl.text,
                 phoneCtrl.text,
                 int.tryParse(paxCtrl.text) ?? 2,
                 selectedDate,
               ));
               Navigator.pop(ctx);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
