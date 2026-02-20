// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomerState {
  List<CustomerProfile> get customers => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  CustomerProfile? get selectedCustomer => throw _privateConstructorUsedError;
  CustomerSegment? get activeFilter => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  CustomerInsights? get insights => throw _privateConstructorUsedError;

  /// Create a copy of CustomerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerStateCopyWith<CustomerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerStateCopyWith<$Res> {
  factory $CustomerStateCopyWith(
          CustomerState value, $Res Function(CustomerState) then) =
      _$CustomerStateCopyWithImpl<$Res, CustomerState>;
  @useResult
  $Res call(
      {List<CustomerProfile> customers,
      bool isLoading,
      String? error,
      CustomerProfile? selectedCustomer,
      CustomerSegment? activeFilter,
      String searchQuery,
      CustomerInsights? insights});

  $CustomerProfileCopyWith<$Res>? get selectedCustomer;
  $CustomerInsightsCopyWith<$Res>? get insights;
}

/// @nodoc
class _$CustomerStateCopyWithImpl<$Res, $Val extends CustomerState>
    implements $CustomerStateCopyWith<$Res> {
  _$CustomerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customers = null,
    Object? isLoading = null,
    Object? error = freezed,
    Object? selectedCustomer = freezed,
    Object? activeFilter = freezed,
    Object? searchQuery = null,
    Object? insights = freezed,
  }) {
    return _then(_value.copyWith(
      customers: null == customers
          ? _value.customers
          : customers // ignore: cast_nullable_to_non_nullable
              as List<CustomerProfile>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCustomer: freezed == selectedCustomer
          ? _value.selectedCustomer
          : selectedCustomer // ignore: cast_nullable_to_non_nullable
              as CustomerProfile?,
      activeFilter: freezed == activeFilter
          ? _value.activeFilter
          : activeFilter // ignore: cast_nullable_to_non_nullable
              as CustomerSegment?,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      insights: freezed == insights
          ? _value.insights
          : insights // ignore: cast_nullable_to_non_nullable
              as CustomerInsights?,
    ) as $Val);
  }

  /// Create a copy of CustomerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerProfileCopyWith<$Res>? get selectedCustomer {
    if (_value.selectedCustomer == null) {
      return null;
    }

    return $CustomerProfileCopyWith<$Res>(_value.selectedCustomer!, (value) {
      return _then(_value.copyWith(selectedCustomer: value) as $Val);
    });
  }

  /// Create a copy of CustomerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerInsightsCopyWith<$Res>? get insights {
    if (_value.insights == null) {
      return null;
    }

    return $CustomerInsightsCopyWith<$Res>(_value.insights!, (value) {
      return _then(_value.copyWith(insights: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomerStateImplCopyWith<$Res>
    implements $CustomerStateCopyWith<$Res> {
  factory _$$CustomerStateImplCopyWith(
          _$CustomerStateImpl value, $Res Function(_$CustomerStateImpl) then) =
      __$$CustomerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CustomerProfile> customers,
      bool isLoading,
      String? error,
      CustomerProfile? selectedCustomer,
      CustomerSegment? activeFilter,
      String searchQuery,
      CustomerInsights? insights});

  @override
  $CustomerProfileCopyWith<$Res>? get selectedCustomer;
  @override
  $CustomerInsightsCopyWith<$Res>? get insights;
}

/// @nodoc
class __$$CustomerStateImplCopyWithImpl<$Res>
    extends _$CustomerStateCopyWithImpl<$Res, _$CustomerStateImpl>
    implements _$$CustomerStateImplCopyWith<$Res> {
  __$$CustomerStateImplCopyWithImpl(
      _$CustomerStateImpl _value, $Res Function(_$CustomerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customers = null,
    Object? isLoading = null,
    Object? error = freezed,
    Object? selectedCustomer = freezed,
    Object? activeFilter = freezed,
    Object? searchQuery = null,
    Object? insights = freezed,
  }) {
    return _then(_$CustomerStateImpl(
      customers: null == customers
          ? _value._customers
          : customers // ignore: cast_nullable_to_non_nullable
              as List<CustomerProfile>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCustomer: freezed == selectedCustomer
          ? _value.selectedCustomer
          : selectedCustomer // ignore: cast_nullable_to_non_nullable
              as CustomerProfile?,
      activeFilter: freezed == activeFilter
          ? _value.activeFilter
          : activeFilter // ignore: cast_nullable_to_non_nullable
              as CustomerSegment?,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      insights: freezed == insights
          ? _value.insights
          : insights // ignore: cast_nullable_to_non_nullable
              as CustomerInsights?,
    ));
  }
}

/// @nodoc

class _$CustomerStateImpl implements _CustomerState {
  const _$CustomerStateImpl(
      {final List<CustomerProfile> customers = const [],
      this.isLoading = false,
      this.error,
      this.selectedCustomer,
      this.activeFilter = null,
      this.searchQuery = '',
      this.insights = null})
      : _customers = customers;

  final List<CustomerProfile> _customers;
  @override
  @JsonKey()
  List<CustomerProfile> get customers {
    if (_customers is EqualUnmodifiableListView) return _customers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customers);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;
  @override
  final CustomerProfile? selectedCustomer;
  @override
  @JsonKey()
  final CustomerSegment? activeFilter;
  @override
  @JsonKey()
  final String searchQuery;
  @override
  @JsonKey()
  final CustomerInsights? insights;

  @override
  String toString() {
    return 'CustomerState(customers: $customers, isLoading: $isLoading, error: $error, selectedCustomer: $selectedCustomer, activeFilter: $activeFilter, searchQuery: $searchQuery, insights: $insights)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerStateImpl &&
            const DeepCollectionEquality()
                .equals(other._customers, _customers) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.selectedCustomer, selectedCustomer) ||
                other.selectedCustomer == selectedCustomer) &&
            (identical(other.activeFilter, activeFilter) ||
                other.activeFilter == activeFilter) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.insights, insights) ||
                other.insights == insights));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_customers),
      isLoading,
      error,
      selectedCustomer,
      activeFilter,
      searchQuery,
      insights);

  /// Create a copy of CustomerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerStateImplCopyWith<_$CustomerStateImpl> get copyWith =>
      __$$CustomerStateImplCopyWithImpl<_$CustomerStateImpl>(this, _$identity);
}

abstract class _CustomerState implements CustomerState {
  const factory _CustomerState(
      {final List<CustomerProfile> customers,
      final bool isLoading,
      final String? error,
      final CustomerProfile? selectedCustomer,
      final CustomerSegment? activeFilter,
      final String searchQuery,
      final CustomerInsights? insights}) = _$CustomerStateImpl;

  @override
  List<CustomerProfile> get customers;
  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  CustomerProfile? get selectedCustomer;
  @override
  CustomerSegment? get activeFilter;
  @override
  String get searchQuery;
  @override
  CustomerInsights? get insights;

  /// Create a copy of CustomerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerStateImplCopyWith<_$CustomerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
