// Supplier recommendation logic for inventory replenishment

enum ReplenishmentStrategy {
  lowestCost,
  fastestDelivery,
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
    required List<Map<String, dynamic>>
        linkedSuppliers, // List of {supplierUuid, name, cost, leadTime}
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
    if (strategy == ReplenishmentStrategy.lowestCost) {
      options.sort((a, b) => a.totalCost.compareTo(b.totalCost));
    } else {
      // fastestDelivery
      options.sort((a, b) => a.leadTime.compareTo(b.leadTime));
    }

    return options;
  }
}
