import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/customers/domain/entities/customer.dart';
import 'package:savvy_pos/features/customers/domain/repositories/i_customer_repository.dart';
import 'package:uuid/uuid.dart';

part 'customer_bloc.freezed.dart';

@freezed
class CustomerEvent with _$CustomerEvent {
  const factory CustomerEvent.search(String query) = _Search;
  const factory CustomerEvent.addCustomer(String name, String phone, String email) = _AddCustomer;
  const factory CustomerEvent.updateCustomer(Customer customer) = _UpdateCustomer;
  const factory CustomerEvent.deleteCustomer(String uuid) = _DeleteCustomer;
}

@freezed
class CustomerState with _$CustomerState {
  const factory CustomerState.initial() = _Initial;
  const factory CustomerState.loading() = _Loading;
  const factory CustomerState.loaded(List<Customer> customers) = _Loaded;
  const factory CustomerState.error(String message) = _Error;
}

@injectable
class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final ICustomerRepository _repository;
  final Uuid _uuid = const Uuid();

  CustomerBloc(this._repository) : super(const CustomerState.initial()) {
    on<_Search>(_onSearch);
    on<_AddCustomer>(_onAddCustomer);
    // Add logic to watch all if needed, but search is primary interaction for pos
  }

  Future<void> _onSearch(_Search event, Emitter<CustomerState> emit) async {
    emit(const CustomerState.loading());
    try {
      final results = await _repository.searchCustomers(event.query);
      emit(CustomerState.loaded(results));
    } catch (e) {
      emit(CustomerState.error(e.toString()));
    }
  }

  Future<void> _onAddCustomer(_AddCustomer event, Emitter<CustomerState> emit) async {
    emit(const CustomerState.loading());
    try {
      final customer = Customer(
        uuid: _uuid.v4(),
        name: event.name,
        phone: event.phone,
        email: event.email,
        lastVisitAt: DateTime.now(),
      );
      await _repository.saveCustomer(customer);
      // Refresh list
      add(const CustomerEvent.search('')); 
    } catch (e) {
      emit(CustomerState.error(e.toString()));
    }
  }
}
