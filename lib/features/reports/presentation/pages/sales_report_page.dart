import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/reports/presentation/bloc/report_bloc.dart';

class SalesReportPage extends StatefulWidget {
  const SalesReportPage({super.key});

  @override
  State<SalesReportPage> createState() => _SalesReportPageState();
}

class _SalesReportPageState extends State<SalesReportPage> {
  DateTime _start = DateTime.now().subtract(const Duration(days: 7));
  DateTime _end = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<ReportBloc>()..add(ReportEvent.loadSalesReport(_start, _end)),
      child: Scaffold(
        appBar: AppBar(title: const Text('Sales Report')),
        body: Column(
          children: [
            // Date Picker Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Builder(
                builder: (context) {
                  return Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () async {
                            final picked = await showDateRangePicker(
                              context: context,
                              firstDate: DateTime(2020),
                              lastDate: DateTime.now().add(const Duration(days: 1)),
                              initialDateRange: DateTimeRange(start: _start, end: _end),
                            );
                            if (picked != null) {
                              setState(() {
                                _start = picked.start;
                                _end = picked.end;
                              });
                              context.read<ReportBloc>().add(ReportEvent.loadSalesReport(_start, _end));
                            }
                          },
                          child: Text('${DateFormat('MM/dd').format(_start)} - ${DateFormat('MM/dd').format(_end)}'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                         onPressed: () => context.read<ReportBloc>().add(ReportEvent.loadSalesReport(_start, _end)),
                         child: const Icon(Icons.refresh),
                      ),
                    ],
                  );
                }
              ),
            ),
            
            // Data Table
            Expanded(
              child: BlocBuilder<ReportBloc, ReportState>(
                builder: (context, state) {
                   return state.maybeWhen(
                     loading: () => const Center(child: CircularProgressIndicator()),
                     error: (msg) => Center(child: Text('Error: $msg')),
                     salesLoaded: (report) {
                       if (report.isEmpty) return const Center(child: Text('No Sales Reocords'));

                       final totalSales = report.fold(0.0, (sum, i) => sum + i.grossSales);
                       final totalProfit = report.fold(0.0, (sum, i) => sum + i.grossProfit);
                       
                       return Column(
                         children: [
                           // Summary Card
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 16.0),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: [
                                 _SummaryItem(label: 'Gross Sales', value: totalSales, color: Colors.blue),
                                 _SummaryItem(label: 'Total Profit', value: totalProfit, color: Colors.green),
                               ],
                             ),
                           ),
                           const Divider(),
                           
                           // List
                           Expanded(
                             child: SingleChildScrollView(
                               scrollDirection: Axis.vertical,
                               child: SingleChildScrollView(
                                 scrollDirection: Axis.horizontal,
                                 child: DataTable(
                                   columns: const [
                                     DataColumn(label: Text('Product')),
                                     DataColumn(label: Text('Qty', numeric: true)),
                                     DataColumn(label: Text('Sales', numeric: true)),
                                     DataColumn(label: Text('Cost', numeric: true)),
                                     DataColumn(label: Text('Profit', numeric: true)),
                                   ],
                                   rows: report.map((item) {
                                     return DataRow(cells: [
                                       DataCell(Text(item.productName)),
                                       DataCell(Text(item.quantitySold.toStringAsFixed(0))),
                                       DataCell(Text('\$${item.grossSales.toStringAsFixed(2)}')),
                                       DataCell(Text('\$${item.costOfGoodsSold.toStringAsFixed(2)}')),
                                       DataCell(Text('\$${item.grossProfit.toStringAsFixed(2)}')),
                                     ]);
                                   }).toList(),
                                 ),
                               ),
                             ),
                           ),
                         ],
                       );
                     },
                     orElse: () => const SizedBox.shrink(),
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

class _SummaryItem extends StatelessWidget {
  final String label;
  final double value;
  final Color color;
  
  const _SummaryItem({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        Text('\$${value.toStringAsFixed(2)}', style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
