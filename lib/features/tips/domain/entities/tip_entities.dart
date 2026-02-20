import 'package:freezed_annotation/freezed_annotation.dart';

part 'tip_entities.freezed.dart';
part 'tip_entities.g.dart';

/// Tip type enumeration
enum TipType { cash, card, split }

/// Tip pool distribution method
enum TipPoolMethod {
  equal,          // Equal split among all
  hoursWorked,    // Based on hours worked in shift
  points,         // Based on assigned points (role-based)
  percentage,     // Fixed percentage per role
}

/// Tip record for a single order
@freezed
class Tip with _$Tip {
  const factory Tip({
    required String uuid,
    required String orderUuid,
    required String orderNumber,
    required TipType type,
    required double amount,
    
    // The employee who processed the tip
    required String processedByUuid,
    required String processedByName,
    
    // If pooled, distribution will be handled separately
    @Default(false) bool isPooled,
    String? poolUuid,
    
    String? notes,
    required DateTime createdAt,
  }) = _Tip;
  
  factory Tip.fromJson(Map<String, dynamic> json) => _$TipFromJson(json);
}

/// Tip pool configuration
@freezed
class TipPool with _$TipPool {
  const factory TipPool({
    required String uuid,
    required String name,
    @Default(TipPoolMethod.equal) TipPoolMethod method,
    @Default(true) bool isActive,
    
    // Role-based percentages (JSON: {"server": 60, "bartender": 30, "busser": 10})
    @Default({}) Map<String, int> rolePercentages,
    
    // Role-based points (for points method)
    @Default({}) Map<String, double> rolePoints,
    
    // Excluded roles (e.g., managers)
    @Default([]) List<String> excludedRoles,
    
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _TipPool;
  
  factory TipPool.fromJson(Map<String, dynamic> json) => _$TipPoolFromJson(json);
}

/// Individual tip distribution to an employee
@freezed
class TipDistribution with _$TipDistribution {
  const factory TipDistribution({
    required String uuid,
    required String tipUuid,          // Link to original tip
    required String employeeUuid,
    required String employeeName,
    required String employeeRole,
    required double amount,
    
    // Distribution metadata
    required double percentage,       // What % of pool they received
    double? hoursWorked,              // If hours-based
    double? pointsEarned,             // If points-based
    
    @Default(false) bool isPaidOut,
    DateTime? paidOutAt,
    String? paidOutByUuid,
    
    required DateTime distributedAt,
  }) = _TipDistribution;
  
  factory TipDistribution.fromJson(Map<String, dynamic> json) => _$TipDistributionFromJson(json);
}

/// Tip report for analytics
@freezed
class TipReport with _$TipReport {
  const factory TipReport({
    required double totalTips,
    required double cashTips,
    required double cardTips,
    required int tipCount,
    required double averageTip,
    required double averageTipPercentage,  // vs order total
    
    // Top earners
    @Default([]) List<TipEmployeeSummary> employeeSummaries,
    
    DateTime? periodStart,
    DateTime? periodEnd,
  }) = _TipReport;
  
  factory TipReport.fromJson(Map<String, dynamic> json) => _$TipReportFromJson(json);
}

/// Per-employee tip summary
@freezed
class TipEmployeeSummary with _$TipEmployeeSummary {
  const factory TipEmployeeSummary({
    required String employeeUuid,
    required String employeeName,
    required String role,
    required double totalTips,
    required int ordersServed,
    required double averageTipPerOrder,
    required double hoursWorked,
    required double tipsPerHour,
  }) = _TipEmployeeSummary;
  
  factory TipEmployeeSummary.fromJson(Map<String, dynamic> json) => _$TipEmployeeSummaryFromJson(json);
}
