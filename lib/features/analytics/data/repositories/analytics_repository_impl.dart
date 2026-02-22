import 'package:drift/drift.dart';
import 'package:flutter/material.dart' show DateTimeRange;
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/analytics/domain/entities/analytics_entities.dart';
import 'package:savvy_pos/features/analytics/domain/repositories/i_analytics_repository.dart';

class AnalyticsRepositoryImpl implements IAnalyticsRepository {
  final AppDatabase db;

  AnalyticsRepositoryImpl(this.db);

  @override
  Future<SalesSummary> getSalesSummary(DateTimeRange range) async {
    // 1. Get Sales Totals
    final salesQuery = db.customSelect(
      '''
      SELECT 
        COALESCE(SUM(grand_total), 0) as total_sales,
        COALESCE(SUM(grand_total - tax_total), 0) as net_sales,
        COALESCE(SUM(discount_total), 0) as discount_total,
        COALESCE(SUM(tax_total), 0) as tax_total,
        COUNT(*) as transaction_count
      FROM order_table
      WHERE transaction_date >= ? AND transaction_date <= ?
        AND status = 'COMPLETED'
      ''',
      variables: [
        Variable.withDateTime(range.start),
        Variable.withDateTime(range.end),
      ],
      readsFrom: {db.orderTable},
    );

    final result = await salesQuery.getSingle();
    final totalSales = result.read<double>('total_sales');
    final netSales = result.read<double>('net_sales');
    final transactionCount = result.read<int>('transaction_count');
    final discountTotal = result.read<double>('discount_total');
    final taxTotal = result.read<double>('tax_total');

    // 2. Calculate COGS (Cost of Goods Sold)
    // Join OrderItem -> Product. Join Product -> Recipe?
    // For MVP performance, we'll use a simplified assumption that 'average food cost' is 32%.
    // In a full implementation, we would sum(item.quantity * product.currentCost).

    // Let's try to get a slightly better COGS using ProductTable.price * 0.3 if valid, else fallback.
    final cogsQuery = db.customSelect(
      '''
      SELECT SUM(oi.total * 0.32) as estimated_cogs 
      FROM order_item_table oi
      INNER JOIN order_table o ON oi.order_uuid = o.uuid
      WHERE o.transaction_date >= ? AND o.transaction_date <= ?
        AND o.status = 'COMPLETED'
      ''',
      variables: [
        Variable.withDateTime(range.start),
        Variable.withDateTime(range.end),
      ],
      readsFrom: {db.orderItemTable, db.orderTable},
    );

    double cogs = 0.0;
    try {
      cogs = (await cogsQuery.getSingle()).read<double>('estimated_cogs');
    } catch (_) {}

    final grossProfit = netSales - cogs;

    return SalesSummary(
      totalSales: totalSales,
      netSales: netSales,
      grossProfit: grossProfit,
      transactionCount: transactionCount,
      avgTicketSize: transactionCount > 0 ? totalSales / transactionCount : 0,
      discountTotal: discountTotal,
      taxTotal: taxTotal,
    );
  }

  @override
  Future<LaborMetric> getLaborMetrics(DateTimeRange range) async {
    // TODO: Implement when labor tracking is available
    // For now, return stub data
    return const LaborMetric(
      totalLaborCost: 0.0,
      laborPercentage: 0.0,
      salesPerLaborHour: 0.0,
      totalLaborHours: 0.0,
    );
  }

  @override
  Future<List<MenuPerformance>> getProductMix(DateTimeRange range) async {
    // PMIX: Advanced Classification
    final query = db.customSelect(
      '''
      SELECT 
        oi.product_uuid as item_id,
        oi.name as item_name,
        SUM(oi.quantity) as qty_sold,
        SUM(oi.total) as total_revenue
      FROM order_item_table oi
      INNER JOIN order_table o ON oi.order_uuid = o.uuid
      WHERE o.transaction_date >= ? AND o.transaction_date <= ?
        AND o.status = 'COMPLETED'
      GROUP BY oi.product_uuid, oi.name
      ORDER BY total_revenue DESC
      ''',
      variables: [
        Variable.withDateTime(range.start),
        Variable.withDateTime(range.end)
      ],
      readsFrom: {db.orderItemTable, db.orderTable},
    );

    final rows = await query.get();
    if (rows.isEmpty) return [];

    // Calculate Global Averages for Boston Matrix
    final totalRev =
        rows.fold<double>(0, (sum, r) => sum + r.read<double>('total_revenue'));
    final totalQty =
        rows.fold<double>(0, (sum, r) => sum + r.read<double>('qty_sold'));

    final avgRevPerItem = totalRev / rows.length;
    final avgQtyPerItem = totalQty / rows.length; // Popularity benchmark

    return rows.map((row) {
      final revenue = row.read<double>('total_revenue');
      final qty = row.read<double>('qty_sold').toInt();

      // Cost Logic: 32% Food Cost Assumption
      final cogs = revenue * 0.32;
      final margin = revenue > 0 ? (revenue - cogs) / revenue : 0.0;
      // Contribution margin calculated for future use
      // final contribution = revenue - cogs;

      // Boston Matrix (Growth Share Matrix applied to Menu Engineering)
      // Stars: High Profit, High Popularity
      // Plowhorses: Low Profit, High Popularity
      // Puzzles: High Profit, Low Popularity
      // Dogs: Low Profit, Low Popularity
      // Note: "Profit" here usually means Contribution Margin. "Popularity" means Quantity Sold.

      // Boston Matrix classification based on quantity vs averages
      // Note: isHighProfit would require varied cost data
      // Note: isStar simplified based on qty since cost is hardcoded

      MenuItemCategory category;
      if (qty > avgQtyPerItem) {
        category = MenuItemCategory.star; // High Pop
      } else if (qty > avgQtyPerItem * 0.5) {
        category = MenuItemCategory.plowhorse; // Mid Pop
      } else if (revenue > avgRevPerItem) {
        category = MenuItemCategory.puzzle; // High Rev, Low Pop
      } else {
        category = MenuItemCategory.dog;
      }

      return MenuPerformance(
        itemId: row.read<String>('item_id'),
        itemName: row.read<String>('item_name'),
        qtySold: qty,
        totalRevenue: revenue,
        cost: cogs,
        margin: margin,
        category: category,
      );
    }).toList();
  }

  @override
  Future<List<HourlySales>> getHourlySales(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    final query = db.customSelect(
      '''
      SELECT 
        strftime('%H', transaction_date) as hour,
        COALESCE(SUM(grand_total), 0) as sales,
        COUNT(*) as transaction_count
      FROM order_table
      WHERE transaction_date >= ? AND transaction_date < ?
        AND status = 'COMPLETED'
      GROUP BY strftime('%H', transaction_date)
      ORDER BY hour
      ''',
      variables: [
        Variable.withDateTime(startOfDay),
        Variable.withDateTime(endOfDay)
      ],
      readsFrom: {db.orderTable},
    );

    final rows = await query.get();

    // Fill in missing hours with 0
    final Map<int, HourlySales> salesByHour = {
      for (int i = 0; i < 24; i++)
        i: HourlySales(hour: i, sales: 0, transactionCount: 0),
    };

    for (final row in rows) {
      final hour = int.parse(row.read<String>('hour'));
      salesByHour[hour] = HourlySales(
        hour: hour,
        sales: row.read<double>('sales'),
        transactionCount: row.read<int>('transaction_count'),
      );
    }

    return salesByHour.values.toList();
  }
}
