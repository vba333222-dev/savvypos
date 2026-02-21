// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_management_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeliveryManagementState {
  List<DeliveryOrder> get pendingOrders => throw _privateConstructorUsedError;
  List<DeliveryOrder> get activeOrders =>
      throw _privateConstructorUsedError; // Accepted but not finished
  bool get isAutoAcceptEnabled => throw _privateConstructorUsedError;
  DeliveryOrder? get lastReceivedOrder =>
      throw _privateConstructorUsedError; // Transient state to trigger UI overlay
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryManagementStateCopyWith<DeliveryManagementState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryManagementStateCopyWith<$Res> {
  factory $DeliveryManagementStateCopyWith(DeliveryManagementState value,
          $Res Function(DeliveryManagementState) then) =
      _$DeliveryManagementStateCopyWithImpl<$Res, DeliveryManagementState>;
  @useResult
  $Res call(
      {List<DeliveryOrder> pendingOrders,
      List<DeliveryOrder> activeOrders,
      bool isAutoAcceptEnabled,
      DeliveryOrder? lastReceivedOrder,
      bool isLoading,
      String? error});

  $DeliveryOrderCopyWith<$Res>? get lastReceivedOrder;
}

/// @nodoc
class _$DeliveryManagementStateCopyWithImpl<$Res,
        $Val extends DeliveryManagementState>
    implements $DeliveryManagementStateCopyWith<$Res> {
  _$DeliveryManagementStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pendingOrders = null,
    Object? activeOrders = null,
    Object? isAutoAcceptEnabled = null,
    Object? lastReceivedOrder = freezed,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      pendingOrders: null == pendingOrders
          ? _value.pendingOrders
          : pendingOrders // ignore: cast_nullable_to_non_nullable
              as List<DeliveryOrder>,
      activeOrders: null == activeOrders
          ? _value.activeOrders
          : activeOrders // ignore: cast_nullable_to_non_nullable
              as List<DeliveryOrder>,
      isAutoAcceptEnabled: null == isAutoAcceptEnabled
          ? _value.isAutoAcceptEnabled
          : isAutoAcceptEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      lastReceivedOrder: freezed == lastReceivedOrder
          ? _value.lastReceivedOrder
          : lastReceivedOrder // ignore: cast_nullable_to_non_nullable
              as DeliveryOrder?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of DeliveryManagementState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeliveryOrderCopyWith<$Res>? get lastReceivedOrder {
    if (_value.lastReceivedOrder == null) {
      return null;
    }

    return $DeliveryOrderCopyWith<$Res>(_value.lastReceivedOrder!, (value) {
      return _then(_value.copyWith(lastReceivedOrder: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeliveryManagementStateImplCopyWith<$Res>
    implements $DeliveryManagementStateCopyWith<$Res> {
  factory _$$DeliveryManagementStateImplCopyWith(
          _$DeliveryManagementStateImpl value,
          $Res Function(_$DeliveryManagementStateImpl) then) =
      __$$DeliveryManagementStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DeliveryOrder> pendingOrders,
      List<DeliveryOrder> activeOrders,
      bool isAutoAcceptEnabled,
      DeliveryOrder? lastReceivedOrder,
      bool isLoading,
      String? error});

  @override
  $DeliveryOrderCopyWith<$Res>? get lastReceivedOrder;
}

/// @nodoc
class __$$DeliveryManagementStateImplCopyWithImpl<$Res>
    extends _$DeliveryManagementStateCopyWithImpl<$Res,
        _$DeliveryManagementStateImpl>
    implements _$$DeliveryManagementStateImplCopyWith<$Res> {
  __$$DeliveryManagementStateImplCopyWithImpl(
      _$DeliveryManagementStateImpl _value,
      $Res Function(_$DeliveryManagementStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pendingOrders = null,
    Object? activeOrders = null,
    Object? isAutoAcceptEnabled = null,
    Object? lastReceivedOrder = freezed,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$DeliveryManagementStateImpl(
      pendingOrders: null == pendingOrders
          ? _value._pendingOrders
          : pendingOrders // ignore: cast_nullable_to_non_nullable
              as List<DeliveryOrder>,
      activeOrders: null == activeOrders
          ? _value._activeOrders
          : activeOrders // ignore: cast_nullable_to_non_nullable
              as List<DeliveryOrder>,
      isAutoAcceptEnabled: null == isAutoAcceptEnabled
          ? _value.isAutoAcceptEnabled
          : isAutoAcceptEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      lastReceivedOrder: freezed == lastReceivedOrder
          ? _value.lastReceivedOrder
          : lastReceivedOrder // ignore: cast_nullable_to_non_nullable
              as DeliveryOrder?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DeliveryManagementStateImpl implements _DeliveryManagementState {
  const _$DeliveryManagementStateImpl(
      {final List<DeliveryOrder> pendingOrders = const [],
      final List<DeliveryOrder> activeOrders = const [],
      this.isAutoAcceptEnabled = false,
      this.lastReceivedOrder,
      this.isLoading = false,
      this.error})
      : _pendingOrders = pendingOrders,
        _activeOrders = activeOrders;

  final List<DeliveryOrder> _pendingOrders;
  @override
  @JsonKey()
  List<DeliveryOrder> get pendingOrders {
    if (_pendingOrders is EqualUnmodifiableListView) return _pendingOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pendingOrders);
  }

  final List<DeliveryOrder> _activeOrders;
  @override
  @JsonKey()
  List<DeliveryOrder> get activeOrders {
    if (_activeOrders is EqualUnmodifiableListView) return _activeOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeOrders);
  }

// Accepted but not finished
  @override
  @JsonKey()
  final bool isAutoAcceptEnabled;
  @override
  final DeliveryOrder? lastReceivedOrder;
// Transient state to trigger UI overlay
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'DeliveryManagementState(pendingOrders: $pendingOrders, activeOrders: $activeOrders, isAutoAcceptEnabled: $isAutoAcceptEnabled, lastReceivedOrder: $lastReceivedOrder, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryManagementStateImpl &&
            const DeepCollectionEquality()
                .equals(other._pendingOrders, _pendingOrders) &&
            const DeepCollectionEquality()
                .equals(other._activeOrders, _activeOrders) &&
            (identical(other.isAutoAcceptEnabled, isAutoAcceptEnabled) ||
                other.isAutoAcceptEnabled == isAutoAcceptEnabled) &&
            (identical(other.lastReceivedOrder, lastReceivedOrder) ||
                other.lastReceivedOrder == lastReceivedOrder) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pendingOrders),
      const DeepCollectionEquality().hash(_activeOrders),
      isAutoAcceptEnabled,
      lastReceivedOrder,
      isLoading,
      error);

  /// Create a copy of DeliveryManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryManagementStateImplCopyWith<_$DeliveryManagementStateImpl>
      get copyWith => __$$DeliveryManagementStateImplCopyWithImpl<
          _$DeliveryManagementStateImpl>(this, _$identity);
}

abstract class _DeliveryManagementState implements DeliveryManagementState {
  const factory _DeliveryManagementState(
      {final List<DeliveryOrder> pendingOrders,
      final List<DeliveryOrder> activeOrders,
      final bool isAutoAcceptEnabled,
      final DeliveryOrder? lastReceivedOrder,
      final bool isLoading,
      final String? error}) = _$DeliveryManagementStateImpl;

  @override
  List<DeliveryOrder> get pendingOrders;
  @override
  List<DeliveryOrder> get activeOrders; // Accepted but not finished
  @override
  bool get isAutoAcceptEnabled;
  @override
  DeliveryOrder? get lastReceivedOrder; // Transient state to trigger UI overlay
  @override
  bool get isLoading;
  @override
  String? get error;

  /// Create a copy of DeliveryManagementState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryManagementStateImplCopyWith<_$DeliveryManagementStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
