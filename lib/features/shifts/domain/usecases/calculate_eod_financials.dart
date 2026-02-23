import 'package:savvy_pos/core/utils/time_helper.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/history/domain/repositories/i_order_repository.dart';

class FinancialAggregationResult {
  final double grossSales;
  final double netSales;
  final double totalTax;
  final double totalServiceCharge;
  final double totalDiscounts;
  final double estimatedCogs;

  const FinancialAggregationResult({
    this.grossSales = 0,
    this.netSales = 0,
    this.totalTax = 0,
    this.totalServiceCharge = 0,
    this.totalDiscounts = 0,
    this.estimatedCogs = 0,
  });
}

@injectable
class CalculateEodFinancialsUseCase {
  final IOrderRepository _orderRepo;

  CalculateEodFinancialsUseCase(this._orderRepo);

  Future<FinancialAggregationResult> call(DateTime shiftStartTime,
      {DateTime? shiftEndTime}) async {
    final endTime = shiftEndTime ?? TimeHelper.now();

    // Retrieve all completed orders for this shift timeframe
    final orders =
        await _orderRepo.getOrdersByDateRange(shiftStartTime, endTime);

    double gross = 0;
    double net = 0;
    double tax = 0;
    double service = 0;
    double discounts = 0;
    double cogs = 0;

    for (final order in orders) {
      // Only aggregate completed transactions
      if (order.status != 'COMPLETED') continue;

      gross += order.subtotal;
      tax += order.taxTotal;
      service += 0; // Not explicitly tracked in OrderTableData currently

      discounts += order.discountTotal;

      net += (order.subtotal - order.discountTotal);

      // Fallback COGS estimate
      cogs += (order.subtotal) * 0.35;
    }

    return FinancialAggregationResult(
      grossSales: gross,
      netSales: net,
      totalTax: tax,
      totalServiceCharge: service,
      totalDiscounts: discounts,
      estimatedCogs: cogs,
    );
  }
}
