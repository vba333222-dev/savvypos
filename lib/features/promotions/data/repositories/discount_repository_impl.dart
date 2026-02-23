import 'package:savvy_pos/core/utils/time_helper.dart';
import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/promotions/domain/entities/discount_entities.dart';
import 'package:savvy_pos/features/promotions/domain/repositories/i_discount_repository.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: IDiscountRepository)
class DiscountRepositoryImpl implements IDiscountRepository {
  final AppDatabase _db;
  final _uuid = const Uuid();

  DiscountRepositoryImpl(this._db);

  // ===================================
  // DISCOUNT CRUD
  // ===================================

  @override
  Future<List<Discount>> getDiscounts({
    DiscountStatus? status,
    DiscountType? type,
    DiscountScope? scope,
    bool? activeOnly,
  }) async {
    final query = _db.select(_db.discountTable);

    if (status != null) {
      query.where((t) => t.status.equals(status.name));
    }
    if (type != null) {
      query.where((t) => t.type.equals(type.name));
    }
    if (scope != null) {
      query.where((t) => t.scope.equals(scope.name));
    }

    // activeOnly logic requires more complex date checking, usually done in memory or custom query
    // Here we filter basic status first

    final rows = await query.get();
    var discounts = rows.map(_mapToDiscount).toList();

    if (activeOnly == true) {
      discounts = discounts.where((d) => d.isValid).toList();
    }

    return discounts;
  }

  @override
  Future<Discount?> getDiscount(String uuid) async {
    final row = await (_db.select(_db.discountTable)
          ..where((t) => t.uuid.equals(uuid)))
        .getSingleOrNull();

    if (row == null) return null;
    return _mapToDiscount(row);
  }

  @override
  Future<Discount?> getDiscountByCode(String code) async {
    final row = await (_db.select(_db.discountTable)
          ..where((t) => t.code.equals(code)))
        .getSingleOrNull();

    if (row == null) return null;
    return _mapToDiscount(row);
  }

  @override
  Future<Discount> createDiscount(Discount discount) async {
    final uuid = discount.uuid.isEmpty ? _uuid.v4() : discount.uuid;
    final now = TimeHelper.now();

    await _db.into(_db.discountTable).insert(DiscountTableCompanion(
          uuid: Value(uuid),
          name: Value(discount.name),
          code: Value(discount.code),
          description: Value(discount.description),
          type: Value(discount.type.name),
          scope: Value(discount.scope.name),
          status: Value(discount.status.name),
          percentageOff: Value(discount.percentageOff),
          fixedAmountOff: Value(discount.fixedAmountOff),
          buyQuantity: Value(discount.buyQuantity),
          getQuantity: Value(discount.getQuantity),
          getDiscountPercent: Value(discount.getDiscountPercent),
          tiersJson:
              Value(jsonEncode(discount.tiers.map((e) => e.toJson()).toList())),
          applicableProductUuidsJson:
              Value(jsonEncode(discount.applicableProductUuids)),
          applicableCategoryUuidsJson:
              Value(jsonEncode(discount.applicableCategoryUuids)),
          applicableCustomerUuidsJson:
              Value(jsonEncode(discount.applicableCustomerUuids)),
          minOrderAmount: Value(discount.minOrderAmount),
          maxDiscountAmount: Value(discount.maxDiscountAmount),
          maxUsesTotal: Value(discount.maxUsesTotal),
          maxUsesPerCustomer: Value(discount.maxUsesPerCustomer),
          currentUsageCount: Value(discount.currentUsageCount ?? 0),
          validFrom: Value(discount.validFrom),
          validUntil: Value(discount.validUntil),
          validDaysOfWeekJson: Value(jsonEncode(discount.validDaysOfWeek)),
          validTimeStart: Value(discount.validTimeStart),
          validTimeEnd: Value(discount.validTimeEnd),
          canStackWithOthers: Value(discount.canStackWithOthers),
          stackPriority: Value(discount.stackPriority),
          createdAt: Value(now),
          updatedAt: Value(now),
        ));

    return discount.copyWith(uuid: uuid, createdAt: now, updatedAt: now);
  }

