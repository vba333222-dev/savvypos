import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:savvy_pos/features/reports/presentation/bloc/report_bloc.dart';
import 'package:savvy_pos/features/inventory/presentation/bloc/product_bloc.dart';

class StockReportPage extends StatelessWidget {
  const StockReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.I<ReportBloc>()),
        // Re-use ProductBloc to pick product
        BlocProvider(create: (_) => GetIt.I<ProductBloc>()..add(const ProductEvent.load())),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text('Stock Ledger')),
        body: Column(
          children: [
            // Product Selector
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loaded: (products) {
                       return DropdownButtonFormField<String>(
                         decoration: const InputDecoration(labelText: 'Select Product', border: OutlineInputBorder()),
                         items: products.map((p) => DropdownMenuItem(value: p.uuid, child: Text(p.name))).toList(),
                         onChanged: (val) {
                           if (val != null) {
                             context.read<ReportBloc>().add(ReportEvent.loadStockLedger(val));
                           }
                         },
                       );
                    },
                    orElse: () => const LinearProgressIndicator(),
                  );
                },
              ),
            ),
            
            // Ledger List
            Expanded(
              child: BlocBuilder<ReportBloc, ReportState>(
                builder: (context, state) {
                   return state.maybeWhen(
                     loading: () => const Center(child: CircularProgressIndicator()),
                     error: (msg) => Center(child: Text('Error: $msg')),
                     stockLoaded: (ledger) {
                       if (ledger.isEmpty) return const Center(child: Text('No movements recorded.'));
                       
                       return ListView.separated(
                         itemCount: ledger.length,
                         separatorBuilder: (_, __) => const Divider(),
                         itemBuilder: (context, index) {
                           final item = ledger[index];
                           final color = item.quantityChange > 0 ? Colors.green : Colors.red;
                           
                           return ListTile(
                             title: Text(item.type.toUpperCase()),
                             subtitle: Text('${DateFormat('MM/dd HH:mm').format(item.date)} • Ref: ${item.referenceId}'),
                             trailing: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.end,
                               children: [
                                 Text(
                                   item.quantityChange > 0 ? '+${item.quantityChange}' : '${item.quantityChange}',
                                   style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16),
                                 ),
                                 Text('Bal: ${item.newStockLevel}', style: const TextStyle(color: Colors.grey)),
                               ],
                             ),
                           );
                         },
                       );
                     },
                     orElse: () => const Center(child: Text('Select a product to view ledger')),
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
