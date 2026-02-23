import 'package:savvy_pos/core/utils/time_helper.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/pos/domain/entities/split_bill_entities.dart';
import 'package:savvy_pos/features/pos/domain/repositories/i_split_bill_repository.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: ISplitBillRepository)
class SplitBillRepositoryImpl implements ISplitBillRepository {
  final AppDatabase _db;
  final _uuid = const Uuid();

  SplitBillRepositoryImpl(this._db);

  // ===================================
  // SPLIT BILL CRUD
  // ===================================

  @override
  Future<SplitBill> createSplitBill({
    required String orderUuid,
    required String orderNumber,
    required double originalTotal,
    required int guestCount,
    required SplitMode mode,
    required String createdByUuid,
    required String createdByName,
  }) async {
    final uuid = _uuid.v4();
    final now = TimeHelper.now();

    await _db.into(_db.splitBillTable).insert(SplitBillTableCompanion(
          uuid: Value(uuid),
          orderUuid: Value(orderUuid),
          orderNumber: Value(orderNumber),
          originalTotal: Value(originalTotal),
          guestCount: Value(guestCount),
          splitMode: Value(mode.name),
          status: Value(SplitBillStatus.active.name),
          createdByUuid: Value(createdByUuid),
          createdByName: Value(createdByName),
          createdAt: Value(now),
        ));

    // Create guest bills based on mode
    final List<GuestBill> guestBills = [];

    if (mode == SplitMode.equal) {
      final amounts = calculateEqualSplit(originalTotal, guestCount);
      for (int i = 0; i < guestCount; i++) {
        final guestBill = await addGuest(
          splitBillUuid: uuid,
          guestNumber: i + 1,
          amount: amounts[i],
        );
        guestBills.add(guestBill);
      }
    } else {
      // For other modes, create empty guest bills
      for (int i = 0; i < guestCount; i++) {
        final guestBill = await addGuest(
          splitBillUuid: uuid,
          guestNumber: i + 1,
          amount: 0,
        );
        guestBills.add(guestBill);
      }
    }

    return SplitBill(
      uuid: uuid,
      orderUuid: orderUuid,
      orderNumber: orderNumber,
      originalTotal: originalTotal,
      guestCount: guestCount,
      mode: mode,
      status: SplitBillStatus.active,
      guestBills: guestBills,
      createdByUuid: createdByUuid,
      createdByName: createdByName,
      createdAt: now,
    );
  }

  @override
  Future<SplitBill?> getSplitBillByOrder(String orderUuid) async {
    final row = await (_db.select(_db.splitBillTable)
          ..where((t) => t.orderUuid.equals(orderUuid)))
        .getSingleOrNull();

    if (row == null) return null;
    return _mapToSplitBill(row);
  }

  @override
  Future<SplitBill?> getSplitBill(String uuid) async {
    final row = await (_db.select(_db.splitBillTable)
          ..where((t) => t.uuid.equals(uuid)))
        .getSingleOrNull();

    if (row == null) return null;
    return _mapToSplitBill(row);
  }

  @override
  Future<void> updateSplitBill(SplitBill splitBill) async {
    await (_db.update(_db.splitBillTable)
          ..where((t) => t.uuid.equals(splitBill.uuid)))
        .write(SplitBillTableCompanion(
      guestCount: Value(splitBill.guestCount),
      status: Value(splitBill.status.name),
      completedAt: Value(splitBill.completedAt),
    ));
  }

  @override
  Future<void> cancelSplitBill(String uuid) async {
    await (_db.update(_db.splitBillTable)..where((t) => t.uuid.equals(uuid)))
        .write(const SplitBillTableCompanion(
      status: Value('cancelled'),
    ));
  }

  // ===================================
  // GUEST BILL MANAGEMENT
  // ===================================

  @override
  Future<GuestBill> addGuest({
    required String splitBillUuid,
    required int guestNumber,
    String? guestName,
    required double amount,
  }) async {
    final uuid = _uuid.v4();

    await _db.into(_db.guestBillTable).insert(GuestBillTableCompanion(
          uuid: Value(uuid),
          splitBillUuid: Value(splitBillUuid),
          guestNumber: Value(guestNumber),
          guestName: Value(guestName),
          totalAmount: Value(amount),
        ));

    return GuestBill(
      uuid: uuid,
      splitBillUuid: splitBillUuid,
      guestNumber: guestNumber,
      guestName: guestName,
      totalAmount: amount,
    );
  }

  @override
  Future<void> updateGuestBill(GuestBill guestBill) async {
    await (_db.update(_db.guestBillTable)
          ..where((t) => t.uuid.equals(guestBill.uuid)))
        .write(GuestBillTableCompanion(
      guestName: Value(guestBill.guestName),
      totalAmount: Value(guestBill.totalAmount),
      tipAmount: Value(guestBill.tipAmount),
    ));
  }

  @override
  Future<void> removeGuest(String guestBillUuid) async {
    // Remove items first
    await (_db.delete(_db.splitBillItemTable)
          ..where((t) => t.guestBillUuid.equals(guestBillUuid)))
        .go();

    // Remove guest bill
    await (_db.delete(_db.guestBillTable)
          ..where((t) => t.uuid.equals(guestBillUuid)))
        .go();
  }

