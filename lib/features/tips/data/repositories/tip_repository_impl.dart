import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/tips/domain/entities/tip_entities.dart';
import 'package:savvy_pos/features/tips/domain/repositories/i_tip_repository.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: ITipRepository)
class TipRepositoryImpl implements ITipRepository {
  final AppDatabase _db;
  final _uuid = const Uuid();

  TipRepositoryImpl(this._db);

  @override
  List<double> getSuggestedTipAmounts(double orderTotal,
      {List<int> percentages = const [15, 18, 20, 25]}) {
    return percentages.map((p) => (orderTotal * p / 100)).toList();
  }

  // ===================================
  // TIP RECORDING
  // ===================================

  @override
  Future<Tip> recordTip({
    required String orderUuid,
    required String orderNumber,
    required TipType type,
    required double amount,
    required String processedByUuid,
    required String processedByName,
    bool isPooled = false,
    String? notes,
  }) async {
    final uuid = _uuid.v4();
    final now = DateTime.now();

    await _db.into(_db.tipTable).insert(TipTableCompanion(
          uuid: Value(uuid),
          orderUuid: Value(orderUuid),
          orderNumber: Value(orderNumber),
          tipType: Value(type.name),
          amount: Value(amount),
          processedByUuid: Value(processedByUuid),
          processedByName: Value(processedByName),
          isPooled: Value(isPooled),
          notes: Value(notes),
          createdAt: Value(now),
        ));

    return Tip(
      uuid: uuid,
      orderUuid: orderUuid,
      orderNumber: orderNumber,
      type: type,
      amount: amount,
      processedByUuid: processedByUuid,
      processedByName: processedByName,
      isPooled: isPooled,
      notes: notes,
      createdAt: now,
    );
  }

  @override
  Future<Tip?> getTipByOrder(String orderUuid) async {
    final row = await (_db.select(_db.tipTable)
          ..where((t) => t.orderUuid.equals(orderUuid)))
        .getSingleOrNull();

    if (row == null) return null;
    return _mapToTip(row);
  }

  @override
  Future<List<Tip>> getTips({
    DateTime? startDate,
    DateTime? endDate,
    TipType? type,
    bool? isPooled,
  }) async {
    final query = _db.select(_db.tipTable);

    if (startDate != null) {
      query.where((t) => t.createdAt.isBiggerOrEqualValue(startDate));
    }
    if (endDate != null) {
      query.where((t) => t.createdAt.isSmallerOrEqualValue(endDate));
    }
    if (type != null) {
      query.where((t) => t.tipType.equals(type.name));
    }
    if (isPooled != null) {
      query.where((t) => t.isPooled.equals(isPooled));
    }

    query.orderBy([(t) => OrderingTerm.desc(t.createdAt)]);

    final rows = await query.get();
    return rows.map(_mapToTip).toList();
  }

  // ===================================
  // TIP POOL MANAGEMENT
  // ===================================

  @override
  Future<TipPool?> getActivePool() async {
    final row = await (_db.select(_db.tipPoolConfigTable)
          ..where((t) => t.isActive.equals(true))
          ..limit(1))
        .getSingleOrNull();

    if (row == null) return null;
    return _mapToTipPool(row);
  }

  @override
  Future<List<TipPool>> getPools() async {
    final rows = await _db.select(_db.tipPoolConfigTable).get();
    return rows.map(_mapToTipPool).toList();
  }

  @override
  Future<TipPool> createPool(TipPool pool) async {
    final uuid = pool.uuid.isEmpty ? _uuid.v4() : pool.uuid;
    final now = DateTime.now();

    await _db.into(_db.tipPoolConfigTable).insert(TipPoolConfigTableCompanion(
          uuid: Value(uuid),
          name: Value(pool.name),
          method: Value(pool.method.name),
          isActive: Value(pool.isActive),
          rolePercentagesJson: Value(jsonEncode(pool.rolePercentages)),
          rolePointsJson: Value(jsonEncode(pool.rolePoints)),
          excludedRolesJson: Value(jsonEncode(pool.excludedRoles)),
          createdAt: Value(now),
          updatedAt: Value(now),
        ));

    return pool.copyWith(uuid: uuid, createdAt: now, updatedAt: now);
  }

  @override
  Future<void> updatePool(TipPool pool) async {
    await (_db.update(_db.tipPoolConfigTable)
          ..where((t) => t.uuid.equals(pool.uuid)))
        .write(TipPoolConfigTableCompanion(
      name: Value(pool.name),
      method: Value(pool.method.name),
      rolePercentagesJson: Value(jsonEncode(pool.rolePercentages)),
      rolePointsJson: Value(jsonEncode(pool.rolePoints)),
      excludedRolesJson: Value(jsonEncode(pool.excludedRoles)),
      updatedAt: Value(DateTime.now()),
    ));
  }

