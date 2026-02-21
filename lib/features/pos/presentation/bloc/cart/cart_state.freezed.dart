// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartItem {
  String get uuid =>
      throw _privateConstructorUsedError; // Unique ID for this line item (to distinguish variants)
  Product get product => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get total =>
      throw _privateConstructorUsedError; // (price + modifiers) * quantity - discount
  double get discountedTotal =>
      throw _privateConstructorUsedError; // New field for display Strikethrough
  List<ModifierItem> get modifiers => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String? get appliedPromoCode =>
      throw _privateConstructorUsedError; // To track which promo hit this item
  CourseType get courseType => throw _privateConstructorUsedError;
  FiringStatus get firingStatus => throw _privateConstructorUsedError;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartItemCopyWith<CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemCopyWith<$Res> {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) =
      _$CartItemCopyWithImpl<$Res, CartItem>;
  @useResult
  $Res call(
      {String uuid,
      Product product,
      int quantity,
      double total,
      double discountedTotal,
      List<ModifierItem> modifiers,
      String? note,
      String? appliedPromoCode,
      CourseType courseType,
      FiringStatus firingStatus});
}

/// @nodoc
class _$CartItemCopyWithImpl<$Res, $Val extends CartItem>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? product = null,
    Object? quantity = null,
    Object? total = null,
    Object? discountedTotal = null,
    Object? modifiers = null,
    Object? note = freezed,
    Object? appliedPromoCode = freezed,
    Object? courseType = null,
    Object? firingStatus = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      discountedTotal: null == discountedTotal
          ? _value.discountedTotal
          : discountedTotal // ignore: cast_nullable_to_non_nullable
              as double,
      modifiers: null == modifiers
          ? _value.modifiers
          : modifiers // ignore: cast_nullable_to_non_nullable
              as List<ModifierItem>,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      appliedPromoCode: freezed == appliedPromoCode
          ? _value.appliedPromoCode
          : appliedPromoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      courseType: null == courseType
          ? _value.courseType
          : courseType // ignore: cast_nullable_to_non_nullable
              as CourseType,
      firingStatus: null == firingStatus
          ? _value.firingStatus
          : firingStatus // ignore: cast_nullable_to_non_nullable
              as FiringStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartItemImplCopyWith<$Res>
    implements $CartItemCopyWith<$Res> {
  factory _$$CartItemImplCopyWith(
          _$CartItemImpl value, $Res Function(_$CartItemImpl) then) =
      __$$CartItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      Product product,
      int quantity,
      double total,
      double discountedTotal,
      List<ModifierItem> modifiers,
      String? note,
      String? appliedPromoCode,
      CourseType courseType,
      FiringStatus firingStatus});
}

/// @nodoc
class __$$CartItemImplCopyWithImpl<$Res>
    extends _$CartItemCopyWithImpl<$Res, _$CartItemImpl>
    implements _$$CartItemImplCopyWith<$Res> {
  __$$CartItemImplCopyWithImpl(
      _$CartItemImpl _value, $Res Function(_$CartItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? product = null,
    Object? quantity = null,
    Object? total = null,
    Object? discountedTotal = null,
    Object? modifiers = null,
    Object? note = freezed,
    Object? appliedPromoCode = freezed,
    Object? courseType = null,
    Object? firingStatus = null,
  }) {
    return _then(_$CartItemImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      discountedTotal: null == discountedTotal
          ? _value.discountedTotal
          : discountedTotal // ignore: cast_nullable_to_non_nullable
              as double,
      modifiers: null == modifiers
          ? _value._modifiers
          : modifiers // ignore: cast_nullable_to_non_nullable
              as List<ModifierItem>,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      appliedPromoCode: freezed == appliedPromoCode
          ? _value.appliedPromoCode
          : appliedPromoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      courseType: null == courseType
          ? _value.courseType
          : courseType // ignore: cast_nullable_to_non_nullable
              as CourseType,
      firingStatus: null == firingStatus
          ? _value.firingStatus
          : firingStatus // ignore: cast_nullable_to_non_nullable
              as FiringStatus,
    ));
  }
}

/// @nodoc

