import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:savvy_pos/features/customers/domain/entities/customer_profile.dart';

part 'customer_state.freezed.dart';

@freezed
class CustomerState with _$CustomerState {
  const factory CustomerState({
    @Default([]) List<CustomerProfile> customers,
    @Default(false) bool isLoading,
    String? error,
    CustomerProfile? selectedCustomer,
    @Default(null) CustomerSegment? activeFilter,
    @Default('') String searchQuery,
    @Default(null) CustomerInsights? insights,
  }) = _CustomerState;

  factory CustomerState.initial() => const CustomerState();
}