  @override
  Future<void> assignItemsToGuest({
    required String guestBillUuid,
    required List<SplitBillItem> items,
  }) async {
    // Clear existing items
    await (_db.delete(_db.splitBillItemTable)
          ..where((t) => t.guestBillUuid.equals(guestBillUuid)))
        .go();

    // Add new items
    for (final item in items) {
      await _db.into(_db.splitBillItemTable).insert(SplitBillItemTableCompanion(
            uuid: Value(item.uuid.isEmpty ? _uuid.v4() : item.uuid),
            guestBillUuid: Value(guestBillUuid),
            orderItemUuid: Value(item.orderItemUuid),
            productName: Value(item.productName),
            price: Value(item.price),
            quantity: Value(item.quantity),
            shareCount: Value(item.shareCount),
            shareIndex: Value(item.shareIndex),
          ));
    }

    // Update guest bill total
    final total = items.fold<double>(0, (sum, item) => sum + item.shareAmount);
    await (_db.update(_db.guestBillTable)
          ..where((t) => t.uuid.equals(guestBillUuid)))
        .write(GuestBillTableCompanion(totalAmount: Value(total)));
  }

  // ===================================
  // PAYMENT
  // ===================================

  @override
  Future<void> markGuestPaid({
    required String guestBillUuid,
    required String paymentMethod,
    required String paymentTransactionUuid,
    double? tipAmount,
  }) async {
    await (_db.update(_db.guestBillTable)
          ..where((t) => t.uuid.equals(guestBillUuid)))
        .write(GuestBillTableCompanion(
      isPaid: const Value(true),
      paymentMethod: Value(paymentMethod),
      paymentTransactionUuid: Value(paymentTransactionUuid),
      tipAmount: Value(tipAmount),
      paidAt: Value(TimeHelper.now()),
    ));
  }

  @override
  Future<bool> isSplitComplete(String splitBillUuid) async {
    final guestBills = await (_db.select(_db.guestBillTable)
          ..where((t) => t.splitBillUuid.equals(splitBillUuid)))
        .get();

    return guestBills.every((g) => g.isPaid);
  }

  @override
  Future<void> completeSplitBill(String splitBillUuid) async {
    await (_db.update(_db.splitBillTable)
          ..where((t) => t.uuid.equals(splitBillUuid)))
        .write(SplitBillTableCompanion(
      status: Value(SplitBillStatus.completed.name),
      completedAt: Value(TimeHelper.now()),
    ));
  }

  // ===================================
  // UTILITIES
  // ===================================

  @override
  List<double> calculateEqualSplit(double total, int guestCount) {
    if (guestCount <= 0) return [];

    final baseAmount = (total / guestCount * 100).floor() / 100;
    final remainder = total - (baseAmount * guestCount);

    return List.generate(guestCount, (i) {
      // Add remainder to first guest
      return i == 0 ? baseAmount + remainder : baseAmount;
    });
  }

  @override
  Map<int, double> calculateWithTip(
      double total, int guestCount, double tipPercent) {
    final tipAmount = total * tipPercent / 100;
    final grandTotal = total + tipAmount;
    final amounts = calculateEqualSplit(grandTotal, guestCount);

    return Map.fromIterables(
      List.generate(guestCount, (i) => i + 1),
      amounts,
    );
  }

  @override
  List<SplitPreset> getSplitPresets() {
    return const [
      SplitPreset(label: '2 Ways', guestCount: 2, mode: SplitMode.equal),
      SplitPreset(label: '3 Ways', guestCount: 3, mode: SplitMode.equal),
      SplitPreset(label: '4 Ways', guestCount: 4, mode: SplitMode.equal),
      SplitPreset(label: 'By Item', guestCount: 2, mode: SplitMode.byItem),
      SplitPreset(label: 'Custom', guestCount: 2, mode: SplitMode.custom),
    ];
  }

  // ===================================
  // MAPPERS
  // ===================================

  Future<SplitBill> _mapToSplitBill(SplitBillTableData row) async {
    // Get guest bills
    final guestRows = await (_db.select(_db.guestBillTable)
          ..where((t) => t.splitBillUuid.equals(row.uuid)))
        .get();

    final guestBills =
        await Future.wait(guestRows.map((g) => _mapToGuestBill(g)));

    return SplitBill(
      uuid: row.uuid,
      orderUuid: row.orderUuid,
      orderNumber: row.orderNumber,
      originalTotal: row.originalTotal,
      guestCount: row.guestCount,
      mode: SplitMode.values.firstWhere(
        (e) => e.name == row.splitMode,
        orElse: () => SplitMode.equal,
      ),
      status: SplitBillStatus.values.firstWhere(
        (e) => e.name == row.status,
        orElse: () => SplitBillStatus.active,
      ),
      guestBills: guestBills,
      createdByUuid: row.createdByUuid,
      createdByName: row.createdByName,
      createdAt: row.createdAt,
      completedAt: row.completedAt,
    );
  }

  Future<GuestBill> _mapToGuestBill(GuestBillTableData row) async {
    // Get items
    final itemRows = await (_db.select(_db.splitBillItemTable)
          ..where((t) => t.guestBillUuid.equals(row.uuid)))
        .get();

    final items = itemRows
        .map((i) => SplitBillItem(
              uuid: i.uuid,
              orderItemUuid: i.orderItemUuid,
              productName: i.productName,
              price: i.price,
              quantity: i.quantity,
              shareCount: i.shareCount,
              shareIndex: i.shareIndex,
            ))
        .toList();

    return GuestBill(
      uuid: row.uuid,
      splitBillUuid: row.splitBillUuid,
      guestNumber: row.guestNumber,
      guestName: row.guestName,
      items: items,
      totalAmount: row.totalAmount,
      tipAmount: row.tipAmount,
      isPaid: row.isPaid,
      paymentMethod: row.paymentMethod,
      paymentTransactionUuid: row.paymentTransactionUuid,
      paidAt: row.paidAt,
    );
  }
}
