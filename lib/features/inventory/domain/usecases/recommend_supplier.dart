import 'package:savvy_pos/features/inventory/data/model/product_supplier_link.dart'; // Assume this model exists or we treat input as simple DTO

enum ReplenishmentStrategy {
  LOWEST_COST,
  FASTEST_DELIVERY,
}

class SupplierRecommendation {
  final String supplierUuid;
  final String supplierName;
  final double cost;
  final int leadTime;
  final double totalCost;

  SupplierRecommendation({
    required this.supplierUuid,
    required this.supplierName,
    required this.cost,
    required this.leadTime,
    required this.totalCost,
  });
}

class RecommendSupplier {
  List<SupplierRecommendation> execute({
    required List<Map<String, dynamic>> linkedSuppliers, // List of {supplierUuid, name, cost, leadTime}
    required double quantityNeeded,
    required ReplenishmentStrategy strategy,
  }) {
    // 1. Map to Domain Objects
    final options = linkedSuppliers.map((s) {
      final cost = (s['cost'] as num).toDouble();
      return SupplierRecommendation(
        supplierUuid: s['supplierUuid'],
        supplierName: s['name'],
        cost: cost,
        leadTime: (s['leadTime'] as num).toInt(),
        totalCost: cost * quantityNeeded,
      );
    }).toList();

    // 2. Sort based on Strategy
    if (strategy == ReplenishmentStrategy.LOWEST_COST) {
      options.sort((a, b) => a.totalCost.compareTo(b.totalCost));
    } else {
      // FASTEST_DELIVERY
      options.sort((a, b) => a.leadTime.compareTo(b.leadTime));
    }

    return options;
  }
}
