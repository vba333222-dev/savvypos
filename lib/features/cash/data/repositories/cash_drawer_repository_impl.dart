import 'package:drift/drift.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/cash/domain/entities/cash_drawer_entities.dart';
import 'package:savvy_pos/features/cash/domain/repositories/i_cash_drawer_repository.dart';
import 'package:uuid/uuid.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ICashDrawerRepository)
class CashDrawerRepositoryImpl implements ICashDrawerRepository {
  final AppDatabase db;

  CashDrawerRepositoryImpl(this.db);

  CashEventType _parseEventType(String type) {
    switch (type) {
      case 'cashIn':
        return CashEventType.cashIn;
      case 'cashOut':
        return CashEventType.cashOut;
      case 'cashDrop':
        return CashEventType.cashDrop;
      case 'noSale':
        return CashEventType.noSale;
      case 'sale':
        return CashEventType.sale;
      case 'refund':
        return CashEventType.refund;
      default:
        return CashEventType.cashIn;
    }
  }

  String _eventTypeToString(CashEventType type) {
    switch (type) {
      case CashEventType.cashIn:
        return 'cashIn';
      case CashEventType.cashOut:
        return 'cashOut';
      case CashEventType.cashDrop:
        return 'cashDrop';
      case CashEventType.noSale:
        return 'noSale';
      case CashEventType.sale:
        return 'sale';
      case CashEventType.refund:
        return 'refund';
    }
  }

  CashDrawer _mapToDrawer(CashDrawerTableData row) {
    return CashDrawer(
      id: row.uuid,
      shiftUuid: row.shiftUuid,
      employeeUuid: row.employeeUuid,
      employeeName: row.employeeName,
      startingBalance: row.startingBalance,
      currentBalance: row.currentBalance,
      expectedBalance: row.expectedBalance,
      state: row.state == 'closed' ? DrawerState.closed : DrawerState.open,
      openedAt: row.openedAt,
      closedAt: row.closedAt,
      closingBalance: row.closingBalance,
      variance: row.variance,
    );
  }

  CashEvent _mapToEvent(CashEventTableData row) {
    return CashEvent(
      id: row.uuid,
      drawerUuid: row.drawerUuid,
      type: _parseEventType(row.type),
      amount: row.amount,
      reason: row.reason,
      comment: row.comment,
      performedBy: row.performedBy,
      orderUuid: row.orderUuid,
      timestamp: row.timestamp,
    );
  }

  @override
  Future<CashDrawer> openDrawer(String shiftUuid, String employeeUuid,
      String employeeName, double startingBalance) async {
    final uuid = const Uuid().v4();
    final now = DateTime.now();

    await db.into(db.cashDrawerTable).insert(
          CashDrawerTableCompanion.insert(
            uuid: uuid,
            shiftUuid: shiftUuid,
            employeeUuid: employeeUuid,
            employeeName: employeeName,
            startingBalance: startingBalance,
            currentBalance: startingBalance,
            expectedBalance: startingBalance,
            openedAt: now,
          ),
        );

    return CashDrawer(
      id: uuid,
      shiftUuid: shiftUuid,
      employeeUuid: employeeUuid,
      employeeName: employeeName,
      startingBalance: startingBalance,
      currentBalance: startingBalance,
      expectedBalance: startingBalance,
      state: DrawerState.open,
      openedAt: now,
    );
  }

  @override
  Future<CashDrawer?> getCurrentDrawer(String shiftUuid) async {
    final row = await (db.select(db.cashDrawerTable)
          ..where(
              (t) => t.shiftUuid.equals(shiftUuid) & t.state.equals('open')))
        .getSingleOrNull();
    return row != null ? _mapToDrawer(row) : null;
  }

