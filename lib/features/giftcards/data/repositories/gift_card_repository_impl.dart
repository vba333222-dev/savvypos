import 'package:savvy_pos/core/utils/time_helper.dart';
import 'dart:math';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/giftcards/domain/entities/gift_card.dart';
import 'package:savvy_pos/features/giftcards/domain/repositories/i_gift_card_repository.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: IGiftCardRepository)
class GiftCardRepositoryImpl implements IGiftCardRepository {
  final AppDatabase _db;
  final _uuid = const Uuid();
  final _random = Random.secure();

  GiftCardRepositoryImpl(this._db);

  // ===================================
  // GIFT CARD CRUD
  // ===================================

  @override
  Future<List<GiftCard>> getGiftCards({
    GiftCardStatus? status,
    String? customerUuid,
    String? searchQuery,
    bool? hasBalance,
  }) async {
    final query = _db.select(_db.giftCardTable);

    if (status != null) {
      query.where((t) => t.status.equals(status.name));
    }
    if (customerUuid != null) {
      query.where((t) => t.customerUuid.equals(customerUuid));
    }
    if (searchQuery != null && searchQuery.isNotEmpty) {
      query.where((t) =>
          t.cardNumber.contains(searchQuery) |
          t.customerName.contains(searchQuery));
    }
    if (hasBalance == true) {
      query.where((t) => t.currentBalance.isBiggerThanValue(0));
    }

    query.orderBy([(t) => OrderingTerm.desc(t.createdAt)]);

    final rows = await query.get();
    return rows.map(_mapToGiftCard).toList();
  }

  @override
  Future<GiftCard?> getGiftCard(String uuid) async {
    final row = await (_db.select(_db.giftCardTable)
          ..where((t) => t.uuid.equals(uuid)))
        .getSingleOrNull();

    if (row == null) return null;
    return _mapToGiftCard(row);
  }

  @override
  Future<GiftCard?> getGiftCardByNumber(String cardNumber) async {
    final row = await (_db.select(_db.giftCardTable)
          ..where((t) => t.cardNumber.equals(cardNumber)))
        .getSingleOrNull();

    if (row == null) return null;
    return _mapToGiftCard(row);
  }

  @override
  Future<GiftCard?> getGiftCardByBarcode(String barcode) async {
    final row = await (_db.select(_db.giftCardTable)
          ..where((t) => t.barcode.equals(barcode)))
        .getSingleOrNull();

    if (row == null) return null;
    return _mapToGiftCard(row);
  }

  // ===================================
  // LIFECYCLE OPERATIONS
  // ===================================

  @override
  Future<GiftCard> activateGiftCard({
    required String cardNumber,
    required double initialValue,
    String? barcode,
    String? customerUuid,
    String? customerName,
    String? customerEmail,
    String? customerPhone,
    String? pin,
    DateTime? expiresAt,
    required String activatedByEmployeeUuid,
    required String activatedByEmployeeName,
    String? notes,
  }) async {
    final uuid = _uuid.v4();
    final now = TimeHelper.now();

    await _db.into(_db.giftCardTable).insert(GiftCardTableCompanion(
          uuid: Value(uuid),
          cardNumber: Value(cardNumber),
          barcode: Value(barcode),
          initialValue: Value(initialValue),
          currentBalance: Value(initialValue),
          customerUuid: Value(customerUuid),
          customerName: Value(customerName),
          customerEmail: Value(customerEmail),
          customerPhone: Value(customerPhone),
          status: Value(GiftCardStatus.active.name),
          activatedAt: Value(now),
          expiresAt: Value(expiresAt),
          pin: Value(pin),
          activatedByEmployeeUuid: Value(activatedByEmployeeUuid),
          activatedByEmployeeName: Value(activatedByEmployeeName),
          notes: Value(notes),
          createdAt: Value(now),
          updatedAt: Value(now),
        ));

    // Record activation transaction
    await _recordTransaction(
      giftCardUuid: uuid,
      type: GiftCardTransactionType.activation,
      amount: initialValue,
      balanceAfter: initialValue,
      performedByUuid: activatedByEmployeeUuid,
      performedByName: activatedByEmployeeName,
      notes: 'Initial activation',
    );

    return GiftCard(
      uuid: uuid,
      cardNumber: cardNumber,
      barcode: barcode,
      initialValue: initialValue,
      currentBalance: initialValue,
      customerUuid: customerUuid,
      customerName: customerName,
      customerEmail: customerEmail,
      customerPhone: customerPhone,
      status: GiftCardStatus.active,
      activatedAt: now,
      expiresAt: expiresAt,
      pin: pin,
      activatedByEmployeeUuid: activatedByEmployeeUuid,
      activatedByEmployeeName: activatedByEmployeeName,
      notes: notes,
      createdAt: now,
      updatedAt: now,
    );
  }

