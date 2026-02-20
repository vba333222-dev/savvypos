import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:savvy_pos/features/customers/domain/repositories/i_customer_crm_repository.dart';
import 'package:savvy_pos/features/customers/presentation/bloc/customer_event.dart';
import 'package:savvy_pos/features/customers/presentation/bloc/customer_state.dart';

@injectable
class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final ICustomerCrmRepository _repo;

  CustomerBloc(this._repo) : super(CustomerState.initial()) {
    on<SearchCustomers>(_onSearch);
    on<FilterBySegment>(_onFilter);
    on<SelectCustomer>(_onSelect);
    on<AddNote>(_onAddNote);
    on<RefreshCustomers>(_onRefresh);
    on<AddCustomer>(_onAddCustomer);

    add(const CustomerEvent.refresh()); // Initial load
  }

  Future<void> _onRefresh(RefreshCustomers event, Emitter<CustomerState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final customers = await _repo.getAllCustomers(
        segment: state.activeFilter,
        searchQuery: state.searchQuery,
      );
      final insights = await _repo.getInsights();
      
      emit(state.copyWith(
        isLoading: false, 
        customers: customers,
        insights: insights,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onSearch(SearchCustomers event, Emitter<CustomerState> emit) async {
    emit(state.copyWith(searchQuery: event.query));
    add(const CustomerEvent.refresh());
  }

  Future<void> _onFilter(FilterBySegment event, Emitter<CustomerState> emit) async {
    emit(state.copyWith(activeFilter: event.segment));
    add(const CustomerEvent.refresh());
  }

  Future<void> _onSelect(SelectCustomer event, Emitter<CustomerState> emit) async {
    try {
      final customer = await _repo.getCustomer(event.uuid);
      emit(state.copyWith(selectedCustomer: customer));
    } catch (e) {
      // Keep silently failed or show toast
    }
  }

  Future<void> _onAddNote(AddNote event, Emitter<CustomerState> emit) async {
    try {
      await _repo.addNote(event.customerUuid, event.content, 'Staff', isCritical: event.isCritical);
      // Refresh current selected if matches
      if (state.selectedCustomer?.uuid == event.customerUuid) {
        add(CustomerEvent.selectCustomer(event.customerUuid));
      }
    } catch (e) {
      emit(state.copyWith(error: 'Failed to add note'));
    }
  }

  Future<void> _onAddCustomer(AddCustomer event, Emitter<CustomerState> emit) async {
    try {
      await _repo.createCustomer(event.name, event.phone, event.email);
      add(const CustomerEvent.refresh());
    } catch (e) {
      emit(state.copyWith(error: 'Failed to add customer: ${e.toString()}'));
    }
  }
}