  @override
  Future<CashEvent> recordEvent(
      String drawerUuid, CashEventType type, double amount, String reason,
      {String? comment, String? orderUuid}) async {
    final uuid = const Uuid().v4();
    final now = DateTime.now();

    await db.into(db.cashEventTable).insert(
          CashEventTableCompanion.insert(
            uuid: uuid,
            drawerUuid: drawerUuid,
            type: _eventTypeToString(type),
            amount: amount,
            reason: reason,
            comment: Value(comment),
            orderUuid: Value(orderUuid),
            timestamp: now,
          ),
        );

    // Update drawer balance
    final drawer = await (db.select(db.cashDrawerTable)
          ..where((t) => t.uuid.equals(drawerUuid)))
        .getSingle();

    double balanceChange = 0;
    switch (type) {
      case CashEventType.cashIn:
      case CashEventType.sale:
        balanceChange = amount;
        break;
      case CashEventType.cashOut:
      case CashEventType.cashDrop:
      case CashEventType.refund:
        balanceChange = -amount;
        break;
      case CashEventType.noSale:
        // No balance change
        break;
    }

    await (db.update(db.cashDrawerTable)
          ..where((t) => t.uuid.equals(drawerUuid)))
        .write(
      CashDrawerTableCompanion(
        currentBalance: Value(drawer.currentBalance + balanceChange),
        expectedBalance: Value(drawer.expectedBalance + balanceChange),
      ),
    );

    return CashEvent(
      id: uuid,
      drawerUuid: drawerUuid,
      type: type,
      amount: amount,
      reason: reason,
      comment: comment,
      orderUuid: orderUuid,
      timestamp: now,
    );
  }

  @override
  Future<CashDrawer> closeDrawer(
      String drawerUuid, double actualBalance) async {
    final now = DateTime.now();
    final drawer = await (db.select(db.cashDrawerTable)
          ..where((t) => t.uuid.equals(drawerUuid)))
        .getSingle();
    final variance = actualBalance - drawer.expectedBalance;

    await (db.update(db.cashDrawerTable)
          ..where((t) => t.uuid.equals(drawerUuid)))
        .write(
      CashDrawerTableCompanion(
        state: const Value('closed'),
        closedAt: Value(now),
        closingBalance: Value(actualBalance),
        variance: Value(variance),
      ),
    );

    return _mapToDrawer(drawer).copyWith(
      state: DrawerState.closed,
      closedAt: now,
      closingBalance: actualBalance,
      variance: variance,
    );
  }

  @override
  Future<List<CashEvent>> getDrawerEvents(String drawerUuid) async {
    final rows = await (db.select(db.cashEventTable)
          ..where((t) => t.drawerUuid.equals(drawerUuid))
          ..orderBy([(t) => OrderingTerm.desc(t.timestamp)]))
        .get();
    return rows.map(_mapToEvent).toList();
  }

  @override
  Future<CashDrawerSummary> getDrawerSummary(String drawerUuid) async {
    final events = await getDrawerEvents(drawerUuid);

    double totalCashIn = 0,
        totalCashOut = 0,
        totalSales = 0,
        totalRefunds = 0,
        totalDrops = 0;
    int noSaleCount = 0;

    for (final e in events) {
      switch (e.type) {
        case CashEventType.cashIn:
          totalCashIn += e.amount;
          break;
        case CashEventType.cashOut:
          totalCashOut += e.amount;
          break;
        case CashEventType.sale:
          totalSales += e.amount;
          break;
        case CashEventType.refund:
          totalRefunds += e.amount;
          break;
        case CashEventType.cashDrop:
          totalDrops += e.amount;
          break;
        case CashEventType.noSale:
          noSaleCount++;
          break;
      }
    }

    final drawer = await (db.select(db.cashDrawerTable)
          ..where((t) => t.uuid.equals(drawerUuid)))
        .getSingle();
    final netCash = drawer.startingBalance +
        totalSales -
        totalRefunds +
        totalCashIn -
        totalCashOut -
        totalDrops;

    return CashDrawerSummary(
      totalCashIn: totalCashIn,
      totalCashOut: totalCashOut,
      totalSales: totalSales,
      totalRefunds: totalRefunds,
      totalDrops: totalDrops,
      noSaleCount: noSaleCount,
      netCash: netCash,
    );
  }

  @override
  Future<List<CashDrawer>> getDrawerHistory(
      DateTime start, DateTime end) async {
    final rows = await (db.select(db.cashDrawerTable)
          ..where((t) =>
              t.openedAt.isBiggerOrEqualValue(start) &
              t.openedAt.isSmallerOrEqualValue(end))
          ..orderBy([(t) => OrderingTerm.desc(t.openedAt)]))
        .get();
    return rows.map(_mapToDrawer).toList();
  }

  @override
  Future<CashDrawer> reopenDrawer(String drawerUuid) async {
    await (db.update(db.cashDrawerTable)
          ..where((t) => t.uuid.equals(drawerUuid)))
        .write(
      const CashDrawerTableCompanion(
        state: Value('open'),
        closedAt: Value(null),
        closingBalance: Value(null),
        variance: Value(null),
      ),
    );

    final row = await (db.select(db.cashDrawerTable)
          ..where((t) => t.uuid.equals(drawerUuid)))
        .getSingle();
    return _mapToDrawer(row);
  }
}