  @override
  Future<void> activatePool(String poolUuid) async {
    // Deactivate all pools first
    await (_db.update(_db.tipPoolConfigTable))
        .write(const TipPoolConfigTableCompanion(isActive: Value(false)));

    // Activate the specified pool
    await (_db.update(_db.tipPoolConfigTable)
          ..where((t) => t.uuid.equals(poolUuid)))
        .write(TipPoolConfigTableCompanion(
      isActive: const Value(true),
      updatedAt: Value(DateTime.now()),
    ));
  }

  // ===================================
  // TIP DISTRIBUTION
  // ===================================

  @override
  Future<List<TipDistribution>> distributePooledTip({
    required String tipUuid,
    required List<String> employeeUuids,
    Map<String, double>? hoursWorked,
  }) async {
    final tip = await (_db.select(_db.tipTable)
          ..where((t) => t.uuid.equals(tipUuid)))
        .getSingle();

    final pool = await getActivePool();
    if (pool == null) throw Exception('No active tip pool configured');

    final List<TipDistribution> distributions = [];
    final now = DateTime.now();

    // Calculate distribution based on pool method
    Map<String, double> shares = {};

    switch (pool.method) {
      case TipPoolMethod.equal:
        final share = 1.0 / employeeUuids.length;
        for (final uuid in employeeUuids) {
          shares[uuid] = share;
        }
        break;

      case TipPoolMethod.hoursWorked:
        if (hoursWorked == null || hoursWorked.isEmpty) {
          throw Exception('Hours worked required for hours-based distribution');
        }
        final totalHours = hoursWorked.values.fold<double>(0, (a, b) => a + b);
        for (final uuid in employeeUuids) {
          shares[uuid] = (hoursWorked[uuid] ?? 0) / totalHours;
        }
        break;

      case TipPoolMethod.points:
        // Get role for each employee and calculate points
        double totalPoints = 0;
        Map<String, double> empPoints = {};
        for (final uuid in employeeUuids) {
          // Simplified - in real implementation, fetch employee role
          empPoints[uuid] = pool.rolePoints['default'] ?? 1.0;
          totalPoints += empPoints[uuid]!;
        }
        for (final uuid in employeeUuids) {
          shares[uuid] = empPoints[uuid]! / totalPoints;
        }
        break;

      case TipPoolMethod.percentage:
        // Role-based fixed percentages
        for (final uuid in employeeUuids) {
          // Simplified - in real implementation, fetch employee role
          shares[uuid] = (pool.rolePercentages['default'] ?? 100) /
              100 /
              employeeUuids.length;
        }
        break;
    }

    // Create distribution records
    for (final uuid in employeeUuids) {
      final distUuid = _uuid.v4();
      final share = shares[uuid] ?? 0;
      final amount = tip.amount * share;

      await _db
          .into(_db.tipDistributionTable)
          .insert(TipDistributionTableCompanion(
            uuid: Value(distUuid),
            tipUuid: Value(tipUuid),
            employeeUuid: Value(uuid),
            employeeName: Value('Employee'), // Simplified
            employeeRole: Value('Staff'), // Simplified
            amount: Value(amount),
            percentage: Value(share * 100),
            hoursWorked: Value(hoursWorked?[uuid]),
            distributedAt: Value(now),
          ));

      distributions.add(TipDistribution(
        uuid: distUuid,
        tipUuid: tipUuid,
        employeeUuid: uuid,
        employeeName: 'Employee',
        employeeRole: 'Staff',
        amount: amount,
        percentage: share * 100,
        hoursWorked: hoursWorked?[uuid],
        distributedAt: now,
      ));
    }

    // Mark tip as pooled
    await (_db.update(_db.tipTable)..where((t) => t.uuid.equals(tipUuid)))
        .write(TipTableCompanion(
      isPooled: const Value(true),
      poolUuid: Value(pool.uuid),
    ));

    return distributions;
  }

  @override
  Future<List<TipDistribution>> getDistributions({
    String? tipUuid,
    String? employeeUuid,
    DateTime? startDate,
    DateTime? endDate,
    bool? pendingPayout,
  }) async {
    final query = _db.select(_db.tipDistributionTable);

    if (tipUuid != null) {
      query.where((t) => t.tipUuid.equals(tipUuid));
    }
    if (employeeUuid != null) {
      query.where((t) => t.employeeUuid.equals(employeeUuid));
    }
    if (startDate != null) {
      query.where((t) => t.distributedAt.isBiggerOrEqualValue(startDate));
    }
    if (endDate != null) {
      query.where((t) => t.distributedAt.isSmallerOrEqualValue(endDate));
    }
    if (pendingPayout == true) {
      query.where((t) => t.isPaidOut.equals(false));
    }

    query.orderBy([(t) => OrderingTerm.desc(t.distributedAt)]);

    final rows = await query.get();
    return rows.map(_mapToDistribution).toList();
  }

