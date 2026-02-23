import 'package:savvy_pos/core/utils/time_helper.dart';
import 'package:drift/drift.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/customers/domain/entities/customer_profile.dart';
import 'package:savvy_pos/features/customers/domain/repositories/i_customer_crm_repository.dart';
import 'package:uuid/uuid.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ICustomerCrmRepository)
class CustomerCrmRepositoryImpl implements ICustomerCrmRepository {
  final AppDatabase db;

  CustomerCrmRepositoryImpl(this.db);

  CustomerSegment _calculateSegment(
      int visitCount, double totalSpent, DateTime? lastVisit) {
    if (lastVisit != null && TimeHelper.now().difference(lastVisit).inDays > 60) {
      return CustomerSegment.lapsed;
    }
    if (totalSpent > 500) return CustomerSegment.vip;
    if (visitCount >= 6) return CustomerSegment.regular;
    if (visitCount >= 2) return CustomerSegment.returning;
    return CustomerSegment.newGuest;
  }

  Future<List<CustomerNote>> _getNotesForCustomer(String customerUuid) async {
    final rows = await (db.select(db.customerNoteTable)
          ..where((t) => t.customerUuid.equals(customerUuid))
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .get();

    return rows
        .map((r) => CustomerNote(
              id: r.uuid,
              content: r.content,
              createdBy: r.createdBy,
              createdAt: r.createdAt,
              isCritical: r.isCritical,
            ))
        .toList();
  }

  Future<List<String>> _getTagsForCustomer(String customerUuid) async {
    final rows = await (db.select(db.customerTagTable)
          ..where((t) => t.customerUuid.equals(customerUuid)))
        .get();
    return rows.map((r) => r.tag).toList();
  }

  Future<CustomerProfile> _buildProfile(CustomerTableData c) async {
    final notes = await _getNotesForCustomer(c.uuid);
    final tags = await _getTagsForCustomer(c.uuid);

    // Get order stats
    final ordersQuery = await (db.select(db.orderTable)
          ..where((t) => t.customerUuid.equals(c.uuid))
          ..orderBy([(t) => OrderingTerm.desc(t.transactionDate)]))
        .get();

    final visitCount = ordersQuery.length;
    final totalSpent =
        ordersQuery.fold<double>(0, (sum, o) => sum + o.grandTotal);
    final firstVisit =
        ordersQuery.isEmpty ? null : ordersQuery.last.transactionDate;
    final lastVisit =
        ordersQuery.isEmpty ? null : ordersQuery.first.transactionDate;
    final avgOrder = visitCount > 0 ? totalSpent / visitCount : 0.0;

    return CustomerProfile(
      uuid: c.uuid,
      name: c.name,
      email: c.email,
      phoneNumber: c.phone,
      birthday: null, // Not in current schema
      visitCount: visitCount,
      totalSpent: totalSpent,
      averageOrderValue: avgOrder,
      firstVisit: firstVisit,
      lastVisit: lastVisit,
      tags: tags,
      notes: notes,
      segment: _calculateSegment(visitCount, totalSpent, lastVisit),
    );
  }

  @override
  Future<CustomerProfile?> getCustomer(String uuid) async {
    final row = await (db.select(db.customerTable)
          ..where((t) => t.uuid.equals(uuid)))
        .getSingleOrNull();
    if (row == null) return null;
    return _buildProfile(row);
  }

  @override
  Future<CustomerProfile?> getCustomerByPhone(String phoneNumber) async {
    final row = await (db.select(db.customerTable)
          ..where((t) => t.phone.equals(phoneNumber)))
        .getSingleOrNull();
    if (row == null) return null;
    return _buildProfile(row);
  }

  @override
  Future<List<CustomerProfile>> getAllCustomers(
      {CustomerSegment? segment, String? searchQuery}) async {
    var query = db.select(db.customerTable);

    if (searchQuery != null && searchQuery.isNotEmpty) {
      query = query
        ..where((t) =>
            t.name.like('%$searchQuery%') | t.phone.like('%$searchQuery%'));
    }

    final rows = await query.get();
    final profiles = <CustomerProfile>[];

    for (final row in rows) {
      final profile = await _buildProfile(row);
      if (segment == null || profile.segment == segment) {
        profiles.add(profile);
      }
    }

    // Sort by total spent (VIPs first)
    profiles.sort((a, b) => b.totalSpent.compareTo(a.totalSpent));
    return profiles;
  }

  @override
  Future<List<OrderHistoryItem>> getOrderHistory(String customerUuid,
      {int limit = 50}) async {
    final rows = await (db.select(db.orderTable)
          ..where((t) => t.customerUuid.equals(customerUuid))
          ..orderBy([(t) => OrderingTerm.desc(t.transactionDate)])
          ..limit(limit))
        .get();

    return rows
        .map((r) => OrderHistoryItem(
              orderUuid: r.uuid,
              orderDate: r.transactionDate,
              total: r.grandTotal,
              itemCount: 0, // Would need join
              paymentMethod: r.paymentMethod ?? 'UNKNOWN',
              channel: null,
            ))
        .toList();
  }

  @override
  Future<void> addNote(String customerUuid, String content, String createdBy,
      {bool isCritical = false}) async {
    await db.into(db.customerNoteTable).insert(
          CustomerNoteTableCompanion.insert(
            uuid: const Uuid().v4(),
            customerUuid: customerUuid,
            content: content,
            createdBy: createdBy,
            createdAt: TimeHelper.now(),
            isCritical: Value(isCritical),
          ),
        );
  }

  @override
  Future<void> deleteNote(String customerUuid, String noteId) async {
    await (db.delete(db.customerNoteTable)..where((t) => t.uuid.equals(noteId)))
        .go();
  }

  @override
  Future<void> addTag(String customerUuid, String tag) async {
    await db.into(db.customerTagTable).insertOnConflictUpdate(
          CustomerTagTableCompanion.insert(
            customerUuid: customerUuid,
            tag: tag,
          ),
        );
  }

  @override
  Future<void> removeTag(String customerUuid, String tag) async {
    await (db.delete(db.customerTagTable)
          ..where(
              (t) => t.customerUuid.equals(customerUuid) & t.tag.equals(tag)))
        .go();
  }

  @override
  Future<CustomerInsights> getInsights() async {
    final allCustomers = await getAllCustomers();

    int newGuests = 0, returning = 0, lapsed = 0;
    double totalSpendAll = 0;

    for (final c in allCustomers) {
      totalSpendAll += c.totalSpent;
      switch (c.segment) {
        case CustomerSegment.newGuest:
          newGuests++;
          break;
        case CustomerSegment.returning:
        case CustomerSegment.regular:
        case CustomerSegment.vip:
          returning++;
          break;
        case CustomerSegment.lapsed:
          lapsed++;
          break;
      }
    }

    return CustomerInsights(
      totalNewGuests: newGuests,
      totalReturning: returning,
      totalLapsed: lapsed,
      averageSpendAll:
          allCustomers.isNotEmpty ? totalSpendAll / allCustomers.length : 0,
      topItem: 'N/A',
    );
  }

  @override
  Future<CustomerProfile> recalculateSegment(String customerUuid) async {
    return (await getCustomer(customerUuid))!;
  }

  @override
  Future<List<CustomerNote>> getCriticalNotes(String customerUuid) async {
    final notes = await _getNotesForCustomer(customerUuid);
    return notes.where((n) => n.isCritical).toList();
  }

  @override
  Future<CustomerProfile> createCustomer(
      String name, String phone, String email) async {
    final uuid = const Uuid().v4();

    await db.into(db.customerTable).insert(
          CustomerTableCompanion.insert(
            uuid: uuid,
            name: name,
            phone: Value(phone.isEmpty ? null : phone),
            email: Value(email.isEmpty ? null : email),
            updatedAt: TimeHelper.now(),
          ),
        );

    return (await getCustomer(uuid))!;
  }
}