  @override
  Future<GiftCardTransaction> reloadGiftCard({
    required String giftCardUuid,
    required double amount,
    required String performedByUuid,
    required String performedByName,
    String? notes,
  }) async {
    final card = await getGiftCard(giftCardUuid);
    if (card == null) throw Exception('Gift card not found');

    final newBalance = card.currentBalance + amount;

    // Update balance
    await (_db.update(_db.giftCardTable)
          ..where((t) => t.uuid.equals(giftCardUuid)))
        .write(GiftCardTableCompanion(
      currentBalance: Value(newBalance),
      updatedAt: Value(TimeHelper.now()),
    ));

    // Record transaction
    return _recordTransaction(
      giftCardUuid: giftCardUuid,
      type: GiftCardTransactionType.reload,
      amount: amount,
      balanceAfter: newBalance,
      performedByUuid: performedByUuid,
      performedByName: performedByName,
      notes: notes,
    );
  }

  @override
  Future<GiftCardTransaction> redeemGiftCard({
    required String giftCardUuid,
    required double amount,
    required String orderUuid,
    required String orderNumber,
    required String performedByUuid,
    required String performedByName,
    String? pin,
  }) async {
    final card = await getGiftCard(giftCardUuid);
    if (card == null) throw Exception('Gift card not found');
    if (!card.isUsable) throw Exception('Gift card is not usable');
    if (card.currentBalance < amount) throw Exception('Insufficient balance');

    // Validate PIN if required
    if (card.pin != null && card.pin!.isNotEmpty) {
      if (pin == null || pin != card.pin) {
        throw Exception('Invalid PIN');
      }
    }

    final newBalance = card.currentBalance - amount;
    final newStatus =
        newBalance <= 0 ? GiftCardStatus.used : GiftCardStatus.active;

    // Update card
    await (_db.update(_db.giftCardTable)
          ..where((t) => t.uuid.equals(giftCardUuid)))
        .write(GiftCardTableCompanion(
      currentBalance: Value(newBalance),
      status: Value(newStatus.name),
      lastUsedAt: Value(TimeHelper.now()),
      updatedAt: Value(TimeHelper.now()),
    ));

    // Record transaction
    return _recordTransaction(
      giftCardUuid: giftCardUuid,
      type: GiftCardTransactionType.redemption,
      amount: -amount, // Negative for redemption
      balanceAfter: newBalance,
      orderUuid: orderUuid,
      orderNumber: orderNumber,
      performedByUuid: performedByUuid,
      performedByName: performedByName,
    );
  }

  @override
  Future<GiftCardTransaction> refundToGiftCard({
    required String giftCardUuid,
    required double amount,
    required String orderUuid,
    required String orderNumber,
    required String performedByUuid,
    required String performedByName,
    String? notes,
  }) async {
    final card = await getGiftCard(giftCardUuid);
    if (card == null) throw Exception('Gift card not found');

    final newBalance = card.currentBalance + amount;

    // Reactivate if was fully redeemed
    final newStatus = card.status == GiftCardStatus.used
        ? GiftCardStatus.active
        : card.status;

    await (_db.update(_db.giftCardTable)
          ..where((t) => t.uuid.equals(giftCardUuid)))
        .write(GiftCardTableCompanion(
      currentBalance: Value(newBalance),
      status: Value(newStatus.name),
      updatedAt: Value(TimeHelper.now()),
    ));

    return _recordTransaction(
      giftCardUuid: giftCardUuid,
      type: GiftCardTransactionType.refund,
      amount: amount,
      balanceAfter: newBalance,
      orderUuid: orderUuid,
      orderNumber: orderNumber,
      performedByUuid: performedByUuid,
      performedByName: performedByName,
      notes: notes,
    );
  }

  @override
  Future<double> checkBalance(String cardNumber) async {
    final card = await getGiftCardByNumber(cardNumber);
    return card?.currentBalance ?? 0.0;
  }

