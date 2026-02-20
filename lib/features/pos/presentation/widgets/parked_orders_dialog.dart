import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_widgets.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_bloc.dart';
import 'package:savvy_pos/features/pos/presentation/bloc/cart/cart_event.dart';

class ParkedOrdersDialog extends StatelessWidget {
  const ParkedOrdersDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;
    final db = GetIt.I<AppDatabase>(); // Hacky direct access for MVP list
    
    return Dialog(
       backgroundColor: Colors.transparent,
       child: SavvyBox(
         width: 600,
         height: 500,
         color: theme.colors.bgPrimary,
         child: Column(
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 SavvyText("Parked Orders (Hold)", style: SavvyTextStyle.h3),
                 IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
               ],
             ),
             Divider(color: theme.colors.borderDefault),
             Expanded(
               child: StreamBuilder<List<OrderTableData>>(
                 stream: (db.select(db.orderTable)..where((t) => t.status.equals('OPEN'))).watch(),
                 builder: (context, snapshot) {
                   if (!snapshot.hasData || snapshot.data!.isEmpty) {
                     return Center(child: SavvyText("No parked orders", color: theme.colors.textMuted));
                   }
                   
                   final orders = snapshot.data!;
                   return ListView.separated(
                     itemCount: orders.length,
                     separatorBuilder: (_,__) => const Divider(),
                     itemBuilder: (context, index) {
                       final order = orders[index];
                       return ListTile(
                         leading: CircleAvatar(
                           backgroundColor: theme.colors.brandAccent,
                           child: const Icon(Icons.pause, color: Colors.white),
                         ),
                         title: SavvyText(order.orderNumber, style: SavvyTextStyle.bodyLarge),
                         subtitle: SavvyText(DateFormat('h:mm a').format(order.transactionDate)),
                         trailing: Row(
                           mainAxisSize: MainAxisSize.min,
                           children: [
                             Text("\$${order.grandTotal.toStringAsFixed(2)}", style: const TextStyle(fontWeight: FontWeight.bold)),
                             const SizedBox(width: 16),
                             ElevatedButton(
                               onPressed: () {
                                 // Resume
                                 context.read<CartBloc>().add(CartEvent.retrieveOrder(order.uuid, ""));
                                 Navigator.pop(context);
                               },
                               child: const Text("Resume"),
                             )
                           ],
                         ),
                       );
                     },
                   );
                 },
               ),
             ),
           ],
         ),
       ),
    );
  }
}
