import 'package:flutter/material.dart';
import 'package:savvy_pos/core/config/theme_config.dart';
import 'package:savvy_pos/features/reports/presentation/pages/sales_report_page.dart';
import 'package:savvy_pos/features/reports/presentation/pages/stock_report_page.dart';

class ReportsHubPage extends StatelessWidget {
  const ReportsHubPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    
    return Scaffold(
      backgroundColor: colors.bgPrimary,
      appBar: AppBar(
        title: const Text('Reports Hub'),
        backgroundColor: colors.bgPrimary,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _ReportCard(
            title: 'Sales Report',
            icon: Icons.bar_chart,
            color: Colors.blue,
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SalesReportPage())),
          ),
          _ReportCard(
            title: 'Stock Ledger',
            icon: Icons.inventory,
            color: Colors.orange,
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const StockReportPage())),
          ),
          _ReportCard(
            title: 'Shift History',
            icon: Icons.history,
            color: Colors.purple,
            onTap: () {
               // Navigate to existing TransactionHistoryPage or specialized Shift Report
            },
          ),
        ],
      ),
    );
  }
}

class _ReportCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ReportCard({required this.title, required this.icon, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.savvy.colors;
    
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colors.bgElevated,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colors.borderDefault),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 40, color: color),
            ),
            const SizedBox(height: 16),
            Text(title, style: context.savvy.typography.h6),
          ],
        ),
      ),
    );
  }
}