  @override
  Future<void> updateDiscount(Discount discount) async {
    await (_db.update(_db.discountTable)
          ..where((t) => t.uuid.equals(discount.uuid)))
        .write(DiscountTableCompanion(
      name: Value(discount.name),
      description: Value(discount.description),
      status: Value(discount.status.name),
      percentageOff: Value(discount.percentageOff),
      fixedAmountOff: Value(discount.fixedAmountOff),
      tiersJson:
          Value(jsonEncode(discount.tiers.map((e) => e.toJson()).toList())),
      validFrom: Value(discount.validFrom),
      validUntil: Value(discount.validUntil),
      updatedAt: Value(TimeHelper.now()),
    ));
  }

  @override
  Future<void> deleteDiscount(String uuid) async {
    await (_db.delete(_db.discountTable)..where((t) => t.uuid.equals(uuid)))
        .go();
  }

  // ===================================
  // VALIDATION
  // ===================================

  @override
  Future<DiscountValidationResult> validateDiscountCode({
    required String code,
    required double orderTotal,
    required List<String> orderItemUuids,
    String? customerUuid,
  }) async {
    final discount = await getDiscountByCode(code);

    if (discount == null) {
      return const DiscountValidationResult(
          isValid: false, errorMessage: 'Invalid promo code');
    }

    if (!discount.isValid) {
      return const DiscountValidationResult(
          isValid: false, errorMessage: 'Promo code expired or inactive');
    }

    if (discount.minOrderAmount != null &&
        orderTotal < discount.minOrderAmount!) {
      return DiscountValidationResult(
        isValid: false,
        errorMessage:
            'Minimum order amount of \$${discount.minOrderAmount} required',
        discount: discount,
      );
    }

    if (customerUuid != null && discount.applicableCustomerUuids.isNotEmpty) {
      if (!discount.applicableCustomerUuids.contains(customerUuid)) {
        return DiscountValidationResult(
          isValid: false,
          errorMessage: 'This code is not valid for this customer',
          discount: discount,
        );
      }
    }

    // TODO: More complex validation (max uses per customer, specific items) could be added here

    return DiscountValidationResult(isValid: true, discount: discount);
  }

  @override
  bool isApplicableToItem(
      Discount discount, String productUuid, String categoryUuid) {
    if (discount.scope == DiscountScope.order) return true;

    if (discount.applicableProductUuids.isNotEmpty) {
      if (discount.applicableProductUuids.contains(productUuid)) return true;
    }

    if (discount.applicableCategoryUuids.isNotEmpty) {
      if (discount.applicableCategoryUuids.contains(categoryUuid)) return true;
    }

    return false;
  }

  @override
  bool isValidForDateTime(Discount discount, DateTime dateTime) {
    if (discount.validFrom != null && dateTime.isBefore(discount.validFrom!))
      return false;
    if (discount.validUntil != null && dateTime.isAfter(discount.validUntil!))
      return false;

    if (discount.validDaysOfWeek.isNotEmpty) {
      if (!discount.validDaysOfWeek.contains(dateTime.weekday)) return false;
    }

    // TODO: Time check logic (validTimeStart, validTimeEnd)

    return true;
  }

  // ===================================
  // APPLICATION
  // ===================================

  @override
  Future<AppliedDiscount> applyDiscount({
    required String orderUuid,
    required String discountUuid,
    required double discountAmount,
    String? appliedToItemUuid,
    String? appliedToItemName,
    String? appliedByUuid,
  }) async {
    final discount = await getDiscount(discountUuid);
    if (discount == null) throw Exception('Discount not found');

    final uuid = _uuid.v4();
    final now = TimeHelper.now();

    await _db
        .into(_db.appliedDiscountTable)
        .insert(AppliedDiscountTableCompanion(
          uuid: Value(uuid),
          orderUuid: Value(orderUuid),
          discountUuid: Value(discountUuid),
          discountName: Value(discount.name),
          discountCode: Value(discount.code),
          type: Value(discount.type.name),
          discountAmount: Value(discountAmount),
          appliedToItemUuid: Value(appliedToItemUuid),
          appliedToItemName: Value(appliedToItemName),
          appliedByUuid: Value(appliedByUuid),
          appliedAt: Value(now),
        ));

    // increment usage
    await incrementUsageCount(discountUuid);

    return AppliedDiscount(
      uuid: uuid,
      orderUuid: orderUuid,
      discountUuid: discountUuid,
      discountName: discount.name,
      discountCode: discount.code,
      type: discount.type,
      discountAmount: discountAmount,
      appliedToItemUuid: appliedToItemUuid,
      appliedToItemName: appliedToItemName,
      appliedByUuid: appliedByUuid,
      appliedAt: now,
    );
  }