  @override
  Future<void> markAsPaidOut({
    required List<String> distributionUuids,
    required String paidOutByUuid,
  }) async {
    final now = DateTime.now();

    for (final uuid in distributionUuids) {
      await (_db.update(_db.tipDistributionTable)
            ..where((t) => t.uuid.equals(uuid)))
          .write(TipDistributionTableCompanion(
        isPaidOut: const Value(true),
        paidOutAt: Value(now),
        paidOutByUuid: Value(paidOutByUuid),
      ));
    }
  }

  // ===================================
  // REPORTING
  // ===================================

  @override
  Future<TipReport> getTipReport({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final tips = await getTips(startDate: startDate, endDate: endDate);

    final totalTips = tips.fold<double>(0, (sum, t) => sum + t.amount);
    final cashTips = tips
        .where((t) => t.type == TipType.cash)
        .fold<double>(0, (sum, t) => sum + t.amount);
    final cardTips = tips
        .where((t) => t.type == TipType.card)
        .fold<double>(0, (sum, t) => sum + t.amount);

    return TipReport(
      totalTips: totalTips,
      cashTips: cashTips,
      cardTips: cardTips,
      tipCount: tips.length,
      averageTip: tips.isNotEmpty ? totalTips / tips.length : 0,
      averageTipPercentage: 15.0, // Simplified - would calc from order totals
      periodStart: startDate,
      periodEnd: endDate,
    );
  }

  @override
  Future<TipEmployeeSummary> getEmployeeTipSummary({
    required String employeeUuid,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final distributions = await getDistributions(
      employeeUuid: employeeUuid,
      startDate: startDate,
      endDate: endDate,
    );

    final totalTips = distributions.fold<double>(0, (sum, d) => sum + d.amount);
    final hoursWorked =
        distributions.fold<double>(0, (sum, d) => sum + (d.hoursWorked ?? 0));

    return TipEmployeeSummary(
      employeeUuid: employeeUuid,
      employeeName:
          distributions.isNotEmpty ? distributions.first.employeeName : '',
      role: distributions.isNotEmpty ? distributions.first.employeeRole : '',
      totalTips: totalTips,
      ordersServed: distributions.length,
      averageTipPerOrder:
          distributions.isNotEmpty ? totalTips / distributions.length : 0,
      hoursWorked: hoursWorked,
      tipsPerHour: hoursWorked > 0 ? totalTips / hoursWorked : 0,
    );
  }

  @override
  Future<double> getUnpaidTipsTotal() async {
    final pending = await getDistributions(pendingPayout: true);
    return pending.fold<double>(0, (sum, d) => sum + d.amount);
  }

  // ===================================
  // MAPPERS
  // ===================================

  Tip _mapToTip(TipTableData row) {
    return Tip(
      uuid: row.uuid,
      orderUuid: row.orderUuid,
      orderNumber: row.orderNumber,
      type: TipType.values
          .firstWhere((e) => e.name == row.tipType, orElse: () => TipType.cash),
      amount: row.amount,
      processedByUuid: row.processedByUuid,
      processedByName: row.processedByName,
      isPooled: row.isPooled,
      poolUuid: row.poolUuid,
      notes: row.notes,
      createdAt: row.createdAt,
    );
  }

  TipPool _mapToTipPool(TipPoolConfigTableData row) {
    return TipPool(
      uuid: row.uuid,
      name: row.name,
      method: TipPoolMethod.values.firstWhere((e) => e.name == row.method,
          orElse: () => TipPoolMethod.equal),
      isActive: row.isActive,
      rolePercentages:
          Map<String, int>.from(jsonDecode(row.rolePercentagesJson)),
      rolePoints: Map<String, double>.from(jsonDecode(row.rolePointsJson)),
      excludedRoles: List<String>.from(jsonDecode(row.excludedRolesJson)),
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  TipDistribution _mapToDistribution(TipDistributionTableData row) {
    return TipDistribution(
      uuid: row.uuid,
      tipUuid: row.tipUuid,
      employeeUuid: row.employeeUuid,
      employeeName: row.employeeName,
      employeeRole: row.employeeRole,
      amount: row.amount,
      percentage: row.percentage,
      hoursWorked: row.hoursWorked,
      pointsEarned: row.pointsEarned,
      isPaidOut: row.isPaidOut,
      paidOutAt: row.paidOutAt,
      paidOutByUuid: row.paidOutByUuid,
      distributedAt: row.distributedAt,
    );
  }
}