class _$CartItemImpl implements _CartItem {
  const _$CartItemImpl(
      {required this.uuid,
      required this.product,
      required this.quantity,
      required this.total,
      this.discountedTotal = 0.0,
      final List<ModifierItem> modifiers = const [],
      this.note,
      this.appliedPromoCode,
      this.courseType = CourseType.defaultCourse,
      this.firingStatus = FiringStatus.fired})
      : _modifiers = modifiers;

  @override
  final String uuid;
// Unique ID for this line item (to distinguish variants)
  @override
  final Product product;
  @override
  final int quantity;
  @override
  final double total;
// (price + modifiers) * quantity - discount
  @override
  @JsonKey()
  final double discountedTotal;
// New field for display Strikethrough
  final List<ModifierItem> _modifiers;
// New field for display Strikethrough
  @override
  @JsonKey()
  List<ModifierItem> get modifiers {
    if (_modifiers is EqualUnmodifiableListView) return _modifiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modifiers);
  }

  @override
  final String? note;
  @override
  final String? appliedPromoCode;
// To track which promo hit this item
  @override
  @JsonKey()
  final CourseType courseType;
  @override
  @JsonKey()
  final FiringStatus firingStatus;

  @override
  String toString() {
    return 'CartItem(uuid: $uuid, product: $product, quantity: $quantity, total: $total, discountedTotal: $discountedTotal, modifiers: $modifiers, note: $note, appliedPromoCode: $appliedPromoCode, courseType: $courseType, firingStatus: $firingStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.discountedTotal, discountedTotal) ||
                other.discountedTotal == discountedTotal) &&
            const DeepCollectionEquality()
                .equals(other._modifiers, _modifiers) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.appliedPromoCode, appliedPromoCode) ||
                other.appliedPromoCode == appliedPromoCode) &&
            (identical(other.courseType, courseType) ||
                other.courseType == courseType) &&
            (identical(other.firingStatus, firingStatus) ||
                other.firingStatus == firingStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      product,
      quantity,
      total,
      discountedTotal,
      const DeepCollectionEquality().hash(_modifiers),
      note,
      appliedPromoCode,
      courseType,
      firingStatus);

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      __$$CartItemImplCopyWithImpl<_$CartItemImpl>(this, _$identity);
}

abstract class _CartItem implements CartItem {
  const factory _CartItem(
      {required final String uuid,
      required final Product product,
      required final int quantity,
      required final double total,
      final double discountedTotal,
      final List<ModifierItem> modifiers,
      final String? note,
      final String? appliedPromoCode,
      final CourseType courseType,
      final FiringStatus firingStatus}) = _$CartItemImpl;