  @override
  double calculateDiscountAmount({
    required Discount discount,
    required double orderTotal,
    required List<OrderItemForDiscount> orderItems,
  }) {
    double amount = 0;

    switch (discount.type) {
      case DiscountType.percentage:
        if (discount.scope == DiscountScope.order) {
          amount = orderTotal * (discount.percentageOff ?? 0) / 100;
        } else {
          // Item/Category scope
          for (final item in orderItems) {
            if (isApplicableToItem(
                discount, item.productUuid, item.categoryUuid)) {
              amount += (item.price * item.quantity) *
                  (discount.percentageOff ?? 0) /
                  100;
            }
          }
        }
        break;

      case DiscountType.fixed:
        amount = discount.fixedAmountOff ?? 0;
        break;

      // TODO: Implement advanced logic for BOGO, etc.
      default:
        amount = 0;
    }

    // Cap max discount
    if (discount.maxDiscountAmount != null &&
        amount > discount.maxDiscountAmount!) {
      amount = discount.maxDiscountAmount!;
    }

    return amount;
  }

  @override
  Future<void> removeAppliedDiscount(String appliedDiscountUuid) async {
    await (_db.delete(_db.appliedDiscountTable)
          ..where((t) => t.uuid.equals(appliedDiscountUuid)))
        .go();
  }

  @override
  Future<List<AppliedDiscount>> getAppliedDiscounts(String orderUuid) async {
    final rows = await (_db.select(_db.appliedDiscountTable)
          ..where((t) => t.orderUuid.equals(orderUuid)))
        .get();

    return rows.map(_mapToAppliedDiscount).toList();
  }

  // ===================================
  // STACKING
  // ===================================

  @override
  Future<List<Discount>> getStackableDiscounts(
      List<String> discountUuids) async {
    if (discountUuids.isEmpty) return [];

    // Logic: fetch discounts, check canStackWithOthers flag
    // This is a simplified implementation
    final discounts = <Discount>[];
    for (var uuid in discountUuids) {
      final d = await getDiscount(uuid);
      if (d != null && d.canStackWithOthers) {
        discounts.add(d);
      }
    }
    return discounts;
  }

  @override
  List<Discount> sortByStackPriority(List<Discount> discounts) {
    final sorted = List<Discount>.from(discounts);
    sorted.sort((a, b) => a.stackPriority.compareTo(b.stackPriority));
    return sorted;
  }

  // ===================================
  // QUICK DISCOUNTS
  // ===================================

  @override
  List<QuickDiscount> getQuickDiscounts() {
    return const [
      QuickDiscount(
          label: 'Employee', percentage: 50, iconType: IconType.employee),
      QuickDiscount(
          label: 'Military', percentage: 10, iconType: IconType.special),
      QuickDiscount(
          label: 'Senior', percentage: 15, iconType: IconType.special),
      QuickDiscount(label: 'VIP', percentage: 20, iconType: IconType.loyalty),
    ];
  }

  @override
  Future<AppliedDiscount> applyQuickDiscount({
    required String orderUuid,
    required double percentage, // ignore: unused_element
    required String label,
    String? appliedByUuid,
  }) async {
    final uuid = _uuid.v4(); // ignore: unused_local_variable
    final now = TimeHelper.now(); // ignore: unused_local_variable

    // Quick discounts are treated as ad-hoc applied discounts without a parent Discount entity definition in this simplified model,
    // OR we could create a temporary hidden Discount entity. For now, we'll just insert into applied table with dummy IDs or
    // we would actually need a mechanism to calculate the amount first.
    // Assuming calculation happens in provider/bloc before calling this.
    // For this repo method, let's assume we need to calculate it inside or it's passed.
    // Wait, the interface signature is weird for quick discount if we don't know the amount.
    // Let's assume we create a logical "Discount" on the fly.

    // Simplification: We insert a record but we'd need the order amount to calc the logical value.
    // Ideally this method should take the calculated amount or we fetch the order.
    // Let's implement minimal viable:

    // Real implementation would involve fetching order, calculating %, applying.
    // Here we return a placeholder or throw unimplemented as we need order total access logic which might be in a usecase.
    // Let's assume we just log it for now as this is data layer.

    throw UnimplementedError(
        'Detail implementation requires order repository dependency which is circular. Move calculation to domain service/usecase.');
  }

