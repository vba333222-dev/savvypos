import 'package:savvy_pos/core/utils/time_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get_it/get_it.dart';
import 'package:savvy_pos/core/config/theme/savvy_theme.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_text.dart';
import 'package:savvy_pos/core/presentation/widgets/savvy_ticker.dart';
import 'package:savvy_pos/features/reports/presentation/bloc/report_bloc.dart';
import 'package:savvy_pos/features/reports/presentation/widgets/interactive_sales_chart.dart';
import 'package:savvy_pos/features/reports/presentation/widgets/period_selector.dart';

class SalesReportPage extends StatefulWidget {
  const SalesReportPage({super.key});

  @override
  State<SalesReportPage> createState() => _SalesReportPageState();
}

class _SalesReportPageState extends State<SalesReportPage> {
  SalesPeriod _period = SalesPeriod.week;

  @override
  Widget build(BuildContext context) {
    final theme = context.savvy;

    return BlocProvider(
      create: (_) => GetIt.I<ReportBloc>()..add(_getEventForPeriod(_period)),
      child: Scaffold(
        backgroundColor: theme.colors.bgPrimary,
        appBar: AppBar(
          title: Text('ANALYTICS', style: SavvyTextStyle.h3.style),
          centerTitle: true,
          backgroundColor: theme.colors.bgPrimary,
          elevation: 0,
        ),
        body: Column(
          children: [
            // 1. Period Selector (Sticky-ish)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              height: 48,
              child: Builder(builder: (context) {
                return PeriodSelector(
                  selected: _period,
                  onChanged: (p) {
                    setState(() => _period = p);
                    context.read<ReportBloc>().add(_getEventForPeriod(p));
                  },
                );
              }),
            ),

            // 2. Dash Content
            Expanded(
              child: BlocBuilder<ReportBloc, ReportState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    salesLoaded: (report) {
                      final totalSales =
                          report.fold(0.0, (sum, i) => sum + i.grossSales);

                      // Prepare Chart Data
                      // Group by Product for now (Top Sellers) inside list
                      // For Chart, we need Time Series.
                      // Mocking Time Series Data as Entity doesn't seem to have Date?
                      // Actually `SalesReportItem` is product-based summary.
                      // We'll map Top 5 Products to Chart Bars for this demo
                      // (Real app -> Group By Date Query).

                      final sorted = List.from(report)
                        ..sort((a, b) => b.grossSales.compareTo(a.grossSales));
                      final top5 = sorted.take(7).toList();
                      final chartData = top5.asMap().entries.map((e) {
                        return ChartDataPoint(
                            e.key, e.value.productName, e.value.grossSales);
                      }).toList();

                      double maxY = 0;
                      for (var p in chartData) {
                        if (p.value > maxY) maxY = p.value;
                      }
                      if (maxY == 0) maxY = 100;

                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // HERO TOTAL
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 24.0),
                              child: Column(
                                children: [
                                  Text('Total Revenue',
                                      style: TextStyle(
                                          color: theme.colors.textSecondary)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('\$',
                                          style: TextStyle(
                                              color: theme.colors.textPrimary,
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold)),
                                      SavvyTicker(
                                        value: totalSales,
                                        style: TextStyle(
                                            color: theme.colors.textPrimary,
                                            fontSize: 48,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // CHART
                            Container(
                              height: 250,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: chartData.isEmpty
                                  ? Center(
                                      child: Text('No Data',
                                          style: TextStyle(
                                              color: theme.colors.textMuted)))
                                  : InteractiveSalesChart(
                                      data: chartData, maxY: maxY),
                            ),

                            const SizedBox(height: 32),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Text('Top Performers',
                                  style: SavvyTextStyle.labelLg.style),
                            ),
                            const SizedBox(height: 16),

                            // LIST
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              itemCount: sorted.length,
                              separatorBuilder: (_, __) => Divider(
                                  height: 1,
                                  color: theme.colors.borderDivider
                                      .withValues(alpha: 0.08)),
                              itemBuilder: (context, index) {
                                final item = sorted[index];
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: theme.colors.bgElevated,
                                    child: Text('${index + 1}',
                                        style: TextStyle(
                                            color: theme.colors.textSecondary,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  title: Text(item.productName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600)),
                                  subtitle: Text('${item.quantitySold} sold'),
                                  trailing: Text(
                                    '\$${item.grossSales.toStringAsFixed(2)}',
                                    style: TextStyle(
                                        color: theme.colors.brandPrimary,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                                    .animate(delay: (50 * index).ms)
                                    .fadeIn()
                                    .slideX(begin: 0.1, end: 0);
                              },
                            ),
                            const SizedBox(height: 48),
                          ],
                        ),
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

  ReportEvent _getEventForPeriod(SalesPeriod p) {
    // Determine dates
    final now = TimeHelper.now();
    DateTime start;
    switch (p) {
      case SalesPeriod.today:
        start = now;
        break; // Today 00:00
      case SalesPeriod.week:
        start = now.subtract(const Duration(days: 7));
        break;
      case SalesPeriod.month:
        start = now.subtract(const Duration(days: 30));
        break;
    }
    return ReportEvent.loadSalesReport(start, now);
  }
}