  @override
  Future<void> suspendGiftCard(String uuid, String reason) async {
    await (_db.update(_db.giftCardTable)..where((t) => t.uuid.equals(uuid)))
        .write(GiftCardTableCompanion(
      status: Value(GiftCardStatus.suspended.name),
      notes: Value(reason),
      updatedAt: Value(TimeHelper.now()),
    ));
  }

  @override
  Future<void> cancelGiftCard(String uuid, String reason) async {
    await (_db.update(_db.giftCardTable)..where((t) => t.uuid.equals(uuid)))
        .write(GiftCardTableCompanion(
      status: Value(GiftCardStatus.cancelled.name),
      notes: Value(reason),
      updatedAt: Value(TimeHelper.now()),
    ));
  }

  // ===================================
  // TRANSACTION HISTORY
  // ===================================

  @override
  Future<List<GiftCardTransaction>> getTransactions({
    required String giftCardUuid,
    GiftCardTransactionType? type,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final query = _db.select(_db.giftCardTransactionTable);

    query.where((t) => t.giftCardUuid.equals(giftCardUuid));

    if (type != null) {
      query.where((t) => t.transactionType.equals(type.name));
    }
    if (startDate != null) {
      query.where((t) => t.timestamp.isBiggerOrEqualValue(startDate));
    }
    if (endDate != null) {
      query.where((t) => t.timestamp.isSmallerOrEqualValue(endDate));
    }

    query.orderBy([(t) => OrderingTerm.desc(t.timestamp)]);

    final rows = await query.get();
    return rows.map(_mapToTransaction).toList();
  }

  @override
  Future<List<GiftCardTransaction>> getAllTransactions({
    DateTime? startDate,
    DateTime? endDate,
    GiftCardTransactionType? type,
    int? limit,
  }) async {
    final query = _db.select(_db.giftCardTransactionTable);

    if (type != null) {
      query.where((t) => t.transactionType.equals(type.name));
    }
    if (startDate != null) {
      query.where((t) => t.timestamp.isBiggerOrEqualValue(startDate));
    }
    if (endDate != null) {
      query.where((t) => t.timestamp.isSmallerOrEqualValue(endDate));
    }

    query.orderBy([(t) => OrderingTerm.desc(t.timestamp)]);

    if (limit != null) {
      query.limit(limit);
    }

    final rows = await query.get();
    return rows.map(_mapToTransaction).toList();
  }

  // ===================================
  // REPORTING
  // ===================================

  @override
  Future<GiftCardSummary> getSummary({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final cards = await getGiftCards();
    final transactions =
        await getAllTransactions(startDate: startDate, endDate: endDate);

    final activations =
        transactions.where((t) => t.type == GiftCardTransactionType.activation);
    final redemptions =
        transactions.where((t) => t.type == GiftCardTransactionType.redemption);

    return GiftCardSummary(
      totalCardsIssued: startDate == null
          ? cards.length
          : cards
              .where(
                  (c) => c.createdAt != null && c.createdAt!.isAfter(startDate))
              .length,
      activeCards: cards.where((c) => c.status == GiftCardStatus.active).length,
      totalValueIssued: activations.fold<double>(0, (sum, t) => sum + t.amount),
      totalRedemptions:
          redemptions.fold<double>(0, (sum, t) => sum + t.amount.abs()),
      outstandingLiability: cards
          .where((c) => c.status == GiftCardStatus.active)
          .fold<double>(0, (sum, c) => sum + c.currentBalance),
      expiredValue: cards
          .where((c) => c.status == GiftCardStatus.expired)
          .fold<double>(0, (sum, c) => sum + c.currentBalance),
      periodStart: startDate,
      periodEnd: endDate,
    );
  }

  @override
  Future<double> getOutstandingLiability() async {
    final cards = await getGiftCards(status: GiftCardStatus.active);
    return cards.fold<double>(0, (sum, c) => sum + c.currentBalance);
  }

  @override
  Future<int> processExpirations() async {
    final now = TimeHelper.now();

    // Find expired cards
    final query = _db.select(_db.giftCardTable)
      ..where((t) =>
          t.status.equals('active') & t.expiresAt.isSmallerThanValue(now));

    final expiredCards = await query.get();

    // Update status to expired
    for (final card in expiredCards) {
      await (_db.update(_db.giftCardTable)
            ..where((t) => t.uuid.equals(card.uuid)))
          .write(GiftCardTableCompanion(
        status: Value(GiftCardStatus.expired.name),
        updatedAt: Value(now),
      ));

      // Record expiry transaction
      await _recordTransaction(
        giftCardUuid: card.uuid,
        type: GiftCardTransactionType.expiry,
        amount: -card.currentBalance,
        balanceAfter: 0,
        performedByUuid: 'system',
        performedByName: 'System',
        notes: 'Automatic expiration',
      );
    }

    return expiredCards.length;
  }

  // ===================================
  // UTILITIES
  // ===================================

  @override
  Future<String> generateCardNumber() async {
    String cardNumber;
    bool exists = true;

    // Generate unique 16-digit number
    do {
      cardNumber = List.generate(16, (_) => _random.nextInt(10)).join();
      final existing = await getGiftCardByNumber(cardNumber);
      exists = existing != null;
    } while (exists);

    return cardNumber;
  }

  @override
  bool validateCardNumber(String cardNumber) {
    // Basic Luhn algorithm validation
    if (cardNumber.length != 16) return false;
    if (!RegExp(r'^\d{16}$').hasMatch(cardNumber)) return false;

    int sum = 0;
    for (int i = 0; i < cardNumber.length; i++) {
      int digit = int.parse(cardNumber[cardNumber.length - 1 - i]);
      if (i % 2 == 1) {
        digit *= 2;
        if (digit > 9) digit -= 9;
      }
      sum += digit;
    }
    return sum % 10 == 0;
  }

  @override
  Future<bool> validatePin(String giftCardUuid, String pin) async {
    final card = await getGiftCard(giftCardUuid);
    if (card == null) return false;
    if (card.pin == null || card.pin!.isEmpty) return true; // No PIN required
    return card.pin == pin;
  }

  // ===================================
  // HELPERS
  // ===================================

  Future<GiftCardTransaction> _recordTransaction({
    required String giftCardUuid,
    required GiftCardTransactionType type,
    required double amount,
    required double balanceAfter,
    String? orderUuid,
    String? orderNumber,
    required String performedByUuid,
    required String performedByName,
    String? notes,
  }) async {
    final uuid = _uuid.v4();
    final now = TimeHelper.now();

    await _db
        .into(_db.giftCardTransactionTable)
        .insert(GiftCardTransactionTableCompanion(
          uuid: Value(uuid),
          giftCardUuid: Value(giftCardUuid),
          transactionType: Value(type.name),
          amount: Value(amount),
          balanceAfter: Value(balanceAfter),
          orderUuid: Value(orderUuid),
          orderNumber: Value(orderNumber),
          performedByUuid: Value(performedByUuid),
          performedByName: Value(performedByName),
          notes: Value(notes),
          timestamp: Value(now),
        ));

    return GiftCardTransaction(
      uuid: uuid,
      giftCardUuid: giftCardUuid,
      type: type,
      amount: amount,
      balanceAfter: balanceAfter,
      orderUuid: orderUuid,
      orderNumber: orderNumber,
      performedByUuid: performedByUuid,
      performedByName: performedByName,
      notes: notes,
      timestamp: now,
    );
  }

  GiftCard _mapToGiftCard(GiftCardTableData row) {
    return GiftCard(
      uuid: row.uuid,
      cardNumber: row.cardNumber,
      barcode: row.barcode,
      initialValue: row.initialValue,
      currentBalance: row.currentBalance,
      customerUuid: row.customerUuid,
      customerName: row.customerName,
      customerEmail: row.customerEmail,
      customerPhone: row.customerPhone,
      status: GiftCardStatus.values.firstWhere(
        (e) => e.name == row.status,
        orElse: () => GiftCardStatus.active,
      ),
      activatedAt: row.activatedAt,
      expiresAt: row.expiresAt,
      lastUsedAt: row.lastUsedAt,
      pin: row.pin,
      activatedByEmployeeUuid: row.activatedByEmployeeUuid,
      activatedByEmployeeName: row.activatedByEmployeeName,
      notes: row.notes,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  GiftCardTransaction _mapToTransaction(GiftCardTransactionTableData row) {
    return GiftCardTransaction(
      uuid: row.uuid,
      giftCardUuid: row.giftCardUuid,
      type: GiftCardTransactionType.values.firstWhere(
        (e) => e.name == row.transactionType,
        orElse: () => GiftCardTransactionType.adjustment,
      ),
      amount: row.amount,
      balanceAfter: row.balanceAfter,
      orderUuid: row.orderUuid,
      orderNumber: row.orderNumber,
      performedByUuid: row.performedByUuid,
      performedByName: row.performedByName,
      notes: row.notes,
      timestamp: row.timestamp,
    );
  }
}