  // ===================================
  // USAGE TRACKING
  // ===================================

  @override
  Future<void> incrementUsageCount(String discountUuid) async {
    final discount = await getDiscount(discountUuid);
    if (discount == null) return;

    await (_db.update(_db.discountTable)
          ..where((t) => t.uuid.equals(discountUuid)))
        .write(DiscountTableCompanion(
      currentUsageCount: Value((discount.currentUsageCount ?? 0) + 1),
    ));
  }

  @override
  Future<DiscountUsageStats> getUsageStats(String discountUuid) async {
    // Queries to calculate stats from AppliedDiscountTable
    final applied = await (_db.select(_db.appliedDiscountTable)
          ..where((t) => t.discountUuid.equals(discountUuid)))
        .get();

    final totalUses = applied.length;
    final totalDiscounted =
        applied.fold<double>(0, (sum, a) => sum + a.discountAmount);

    // Group by day
    final usesByDay = <String, int>{};
    for (var a in applied) {
      final date = a.appliedAt.toIso8601String().split('T')[0];
      usesByDay[date] = (usesByDay[date] ?? 0) + 1;
    }

    return DiscountUsageStats(
      totalUses: totalUses,
      totalDiscounted: totalDiscounted,
      avgDiscountAmount: totalUses > 0 ? totalDiscounted / totalUses : 0,
      usesByDay: usesByDay,
    );
  }

  // ===================================
  // MAPPERS
  // ===================================

  Discount _mapToDiscount(DiscountTableData row) {
    return Discount(
      uuid: row.uuid,
      name: row.name,
      code: row.code,
      description: row.description,
      type: DiscountType.values.firstWhere((e) => e.name == row.type),
      scope: DiscountScope.values.firstWhere((e) => e.name == row.scope),
      status: DiscountStatus.values.firstWhere((e) => e.name == row.status),
      percentageOff: row.percentageOff,
      fixedAmountOff: row.fixedAmountOff,
      buyQuantity: row.buyQuantity,
      getQuantity: row.getQuantity,
      getDiscountPercent: row.getDiscountPercent,
      tiers: (jsonDecode(row.tiersJson) as List)
          .map((e) => DiscountTier.fromJson(e))
          .toList(),
      applicableProductUuids:
          List<String>.from(jsonDecode(row.applicableProductUuidsJson)),
      applicableCategoryUuids:
          List<String>.from(jsonDecode(row.applicableCategoryUuidsJson)),
      applicableCustomerUuids:
          List<String>.from(jsonDecode(row.applicableCustomerUuidsJson)),
      minOrderAmount: row.minOrderAmount,
      maxDiscountAmount: row.maxDiscountAmount,
      maxUsesTotal: row.maxUsesTotal,
      maxUsesPerCustomer: row.maxUsesPerCustomer,
      currentUsageCount: row.currentUsageCount,
      validFrom: row.validFrom,
      validUntil: row.validUntil,
      validDaysOfWeek: List<int>.from(jsonDecode(row.validDaysOfWeekJson)),
      validTimeStart: row.validTimeStart,
      validTimeEnd: row.validTimeEnd,
      canStackWithOthers: row.canStackWithOthers,
      stackPriority: row.stackPriority,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  AppliedDiscount _mapToAppliedDiscount(AppliedDiscountTableData row) {
    return AppliedDiscount(
      uuid: row.uuid,
      orderUuid: row.orderUuid,
      discountUuid: row.discountUuid,
      discountName: row.discountName,
      discountCode: row.discountCode,
      type: DiscountType.values.firstWhere((e) => e.name == row.type),
      discountAmount: row.discountAmount,
      appliedToItemUuid: row.appliedToItemUuid,
      appliedToItemName: row.appliedToItemName,
      appliedAt: row.appliedAt,
      appliedByUuid: row.appliedByUuid,
    );
  }
}
