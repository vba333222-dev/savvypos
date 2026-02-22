import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:savvy_pos/features/customers/domain/entities/customer_profile.dart';

part 'customer_event.freezed.dart';

@freezed
class CustomerEvent with _$CustomerEvent {
  const factory CustomerEvent.search(String query) = SearchCustomers;
  const factory CustomerEvent.filterBySegment(CustomerSegment? segment) =
      FilterBySegment;
  const factory CustomerEvent.selectCustomer(String uuid) = SelectCustomer;
  const factory CustomerEvent.addNote(String customerUuid, String content,
      {required bool isCritical}) = AddNote;
  const factory CustomerEvent.refresh() = RefreshCustomers;
  const factory CustomerEvent.addCustomer(
      String name, String phone, String email) = AddCustomer;
}
