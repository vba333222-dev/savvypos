import 'package:savvy_pos/features/customers/domain/entities/customer.dart';

abstract class ICustomerRepository {
  Stream<List<Customer>> watchAllCustomers();
  Future<List<Customer>> searchCustomers(String query);
  Future<Customer?> getCustomerByUuid(String uuid);
  Future<void> saveCustomer(Customer customer);
  Future<void> deleteCustomer(String uuid);
}
