import 'package:savvy_pos/features/tips/domain/entities/tip_entities.dart';

/// Repository interface for Tip Management
abstract class ITipRepository {
  // ===================================
  // TIP RECORDING
  // ===================================

  /// Record a tip during checkout
  Future<Tip> recordTip({
    required String orderUuid,
    required String orderNumber,
    required TipType type,
    required double amount,
    required String processedByUuid,
    required String processedByName,
    bool isPooled = false,
    String? notes,
  });

  /// Get tip for an order
  Future<Tip?> getTipByOrder(String orderUuid);

  /// Get all tips for a period
  Future<List<Tip>> getTips({
    DateTime? startDate,
    DateTime? endDate,
    TipType? type,
    bool? isPooled,
  });

  // ===================================
  // TIP POOL MANAGEMENT
  // ===================================

  /// Get active tip pool configuration
  Future<TipPool?> getActivePool();

  /// Get all pool configurations
  Future<List<TipPool>> getPools();

  /// Create a new tip pool
  Future<TipPool> createPool(TipPool pool);

  /// Update pool configuration
  Future<void> updatePool(TipPool pool);

  /// Activate a specific pool
  Future<void> activatePool(String poolUuid);

  // ===================================
  // TIP DISTRIBUTION
  // ===================================

  /// Distribute a tip to employees based on active pool settings
  Future<List<TipDistribution>> distributePooledTip({
    required String tipUuid,
    required List<String> employeeUuids, // Employees in pool
    Map<String, double>? hoursWorked, // For hours-based distribution
  });

  /// Get distributions for a tip
  Future<List<TipDistribution>> getDistributions({
    String? tipUuid,
    String? employeeUuid,
    DateTime? startDate,
    DateTime? endDate,
    bool? pendingPayout,
  });

  /// Mark distributions as paid out
  Future<void> markAsPaidOut({
    required List<String> distributionUuids,
    required String paidOutByUuid,
  });

  // ===================================
  // REPORTING
  // ===================================

  /// Get comprehensive tip report
  Future<TipReport> getTipReport({
    DateTime? startDate,
    DateTime? endDate,
  });

  /// Get employee tip summary
  Future<TipEmployeeSummary> getEmployeeTipSummary({
    required String employeeUuid,
    DateTime? startDate,
    DateTime? endDate,
  });

  /// Get total unpaid tips (liability)
  Future<double> getUnpaidTipsTotal();

  /// Calculate suggested tip amounts (for UI)
  List<double> getSuggestedTipAmounts(double orderTotal,
      {List<int> percentages = const [15, 18, 20, 25]}) {
    return percentages.map((p) => (orderTotal * p / 100)).toList();
  }
}