  @override
  String get uuid; // Unique ID for this line item (to distinguish variants)
  @override
  Product get product;
  @override
  int get quantity;
  @override
  double get total; // (price + modifiers) * quantity - discount
  @override
  double get discountedTotal; // New field for display Strikethrough
  @override
  List<ModifierItem> get modifiers;
  @override
  String? get note;
  @override
  String? get appliedPromoCode; // To track which promo hit this item
  @override
  CourseType get courseType;
  @override
  FiringStatus get firingStatus;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CartState {
  List<CartItem> get items => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  double get tax => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError; // CRM & Advanced
  Customer? get customer => throw _privateConstructorUsedError;
  double get discountPercent => throw _privateConstructorUsedError;
  double get discountFixed => throw _privateConstructorUsedError; // Promotions
  List<Promotion> get activePromotions =>
      throw _privateConstructorUsedError; // Dine-In
  String? get activeTableUuid => throw _privateConstructorUsedError;
  String? get activeOrderUuid =>
      throw _privateConstructorUsedError; // Only if retrieving an OPEN order
  String? get lastOrderNumber => throw _privateConstructorUsedError;
  OrderTableData? get lastCompletedOrder => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
  @useResult
  $Res call(
      {List<CartItem> items,
      double subtotal,
      double tax,
      double discount,
      double total,
      Customer? customer,
      double discountPercent,
      double discountFixed,
      List<Promotion> activePromotions,
      String? activeTableUuid,
      String? activeOrderUuid,
      String? lastOrderNumber,
      OrderTableData? lastCompletedOrder,
      bool isLoading,
      bool isSuccess,
      String? error});

  $CustomerCopyWith<$Res>? get customer;
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? subtotal = null,
    Object? tax = null,
    Object? discount = null,
    Object? total = null,
    Object? customer = freezed,
    Object? discountPercent = null,
    Object? discountFixed = null,
    Object? activePromotions = null,
    Object? activeTableUuid = freezed,
    Object? activeOrderUuid = freezed,
    Object? lastOrderNumber = freezed,
    Object? lastCompletedOrder = freezed,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      discountPercent: null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double,
      discountFixed: null == discountFixed
          ? _value.discountFixed
          : discountFixed // ignore: cast_nullable_to_non_nullable
              as double,
      activePromotions: null == activePromotions
          ? _value.activePromotions
          : activePromotions // ignore: cast_nullable_to_non_nullable
              as List<Promotion>,
      activeTableUuid: freezed == activeTableUuid
          ? _value.activeTableUuid
          : activeTableUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      activeOrderUuid: freezed == activeOrderUuid
          ? _value.activeOrderUuid
          : activeOrderUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      lastOrderNumber: freezed == lastOrderNumber
          ? _value.lastOrderNumber
          : lastOrderNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      lastCompletedOrder: freezed == lastCompletedOrder
          ? _value.lastCompletedOrder
          : lastCompletedOrder // ignore: cast_nullable_to_non_nullable
              as OrderTableData?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $CustomerCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartStateImplCopyWith<$Res>
    implements $CartStateCopyWith<$Res> {
  factory _$$CartStateImplCopyWith(
          _$CartStateImpl value, $Res Function(_$CartStateImpl) then) =
      __$$CartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CartItem> items,
      double subtotal,
      double tax,
      double discount,
      double total,
      Customer? customer,
      double discountPercent,
      double discountFixed,
      List<Promotion> activePromotions,
      String? activeTableUuid,
      String? activeOrderUuid,
      String? lastOrderNumber,
      OrderTableData? lastCompletedOrder,
      bool isLoading,
      bool isSuccess,
      String? error});

  @override
  $CustomerCopyWith<$Res>? get customer;
}

