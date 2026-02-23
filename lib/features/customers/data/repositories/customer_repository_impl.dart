import 'package:savvy_pos/core/utils/time_helper.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/core/database/database.dart';
import 'package:savvy_pos/features/customers/domain/entities/customer.dart';
import 'package:savvy_pos/features/customers/domain/repositories/i_customer_repository.dart';

@LazySingleton(as: ICustomerRepository)
class CustomerRepositoryImpl implements ICustomerRepository {
  final AppDatabase db;

  CustomerRepositoryImpl(this.db);

  @override
  Stream<List<Customer>> watchAllCustomers() {
    return (db.select(db.customerTable)
          ..where((t) => t.isDeleted.equals(false)))
        .watch()
        .map((rows) => rows.map(_mapToDomain).toList());
  }

  @override
  Future<List<Customer>> searchCustomers(String query) async {
    final rows = await (db.select(db.customerTable)
          ..where((t) =>
              t.isDeleted.equals(false) &
              (t.name.contains(query) |
                  t.phone.contains(query) |
                  t.email.contains(query))))
        .get();

    return rows.map(_mapToDomain).toList();
  }

  @override
  Future<Customer?> getCustomerByUuid(String uuid) async {
    final row = await (db.select(db.customerTable)
          ..where((t) => t.uuid.equals(uuid)))
        .getSingleOrNull();
    return row != null ? _mapToDomain(row) : null;
  }

  @override
  Future<void> saveCustomer(Customer customer) async {
    final companion = CustomerTableCompanion(
      uuid: Value(customer.uuid),
      name: Value(customer.name),
      phone: Value(customer.phone),
      email: Value(customer.email),
      totalPoints: Value(customer.totalPoints),
      lastVisitAt: Value(customer.lastVisitAt),
      updatedAt: Value(TimeHelper.now()),
      isSynced: const Value(false),
      isDeleted: const Value(false),
    );

    await db.into(db.customerTable).insertOnConflictUpdate(companion);
  }

  @override
  Future<void> deleteCustomer(String uuid) async {
    await (db.update(db.customerTable)..where((t) => t.uuid.equals(uuid)))
        .write(CustomerTableCompanion(
      isDeleted: const Value(true),
      updatedAt: Value(TimeHelper.now()),
      isSynced: const Value(false),
    ));
  }

  Customer _mapToDomain(CustomerTableData row) {
    return Customer(
      uuid: row.uuid,
      name: row.name,
      phone: row.phone,
      email: row.email,
      totalPoints: row.totalPoints,
      lastVisitAt: row.lastVisitAt,
    );
  }
}