/// @nodoc
class __$$CartStateImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartStateImpl>
    implements _$$CartStateImplCopyWith<$Res> {
  __$$CartStateImplCopyWithImpl(
      _$CartStateImpl _value, $Res Function(_$CartStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? subtotal = null,
    Object? tax = null,
    Object? discount = null,
    Object? total = null,
    Object? customer = freezed,
    Object? discountPercent = null,
    Object? discountFixed = null,
    Object? activePromotions = null,
    Object? activeTableUuid = freezed,
    Object? activeOrderUuid = freezed,
    Object? lastOrderNumber = freezed,
    Object? lastCompletedOrder = freezed,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? error = freezed,
  }) {
    return _then(_$CartStateImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      discountPercent: null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double,
      discountFixed: null == discountFixed
          ? _value.discountFixed
          : discountFixed // ignore: cast_nullable_to_non_nullable
              as double,
      activePromotions: null == activePromotions
          ? _value._activePromotions
          : activePromotions // ignore: cast_nullable_to_non_nullable
              as List<Promotion>,
      activeTableUuid: freezed == activeTableUuid
          ? _value.activeTableUuid
          : activeTableUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      activeOrderUuid: freezed == activeOrderUuid
          ? _value.activeOrderUuid
          : activeOrderUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      lastOrderNumber: freezed == lastOrderNumber
          ? _value.lastOrderNumber
          : lastOrderNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      lastCompletedOrder: freezed == lastCompletedOrder
          ? _value.lastCompletedOrder
          : lastCompletedOrder // ignore: cast_nullable_to_non_nullable
              as OrderTableData?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CartStateImpl implements _CartState {
  const _$CartStateImpl(
      {final List<CartItem> items = const [],
      this.subtotal = 0.0,
      this.tax = 0.0,
      this.discount = 0.0,
      this.total = 0.0,
      this.customer,
      this.discountPercent = 0.0,
      this.discountFixed = 0.0,
      final List<Promotion> activePromotions = const [],
      this.activeTableUuid,
      this.activeOrderUuid,
      this.lastOrderNumber,
      this.lastCompletedOrder,
      this.isLoading = false,
      this.isSuccess = false,
      this.error})
      : _items = items,
        _activePromotions = activePromotions;

  final List<CartItem> _items;
  @override
  @JsonKey()
  List<CartItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final double subtotal;
  @override
  @JsonKey()
  final double tax;
  @override
  @JsonKey()
  final double discount;
  @override
  @JsonKey()
  final double total;
// CRM & Advanced
  @override
  final Customer? customer;
  @override
  @JsonKey()
  final double discountPercent;
  @override
  @JsonKey()
  final double discountFixed;
// Promotions
  final List<Promotion> _activePromotions;
// Promotions
  @override
  @JsonKey()
  List<Promotion> get activePromotions {
    if (_activePromotions is EqualUnmodifiableListView)
      return _activePromotions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activePromotions);
  }

// Dine-In
  @override
  final String? activeTableUuid;
  @override
  final String? activeOrderUuid;
// Only if retrieving an OPEN order
  @override
  final String? lastOrderNumber;
  @override
  final OrderTableData? lastCompletedOrder;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  final String? error;

  @override
  String toString() {
    return 'CartState(items: $items, subtotal: $subtotal, tax: $tax, discount: $discount, total: $total, customer: $customer, discountPercent: $discountPercent, discountFixed: $discountFixed, activePromotions: $activePromotions, activeTableUuid: $activeTableUuid, activeOrderUuid: $activeOrderUuid, lastOrderNumber: $lastOrderNumber, lastCompletedOrder: $lastCompletedOrder, isLoading: $isLoading, isSuccess: $isSuccess, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartStateImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.discountPercent, discountPercent) ||
                other.discountPercent == discountPercent) &&
            (identical(other.discountFixed, discountFixed) ||
                other.discountFixed == discountFixed) &&
            const DeepCollectionEquality()
                .equals(other._activePromotions, _activePromotions) &&
            (identical(other.activeTableUuid, activeTableUuid) ||
                other.activeTableUuid == activeTableUuid) &&
            (identical(other.activeOrderUuid, activeOrderUuid) ||
                other.activeOrderUuid == activeOrderUuid) &&
            (identical(other.lastOrderNumber, lastOrderNumber) ||
                other.lastOrderNumber == lastOrderNumber) &&
            const DeepCollectionEquality()
                .equals(other.lastCompletedOrder, lastCompletedOrder) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      subtotal,
      tax,
      discount,
      total,
      customer,
      discountPercent,
      discountFixed,
      const DeepCollectionEquality().hash(_activePromotions),
      activeTableUuid,
      activeOrderUuid,
      lastOrderNumber,
      const DeepCollectionEquality().hash(lastCompletedOrder),
      isLoading,
      isSuccess,
      error);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      __$$CartStateImplCopyWithImpl<_$CartStateImpl>(this, _$identity);
}

abstract class _CartState implements CartState {
  const factory _CartState(
      {final List<CartItem> items,
      final double subtotal,
      final double tax,
      final double discount,
      final double total,
      final Customer? customer,
      final double discountPercent,
      final double discountFixed,
      final List<Promotion> activePromotions,
      final String? activeTableUuid,
      final String? activeOrderUuid,
      final String? lastOrderNumber,
      final OrderTableData? lastCompletedOrder,
      final bool isLoading,
      final bool isSuccess,
      final String? error}) = _$CartStateImpl;

  @override
  List<CartItem> get items;
  @override
  double get subtotal;
  @override
  double get tax;
  @override
  double get discount;
  @override
  double get total; // CRM & Advanced
  @override
  Customer? get customer;
  @override
  double get discountPercent;
  @override
  double get discountFixed; // Promotions
  @override
  List<Promotion> get activePromotions; // Dine-In
  @override
  String? get activeTableUuid;
  @override
  String? get activeOrderUuid; // Only if retrieving an OPEN order
  @override
  String? get lastOrderNumber;
  @override
  OrderTableData? get lastCompletedOrder;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  String? get error;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
