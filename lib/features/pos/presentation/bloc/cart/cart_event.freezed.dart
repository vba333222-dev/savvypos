// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Product product, List<ModifierItem> modifiers)
        addProduct,
    required TResult Function(String itemUuid, int quantity) updateQuantity,
    required TResult Function(String itemUuid) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(String barcode) scanItem,
    required TResult Function(Customer? customer) selectCustomer,
    required TResult Function(double? percent, double? fixed) applyDiscount,
    required TResult Function(String code) addPromoCode,
    required TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)
        checkoutProcessed,
    required TResult Function(String tableUuid) parkOrder,
    required TResult Function(String tableUuid) selectTable,
    required TResult Function(String orderUuid, String tableUuid) retrieveOrder,
    required TResult Function(List<String> itemUuids, String paymentMethod)
        checkoutSplit,
    required TResult Function(String productUuid, String? note) updateNote,
    required TResult Function(String itemUuid) toggleItemHold,
    required TResult Function(String itemUuid) fireItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Product product, List<ModifierItem> modifiers)?
        addProduct,
    TResult? Function(String itemUuid, int quantity)? updateQuantity,
    TResult? Function(String itemUuid)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(String barcode)? scanItem,
    TResult? Function(Customer? customer)? selectCustomer,
    TResult? Function(double? percent, double? fixed)? applyDiscount,
    TResult? Function(String code)? addPromoCode,
    TResult? Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult? Function(String tableUuid)? parkOrder,
    TResult? Function(String tableUuid)? selectTable,
    TResult? Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult? Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult? Function(String productUuid, String? note)? updateNote,
    TResult? Function(String itemUuid)? toggleItemHold,
    TResult? Function(String itemUuid)? fireItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Product product, List<ModifierItem> modifiers)? addProduct,
    TResult Function(String itemUuid, int quantity)? updateQuantity,
    TResult Function(String itemUuid)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(String barcode)? scanItem,
    TResult Function(Customer? customer)? selectCustomer,
    TResult Function(double? percent, double? fixed)? applyDiscount,
    TResult Function(String code)? addPromoCode,
    TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult Function(String tableUuid)? parkOrder,
    TResult Function(String tableUuid)? selectTable,
    TResult Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult Function(String productUuid, String? note)? updateNote,
    TResult Function(String itemUuid)? toggleItemHold,
    TResult Function(String itemUuid)? fireItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(UpdateQuantity value) updateQuantity,
    required TResult Function(RemoveFromCart value) removeFromCart,
    required TResult Function(ClearCart value) clearCart,
    required TResult Function(ScanItem value) scanItem,
    required TResult Function(SelectCustomer value) selectCustomer,
    required TResult Function(ApplyDiscount value) applyDiscount,
    required TResult Function(AddPromoCode value) addPromoCode,
    required TResult Function(CheckoutProcessed value) checkoutProcessed,
    required TResult Function(ParkOrder value) parkOrder,
    required TResult Function(SelectTable value) selectTable,
    required TResult Function(RetrieveOrder value) retrieveOrder,
    required TResult Function(CheckoutSplit value) checkoutSplit,
    required TResult Function(UpdateNote value) updateNote,
    required TResult Function(ToggleItemHold value) toggleItemHold,
    required TResult Function(FireItem value) fireItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddProduct value)? addProduct,
    TResult? Function(UpdateQuantity value)? updateQuantity,
    TResult? Function(RemoveFromCart value)? removeFromCart,
    TResult? Function(ClearCart value)? clearCart,
    TResult? Function(ScanItem value)? scanItem,
    TResult? Function(SelectCustomer value)? selectCustomer,
    TResult? Function(ApplyDiscount value)? applyDiscount,
    TResult? Function(AddPromoCode value)? addPromoCode,
    TResult? Function(CheckoutProcessed value)? checkoutProcessed,
    TResult? Function(ParkOrder value)? parkOrder,
    TResult? Function(SelectTable value)? selectTable,
    TResult? Function(RetrieveOrder value)? retrieveOrder,
    TResult? Function(CheckoutSplit value)? checkoutSplit,
    TResult? Function(UpdateNote value)? updateNote,
    TResult? Function(ToggleItemHold value)? toggleItemHold,
    TResult? Function(FireItem value)? fireItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddProduct value)? addProduct,
    TResult Function(UpdateQuantity value)? updateQuantity,
    TResult Function(RemoveFromCart value)? removeFromCart,
    TResult Function(ClearCart value)? clearCart,
    TResult Function(ScanItem value)? scanItem,
    TResult Function(SelectCustomer value)? selectCustomer,
    TResult Function(ApplyDiscount value)? applyDiscount,
    TResult Function(AddPromoCode value)? addPromoCode,
    TResult Function(CheckoutProcessed value)? checkoutProcessed,
    TResult Function(ParkOrder value)? parkOrder,
    TResult Function(SelectTable value)? selectTable,
    TResult Function(RetrieveOrder value)? retrieveOrder,
    TResult Function(CheckoutSplit value)? checkoutSplit,
    TResult Function(UpdateNote value)? updateNote,
    TResult Function(ToggleItemHold value)? toggleItemHold,
    TResult Function(FireItem value)? fireItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartEventCopyWith<$Res> {
  factory $CartEventCopyWith(CartEvent value, $Res Function(CartEvent) then) =
      _$CartEventCopyWithImpl<$Res, CartEvent>;
}

/// @nodoc
class _$CartEventCopyWithImpl<$Res, $Val extends CartEvent>
    implements $CartEventCopyWith<$Res> {
  _$CartEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AddProductImplCopyWith<$Res> {
  factory _$$AddProductImplCopyWith(
          _$AddProductImpl value, $Res Function(_$AddProductImpl) then) =
      __$$AddProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product, List<ModifierItem> modifiers});
}

/// @nodoc
class __$$AddProductImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$AddProductImpl>
    implements _$$AddProductImplCopyWith<$Res> {
  __$$AddProductImplCopyWithImpl(
      _$AddProductImpl _value, $Res Function(_$AddProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? modifiers = null,
  }) {
    return _then(_$AddProductImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      modifiers: null == modifiers
          ? _value._modifiers
          : modifiers // ignore: cast_nullable_to_non_nullable
              as List<ModifierItem>,
    ));
  }
}

/// @nodoc

class _$AddProductImpl implements AddProduct {
  const _$AddProductImpl(this.product,
      {final List<ModifierItem> modifiers = const []})
      : _modifiers = modifiers;

  @override
  final Product product;
  final List<ModifierItem> _modifiers;
  @override
  @JsonKey()
  List<ModifierItem> get modifiers {
    if (_modifiers is EqualUnmodifiableListView) return _modifiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modifiers);
  }

  @override
  String toString() {
    return 'CartEvent.addProduct(product: $product, modifiers: $modifiers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddProductImpl &&
            (identical(other.product, product) || other.product == product) &&
            const DeepCollectionEquality()
                .equals(other._modifiers, _modifiers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, product, const DeepCollectionEquality().hash(_modifiers));

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddProductImplCopyWith<_$AddProductImpl> get copyWith =>
      __$$AddProductImplCopyWithImpl<_$AddProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Product product, List<ModifierItem> modifiers)
        addProduct,
    required TResult Function(String itemUuid, int quantity) updateQuantity,
    required TResult Function(String itemUuid) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(String barcode) scanItem,
    required TResult Function(Customer? customer) selectCustomer,
    required TResult Function(double? percent, double? fixed) applyDiscount,
    required TResult Function(String code) addPromoCode,
    required TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)
        checkoutProcessed,
    required TResult Function(String tableUuid) parkOrder,
    required TResult Function(String tableUuid) selectTable,
    required TResult Function(String orderUuid, String tableUuid) retrieveOrder,
    required TResult Function(List<String> itemUuids, String paymentMethod)
        checkoutSplit,
    required TResult Function(String productUuid, String? note) updateNote,
    required TResult Function(String itemUuid) toggleItemHold,
    required TResult Function(String itemUuid) fireItem,
  }) {
    return addProduct(product, modifiers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Product product, List<ModifierItem> modifiers)?
        addProduct,
    TResult? Function(String itemUuid, int quantity)? updateQuantity,
    TResult? Function(String itemUuid)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(String barcode)? scanItem,
    TResult? Function(Customer? customer)? selectCustomer,
    TResult? Function(double? percent, double? fixed)? applyDiscount,
    TResult? Function(String code)? addPromoCode,
    TResult? Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult? Function(String tableUuid)? parkOrder,
    TResult? Function(String tableUuid)? selectTable,
    TResult? Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult? Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult? Function(String productUuid, String? note)? updateNote,
    TResult? Function(String itemUuid)? toggleItemHold,
    TResult? Function(String itemUuid)? fireItem,
  }) {
    return addProduct?.call(product, modifiers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Product product, List<ModifierItem> modifiers)? addProduct,
    TResult Function(String itemUuid, int quantity)? updateQuantity,
    TResult Function(String itemUuid)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(String barcode)? scanItem,
    TResult Function(Customer? customer)? selectCustomer,
    TResult Function(double? percent, double? fixed)? applyDiscount,
    TResult Function(String code)? addPromoCode,
    TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult Function(String tableUuid)? parkOrder,
    TResult Function(String tableUuid)? selectTable,
    TResult Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult Function(String productUuid, String? note)? updateNote,
    TResult Function(String itemUuid)? toggleItemHold,
    TResult Function(String itemUuid)? fireItem,
    required TResult orElse(),
  }) {
    if (addProduct != null) {
      return addProduct(product, modifiers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(UpdateQuantity value) updateQuantity,
    required TResult Function(RemoveFromCart value) removeFromCart,
    required TResult Function(ClearCart value) clearCart,
    required TResult Function(ScanItem value) scanItem,
    required TResult Function(SelectCustomer value) selectCustomer,
    required TResult Function(ApplyDiscount value) applyDiscount,
    required TResult Function(AddPromoCode value) addPromoCode,
    required TResult Function(CheckoutProcessed value) checkoutProcessed,
    required TResult Function(ParkOrder value) parkOrder,
    required TResult Function(SelectTable value) selectTable,
    required TResult Function(RetrieveOrder value) retrieveOrder,
    required TResult Function(CheckoutSplit value) checkoutSplit,
    required TResult Function(UpdateNote value) updateNote,
    required TResult Function(ToggleItemHold value) toggleItemHold,
    required TResult Function(FireItem value) fireItem,
  }) {
    return addProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddProduct value)? addProduct,
    TResult? Function(UpdateQuantity value)? updateQuantity,
    TResult? Function(RemoveFromCart value)? removeFromCart,
    TResult? Function(ClearCart value)? clearCart,
    TResult? Function(ScanItem value)? scanItem,
    TResult? Function(SelectCustomer value)? selectCustomer,
    TResult? Function(ApplyDiscount value)? applyDiscount,
    TResult? Function(AddPromoCode value)? addPromoCode,
    TResult? Function(CheckoutProcessed value)? checkoutProcessed,
    TResult? Function(ParkOrder value)? parkOrder,
    TResult? Function(SelectTable value)? selectTable,
    TResult? Function(RetrieveOrder value)? retrieveOrder,
    TResult? Function(CheckoutSplit value)? checkoutSplit,
    TResult? Function(UpdateNote value)? updateNote,
    TResult? Function(ToggleItemHold value)? toggleItemHold,
    TResult? Function(FireItem value)? fireItem,
  }) {
    return addProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddProduct value)? addProduct,
    TResult Function(UpdateQuantity value)? updateQuantity,
    TResult Function(RemoveFromCart value)? removeFromCart,
    TResult Function(ClearCart value)? clearCart,
    TResult Function(ScanItem value)? scanItem,
    TResult Function(SelectCustomer value)? selectCustomer,
    TResult Function(ApplyDiscount value)? applyDiscount,
    TResult Function(AddPromoCode value)? addPromoCode,
    TResult Function(CheckoutProcessed value)? checkoutProcessed,
    TResult Function(ParkOrder value)? parkOrder,
    TResult Function(SelectTable value)? selectTable,
    TResult Function(RetrieveOrder value)? retrieveOrder,
    TResult Function(CheckoutSplit value)? checkoutSplit,
    TResult Function(UpdateNote value)? updateNote,
    TResult Function(ToggleItemHold value)? toggleItemHold,
    TResult Function(FireItem value)? fireItem,
    required TResult orElse(),
  }) {
    if (addProduct != null) {
      return addProduct(this);
    }
    return orElse();
  }
}

abstract class AddProduct implements CartEvent {
  const factory AddProduct(final Product product,
      {final List<ModifierItem> modifiers}) = _$AddProductImpl;

  Product get product;
  List<ModifierItem> get modifiers;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddProductImplCopyWith<_$AddProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateQuantityImplCopyWith<$Res> {
  factory _$$UpdateQuantityImplCopyWith(_$UpdateQuantityImpl value,
          $Res Function(_$UpdateQuantityImpl) then) =
      __$$UpdateQuantityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String itemUuid, int quantity});
}

/// @nodoc
class __$$UpdateQuantityImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$UpdateQuantityImpl>
    implements _$$UpdateQuantityImplCopyWith<$Res> {
  __$$UpdateQuantityImplCopyWithImpl(
      _$UpdateQuantityImpl _value, $Res Function(_$UpdateQuantityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemUuid = null,
    Object? quantity = null,
  }) {
    return _then(_$UpdateQuantityImpl(
      null == itemUuid
          ? _value.itemUuid
          : itemUuid // ignore: cast_nullable_to_non_nullable
              as String,
      null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UpdateQuantityImpl implements UpdateQuantity {
  const _$UpdateQuantityImpl(this.itemUuid, this.quantity);

  @override
  final String itemUuid;
  @override
  final int quantity;

  @override
  String toString() {
    return 'CartEvent.updateQuantity(itemUuid: $itemUuid, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateQuantityImpl &&
            (identical(other.itemUuid, itemUuid) ||
                other.itemUuid == itemUuid) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemUuid, quantity);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateQuantityImplCopyWith<_$UpdateQuantityImpl> get copyWith =>
      __$$UpdateQuantityImplCopyWithImpl<_$UpdateQuantityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Product product, List<ModifierItem> modifiers)
        addProduct,
    required TResult Function(String itemUuid, int quantity) updateQuantity,
    required TResult Function(String itemUuid) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(String barcode) scanItem,
    required TResult Function(Customer? customer) selectCustomer,
    required TResult Function(double? percent, double? fixed) applyDiscount,
    required TResult Function(String code) addPromoCode,
    required TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)
        checkoutProcessed,
    required TResult Function(String tableUuid) parkOrder,
    required TResult Function(String tableUuid) selectTable,
    required TResult Function(String orderUuid, String tableUuid) retrieveOrder,
    required TResult Function(List<String> itemUuids, String paymentMethod)
        checkoutSplit,
    required TResult Function(String productUuid, String? note) updateNote,
    required TResult Function(String itemUuid) toggleItemHold,
    required TResult Function(String itemUuid) fireItem,
  }) {
    return updateQuantity(itemUuid, quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Product product, List<ModifierItem> modifiers)?
        addProduct,
    TResult? Function(String itemUuid, int quantity)? updateQuantity,
    TResult? Function(String itemUuid)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(String barcode)? scanItem,
    TResult? Function(Customer? customer)? selectCustomer,
    TResult? Function(double? percent, double? fixed)? applyDiscount,
    TResult? Function(String code)? addPromoCode,
    TResult? Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult? Function(String tableUuid)? parkOrder,
    TResult? Function(String tableUuid)? selectTable,
    TResult? Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult? Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult? Function(String productUuid, String? note)? updateNote,
    TResult? Function(String itemUuid)? toggleItemHold,
    TResult? Function(String itemUuid)? fireItem,
  }) {
    return updateQuantity?.call(itemUuid, quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Product product, List<ModifierItem> modifiers)? addProduct,
    TResult Function(String itemUuid, int quantity)? updateQuantity,
    TResult Function(String itemUuid)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(String barcode)? scanItem,
    TResult Function(Customer? customer)? selectCustomer,
    TResult Function(double? percent, double? fixed)? applyDiscount,
    TResult Function(String code)? addPromoCode,
    TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult Function(String tableUuid)? parkOrder,
    TResult Function(String tableUuid)? selectTable,
    TResult Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult Function(String productUuid, String? note)? updateNote,
    TResult Function(String itemUuid)? toggleItemHold,
    TResult Function(String itemUuid)? fireItem,
    required TResult orElse(),
  }) {
    if (updateQuantity != null) {
      return updateQuantity(itemUuid, quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(UpdateQuantity value) updateQuantity,
    required TResult Function(RemoveFromCart value) removeFromCart,
    required TResult Function(ClearCart value) clearCart,
    required TResult Function(ScanItem value) scanItem,
    required TResult Function(SelectCustomer value) selectCustomer,
    required TResult Function(ApplyDiscount value) applyDiscount,
    required TResult Function(AddPromoCode value) addPromoCode,
    required TResult Function(CheckoutProcessed value) checkoutProcessed,
    required TResult Function(ParkOrder value) parkOrder,
    required TResult Function(SelectTable value) selectTable,
    required TResult Function(RetrieveOrder value) retrieveOrder,
    required TResult Function(CheckoutSplit value) checkoutSplit,
    required TResult Function(UpdateNote value) updateNote,
    required TResult Function(ToggleItemHold value) toggleItemHold,
    required TResult Function(FireItem value) fireItem,
  }) {
    return updateQuantity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddProduct value)? addProduct,
    TResult? Function(UpdateQuantity value)? updateQuantity,
    TResult? Function(RemoveFromCart value)? removeFromCart,
    TResult? Function(ClearCart value)? clearCart,
    TResult? Function(ScanItem value)? scanItem,
    TResult? Function(SelectCustomer value)? selectCustomer,
    TResult? Function(ApplyDiscount value)? applyDiscount,
    TResult? Function(AddPromoCode value)? addPromoCode,
    TResult? Function(CheckoutProcessed value)? checkoutProcessed,
    TResult? Function(ParkOrder value)? parkOrder,
    TResult? Function(SelectTable value)? selectTable,
    TResult? Function(RetrieveOrder value)? retrieveOrder,
    TResult? Function(CheckoutSplit value)? checkoutSplit,
    TResult? Function(UpdateNote value)? updateNote,
    TResult? Function(ToggleItemHold value)? toggleItemHold,
    TResult? Function(FireItem value)? fireItem,
  }) {
    return updateQuantity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddProduct value)? addProduct,
    TResult Function(UpdateQuantity value)? updateQuantity,
    TResult Function(RemoveFromCart value)? removeFromCart,
    TResult Function(ClearCart value)? clearCart,
    TResult Function(ScanItem value)? scanItem,
    TResult Function(SelectCustomer value)? selectCustomer,
    TResult Function(ApplyDiscount value)? applyDiscount,
    TResult Function(AddPromoCode value)? addPromoCode,
    TResult Function(CheckoutProcessed value)? checkoutProcessed,
    TResult Function(ParkOrder value)? parkOrder,
    TResult Function(SelectTable value)? selectTable,
    TResult Function(RetrieveOrder value)? retrieveOrder,
    TResult Function(CheckoutSplit value)? checkoutSplit,
    TResult Function(UpdateNote value)? updateNote,
    TResult Function(ToggleItemHold value)? toggleItemHold,
    TResult Function(FireItem value)? fireItem,
    required TResult orElse(),
  }) {
    if (updateQuantity != null) {
      return updateQuantity(this);
    }
    return orElse();
  }
}

abstract class UpdateQuantity implements CartEvent {
  const factory UpdateQuantity(final String itemUuid, final int quantity) =
      _$UpdateQuantityImpl;

  String get itemUuid;
  int get quantity;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateQuantityImplCopyWith<_$UpdateQuantityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveFromCartImplCopyWith<$Res> {
  factory _$$RemoveFromCartImplCopyWith(_$RemoveFromCartImpl value,
          $Res Function(_$RemoveFromCartImpl) then) =
      __$$RemoveFromCartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String itemUuid});
}

/// @nodoc
class __$$RemoveFromCartImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$RemoveFromCartImpl>
    implements _$$RemoveFromCartImplCopyWith<$Res> {
  __$$RemoveFromCartImplCopyWithImpl(
      _$RemoveFromCartImpl _value, $Res Function(_$RemoveFromCartImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemUuid = null,
  }) {
    return _then(_$RemoveFromCartImpl(
      null == itemUuid
          ? _value.itemUuid
          : itemUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoveFromCartImpl implements RemoveFromCart {
  const _$RemoveFromCartImpl(this.itemUuid);

  @override
  final String itemUuid;

  @override
  String toString() {
    return 'CartEvent.removeFromCart(itemUuid: $itemUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFromCartImpl &&
            (identical(other.itemUuid, itemUuid) ||
                other.itemUuid == itemUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemUuid);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveFromCartImplCopyWith<_$RemoveFromCartImpl> get copyWith =>
      __$$RemoveFromCartImplCopyWithImpl<_$RemoveFromCartImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Product product, List<ModifierItem> modifiers)
        addProduct,
    required TResult Function(String itemUuid, int quantity) updateQuantity,
    required TResult Function(String itemUuid) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(String barcode) scanItem,
    required TResult Function(Customer? customer) selectCustomer,
    required TResult Function(double? percent, double? fixed) applyDiscount,
    required TResult Function(String code) addPromoCode,
    required TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)
        checkoutProcessed,
    required TResult Function(String tableUuid) parkOrder,
    required TResult Function(String tableUuid) selectTable,
    required TResult Function(String orderUuid, String tableUuid) retrieveOrder,
    required TResult Function(List<String> itemUuids, String paymentMethod)
        checkoutSplit,
    required TResult Function(String productUuid, String? note) updateNote,
    required TResult Function(String itemUuid) toggleItemHold,
    required TResult Function(String itemUuid) fireItem,
  }) {
    return removeFromCart(itemUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Product product, List<ModifierItem> modifiers)?
        addProduct,
    TResult? Function(String itemUuid, int quantity)? updateQuantity,
    TResult? Function(String itemUuid)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(String barcode)? scanItem,
    TResult? Function(Customer? customer)? selectCustomer,
    TResult? Function(double? percent, double? fixed)? applyDiscount,
    TResult? Function(String code)? addPromoCode,
    TResult? Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult? Function(String tableUuid)? parkOrder,
    TResult? Function(String tableUuid)? selectTable,
    TResult? Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult? Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult? Function(String productUuid, String? note)? updateNote,
    TResult? Function(String itemUuid)? toggleItemHold,
    TResult? Function(String itemUuid)? fireItem,
  }) {
    return removeFromCart?.call(itemUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Product product, List<ModifierItem> modifiers)? addProduct,
    TResult Function(String itemUuid, int quantity)? updateQuantity,
    TResult Function(String itemUuid)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(String barcode)? scanItem,
    TResult Function(Customer? customer)? selectCustomer,
    TResult Function(double? percent, double? fixed)? applyDiscount,
    TResult Function(String code)? addPromoCode,
    TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult Function(String tableUuid)? parkOrder,
    TResult Function(String tableUuid)? selectTable,
    TResult Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult Function(String productUuid, String? note)? updateNote,
    TResult Function(String itemUuid)? toggleItemHold,
    TResult Function(String itemUuid)? fireItem,
    required TResult orElse(),
  }) {
    if (removeFromCart != null) {
      return removeFromCart(itemUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(UpdateQuantity value) updateQuantity,
    required TResult Function(RemoveFromCart value) removeFromCart,
    required TResult Function(ClearCart value) clearCart,
    required TResult Function(ScanItem value) scanItem,
    required TResult Function(SelectCustomer value) selectCustomer,
    required TResult Function(ApplyDiscount value) applyDiscount,
    required TResult Function(AddPromoCode value) addPromoCode,
    required TResult Function(CheckoutProcessed value) checkoutProcessed,
    required TResult Function(ParkOrder value) parkOrder,
    required TResult Function(SelectTable value) selectTable,
    required TResult Function(RetrieveOrder value) retrieveOrder,
    required TResult Function(CheckoutSplit value) checkoutSplit,
    required TResult Function(UpdateNote value) updateNote,
    required TResult Function(ToggleItemHold value) toggleItemHold,
    required TResult Function(FireItem value) fireItem,
  }) {
    return removeFromCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddProduct value)? addProduct,
    TResult? Function(UpdateQuantity value)? updateQuantity,
    TResult? Function(RemoveFromCart value)? removeFromCart,
    TResult? Function(ClearCart value)? clearCart,
    TResult? Function(ScanItem value)? scanItem,
    TResult? Function(SelectCustomer value)? selectCustomer,
    TResult? Function(ApplyDiscount value)? applyDiscount,
    TResult? Function(AddPromoCode value)? addPromoCode,
    TResult? Function(CheckoutProcessed value)? checkoutProcessed,
    TResult? Function(ParkOrder value)? parkOrder,
    TResult? Function(SelectTable value)? selectTable,
    TResult? Function(RetrieveOrder value)? retrieveOrder,
    TResult? Function(CheckoutSplit value)? checkoutSplit,
    TResult? Function(UpdateNote value)? updateNote,
    TResult? Function(ToggleItemHold value)? toggleItemHold,
    TResult? Function(FireItem value)? fireItem,
  }) {
    return removeFromCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddProduct value)? addProduct,
    TResult Function(UpdateQuantity value)? updateQuantity,
    TResult Function(RemoveFromCart value)? removeFromCart,
    TResult Function(ClearCart value)? clearCart,
    TResult Function(ScanItem value)? scanItem,
    TResult Function(SelectCustomer value)? selectCustomer,
    TResult Function(ApplyDiscount value)? applyDiscount,
    TResult Function(AddPromoCode value)? addPromoCode,
    TResult Function(CheckoutProcessed value)? checkoutProcessed,
    TResult Function(ParkOrder value)? parkOrder,
    TResult Function(SelectTable value)? selectTable,
    TResult Function(RetrieveOrder value)? retrieveOrder,
    TResult Function(CheckoutSplit value)? checkoutSplit,
    TResult Function(UpdateNote value)? updateNote,
    TResult Function(ToggleItemHold value)? toggleItemHold,
    TResult Function(FireItem value)? fireItem,
    required TResult orElse(),
  }) {
    if (removeFromCart != null) {
      return removeFromCart(this);
    }
    return orElse();
  }
}

abstract class RemoveFromCart implements CartEvent {
  const factory RemoveFromCart(final String itemUuid) = _$RemoveFromCartImpl;

  String get itemUuid;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveFromCartImplCopyWith<_$RemoveFromCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearCartImplCopyWith<$Res> {
  factory _$$ClearCartImplCopyWith(
          _$ClearCartImpl value, $Res Function(_$ClearCartImpl) then) =
      __$$ClearCartImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearCartImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$ClearCartImpl>
    implements _$$ClearCartImplCopyWith<$Res> {
  __$$ClearCartImplCopyWithImpl(
      _$ClearCartImpl _value, $Res Function(_$ClearCartImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearCartImpl implements ClearCart {
  const _$ClearCartImpl();

  @override
  String toString() {
    return 'CartEvent.clearCart()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearCartImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Product product, List<ModifierItem> modifiers)
        addProduct,
    required TResult Function(String itemUuid, int quantity) updateQuantity,
    required TResult Function(String itemUuid) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(String barcode) scanItem,
    required TResult Function(Customer? customer) selectCustomer,
    required TResult Function(double? percent, double? fixed) applyDiscount,
    required TResult Function(String code) addPromoCode,
    required TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)
        checkoutProcessed,
    required TResult Function(String tableUuid) parkOrder,
    required TResult Function(String tableUuid) selectTable,
    required TResult Function(String orderUuid, String tableUuid) retrieveOrder,
    required TResult Function(List<String> itemUuids, String paymentMethod)
        checkoutSplit,
    required TResult Function(String productUuid, String? note) updateNote,
    required TResult Function(String itemUuid) toggleItemHold,
    required TResult Function(String itemUuid) fireItem,
  }) {
    return clearCart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Product product, List<ModifierItem> modifiers)?
        addProduct,
    TResult? Function(String itemUuid, int quantity)? updateQuantity,
    TResult? Function(String itemUuid)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(String barcode)? scanItem,
    TResult? Function(Customer? customer)? selectCustomer,
    TResult? Function(double? percent, double? fixed)? applyDiscount,
    TResult? Function(String code)? addPromoCode,
    TResult? Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult? Function(String tableUuid)? parkOrder,
    TResult? Function(String tableUuid)? selectTable,
    TResult? Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult? Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult? Function(String productUuid, String? note)? updateNote,
    TResult? Function(String itemUuid)? toggleItemHold,
    TResult? Function(String itemUuid)? fireItem,
  }) {
    return clearCart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Product product, List<ModifierItem> modifiers)? addProduct,
    TResult Function(String itemUuid, int quantity)? updateQuantity,
    TResult Function(String itemUuid)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(String barcode)? scanItem,
    TResult Function(Customer? customer)? selectCustomer,
    TResult Function(double? percent, double? fixed)? applyDiscount,
    TResult Function(String code)? addPromoCode,
    TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult Function(String tableUuid)? parkOrder,
    TResult Function(String tableUuid)? selectTable,
    TResult Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult Function(String productUuid, String? note)? updateNote,
    TResult Function(String itemUuid)? toggleItemHold,
    TResult Function(String itemUuid)? fireItem,
    required TResult orElse(),
  }) {
    if (clearCart != null) {
      return clearCart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(UpdateQuantity value) updateQuantity,
    required TResult Function(RemoveFromCart value) removeFromCart,
    required TResult Function(ClearCart value) clearCart,
    required TResult Function(ScanItem value) scanItem,
    required TResult Function(SelectCustomer value) selectCustomer,
    required TResult Function(ApplyDiscount value) applyDiscount,
    required TResult Function(AddPromoCode value) addPromoCode,
    required TResult Function(CheckoutProcessed value) checkoutProcessed,
    required TResult Function(ParkOrder value) parkOrder,
    required TResult Function(SelectTable value) selectTable,
    required TResult Function(RetrieveOrder value) retrieveOrder,
    required TResult Function(CheckoutSplit value) checkoutSplit,
    required TResult Function(UpdateNote value) updateNote,
    required TResult Function(ToggleItemHold value) toggleItemHold,
    required TResult Function(FireItem value) fireItem,
  }) {
    return clearCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddProduct value)? addProduct,
    TResult? Function(UpdateQuantity value)? updateQuantity,
    TResult? Function(RemoveFromCart value)? removeFromCart,
    TResult? Function(ClearCart value)? clearCart,
    TResult? Function(ScanItem value)? scanItem,
    TResult? Function(SelectCustomer value)? selectCustomer,
    TResult? Function(ApplyDiscount value)? applyDiscount,
    TResult? Function(AddPromoCode value)? addPromoCode,
    TResult? Function(CheckoutProcessed value)? checkoutProcessed,
    TResult? Function(ParkOrder value)? parkOrder,
    TResult? Function(SelectTable value)? selectTable,
    TResult? Function(RetrieveOrder value)? retrieveOrder,
    TResult? Function(CheckoutSplit value)? checkoutSplit,
    TResult? Function(UpdateNote value)? updateNote,
    TResult? Function(ToggleItemHold value)? toggleItemHold,
    TResult? Function(FireItem value)? fireItem,
  }) {
    return clearCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddProduct value)? addProduct,
    TResult Function(UpdateQuantity value)? updateQuantity,
    TResult Function(RemoveFromCart value)? removeFromCart,
    TResult Function(ClearCart value)? clearCart,
    TResult Function(ScanItem value)? scanItem,
    TResult Function(SelectCustomer value)? selectCustomer,
    TResult Function(ApplyDiscount value)? applyDiscount,
    TResult Function(AddPromoCode value)? addPromoCode,
    TResult Function(CheckoutProcessed value)? checkoutProcessed,
    TResult Function(ParkOrder value)? parkOrder,
    TResult Function(SelectTable value)? selectTable,
    TResult Function(RetrieveOrder value)? retrieveOrder,
    TResult Function(CheckoutSplit value)? checkoutSplit,
    TResult Function(UpdateNote value)? updateNote,
    TResult Function(ToggleItemHold value)? toggleItemHold,
    TResult Function(FireItem value)? fireItem,
    required TResult orElse(),
  }) {
    if (clearCart != null) {
      return clearCart(this);
    }
    return orElse();
  }
}

abstract class ClearCart implements CartEvent {
  const factory ClearCart() = _$ClearCartImpl;
}

/// @nodoc
abstract class _$$ScanItemImplCopyWith<$Res> {
  factory _$$ScanItemImplCopyWith(
          _$ScanItemImpl value, $Res Function(_$ScanItemImpl) then) =
      __$$ScanItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String barcode});
}

/// @nodoc
class __$$ScanItemImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$ScanItemImpl>
    implements _$$ScanItemImplCopyWith<$Res> {
  __$$ScanItemImplCopyWithImpl(
      _$ScanItemImpl _value, $Res Function(_$ScanItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = null,
  }) {
    return _then(_$ScanItemImpl(
      null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ScanItemImpl implements ScanItem {
  const _$ScanItemImpl(this.barcode);

  @override
  final String barcode;

  @override
  String toString() {
    return 'CartEvent.scanItem(barcode: $barcode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanItemImpl &&
            (identical(other.barcode, barcode) || other.barcode == barcode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, barcode);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanItemImplCopyWith<_$ScanItemImpl> get copyWith =>
      __$$ScanItemImplCopyWithImpl<_$ScanItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Product product, List<ModifierItem> modifiers)
        addProduct,
    required TResult Function(String itemUuid, int quantity) updateQuantity,
    required TResult Function(String itemUuid) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(String barcode) scanItem,
    required TResult Function(Customer? customer) selectCustomer,
    required TResult Function(double? percent, double? fixed) applyDiscount,
    required TResult Function(String code) addPromoCode,
    required TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)
        checkoutProcessed,
    required TResult Function(String tableUuid) parkOrder,
    required TResult Function(String tableUuid) selectTable,
    required TResult Function(String orderUuid, String tableUuid) retrieveOrder,
    required TResult Function(List<String> itemUuids, String paymentMethod)
        checkoutSplit,
    required TResult Function(String productUuid, String? note) updateNote,
    required TResult Function(String itemUuid) toggleItemHold,
    required TResult Function(String itemUuid) fireItem,
  }) {
    return scanItem(barcode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Product product, List<ModifierItem> modifiers)?
        addProduct,
    TResult? Function(String itemUuid, int quantity)? updateQuantity,
    TResult? Function(String itemUuid)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(String barcode)? scanItem,
    TResult? Function(Customer? customer)? selectCustomer,
    TResult? Function(double? percent, double? fixed)? applyDiscount,
    TResult? Function(String code)? addPromoCode,
    TResult? Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult? Function(String tableUuid)? parkOrder,
    TResult? Function(String tableUuid)? selectTable,
    TResult? Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult? Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult? Function(String productUuid, String? note)? updateNote,
    TResult? Function(String itemUuid)? toggleItemHold,
    TResult? Function(String itemUuid)? fireItem,
  }) {
    return scanItem?.call(barcode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Product product, List<ModifierItem> modifiers)? addProduct,
    TResult Function(String itemUuid, int quantity)? updateQuantity,
    TResult Function(String itemUuid)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(String barcode)? scanItem,
    TResult Function(Customer? customer)? selectCustomer,
    TResult Function(double? percent, double? fixed)? applyDiscount,
    TResult Function(String code)? addPromoCode,
    TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult Function(String tableUuid)? parkOrder,
    TResult Function(String tableUuid)? selectTable,
    TResult Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult Function(String productUuid, String? note)? updateNote,
    TResult Function(String itemUuid)? toggleItemHold,
    TResult Function(String itemUuid)? fireItem,
    required TResult orElse(),
  }) {
    if (scanItem != null) {
      return scanItem(barcode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(UpdateQuantity value) updateQuantity,
    required TResult Function(RemoveFromCart value) removeFromCart,
    required TResult Function(ClearCart value) clearCart,
    required TResult Function(ScanItem value) scanItem,
    required TResult Function(SelectCustomer value) selectCustomer,
    required TResult Function(ApplyDiscount value) applyDiscount,
    required TResult Function(AddPromoCode value) addPromoCode,
    required TResult Function(CheckoutProcessed value) checkoutProcessed,
    required TResult Function(ParkOrder value) parkOrder,
    required TResult Function(SelectTable value) selectTable,
    required TResult Function(RetrieveOrder value) retrieveOrder,
    required TResult Function(CheckoutSplit value) checkoutSplit,
    required TResult Function(UpdateNote value) updateNote,
    required TResult Function(ToggleItemHold value) toggleItemHold,
    required TResult Function(FireItem value) fireItem,
  }) {
    return scanItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddProduct value)? addProduct,
    TResult? Function(UpdateQuantity value)? updateQuantity,
    TResult? Function(RemoveFromCart value)? removeFromCart,
    TResult? Function(ClearCart value)? clearCart,
    TResult? Function(ScanItem value)? scanItem,
    TResult? Function(SelectCustomer value)? selectCustomer,
    TResult? Function(ApplyDiscount value)? applyDiscount,
    TResult? Function(AddPromoCode value)? addPromoCode,
    TResult? Function(CheckoutProcessed value)? checkoutProcessed,
    TResult? Function(ParkOrder value)? parkOrder,
    TResult? Function(SelectTable value)? selectTable,
    TResult? Function(RetrieveOrder value)? retrieveOrder,
    TResult? Function(CheckoutSplit value)? checkoutSplit,
    TResult? Function(UpdateNote value)? updateNote,
    TResult? Function(ToggleItemHold value)? toggleItemHold,
    TResult? Function(FireItem value)? fireItem,
  }) {
    return scanItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddProduct value)? addProduct,
    TResult Function(UpdateQuantity value)? updateQuantity,
    TResult Function(RemoveFromCart value)? removeFromCart,
    TResult Function(ClearCart value)? clearCart,
    TResult Function(ScanItem value)? scanItem,
    TResult Function(SelectCustomer value)? selectCustomer,
    TResult Function(ApplyDiscount value)? applyDiscount,
    TResult Function(AddPromoCode value)? addPromoCode,
    TResult Function(CheckoutProcessed value)? checkoutProcessed,
    TResult Function(ParkOrder value)? parkOrder,
    TResult Function(SelectTable value)? selectTable,
    TResult Function(RetrieveOrder value)? retrieveOrder,
    TResult Function(CheckoutSplit value)? checkoutSplit,
    TResult Function(UpdateNote value)? updateNote,
    TResult Function(ToggleItemHold value)? toggleItemHold,
    TResult Function(FireItem value)? fireItem,
    required TResult orElse(),
  }) {
    if (scanItem != null) {
      return scanItem(this);
    }
    return orElse();
  }
}

abstract class ScanItem implements CartEvent {
  const factory ScanItem(final String barcode) = _$ScanItemImpl;

  String get barcode;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScanItemImplCopyWith<_$ScanItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectCustomerImplCopyWith<$Res> {
  factory _$$SelectCustomerImplCopyWith(_$SelectCustomerImpl value,
          $Res Function(_$SelectCustomerImpl) then) =
      __$$SelectCustomerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Customer? customer});

  $CustomerCopyWith<$Res>? get customer;
}

/// @nodoc
class __$$SelectCustomerImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$SelectCustomerImpl>
    implements _$$SelectCustomerImplCopyWith<$Res> {
  __$$SelectCustomerImplCopyWithImpl(
      _$SelectCustomerImpl _value, $Res Function(_$SelectCustomerImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = freezed,
  }) {
    return _then(_$SelectCustomerImpl(
      freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
    ));
  }

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $CustomerCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value));
    });
  }
}

/// @nodoc

class _$SelectCustomerImpl implements SelectCustomer {
  const _$SelectCustomerImpl(this.customer);

  @override
  final Customer? customer;

  @override
  String toString() {
    return 'CartEvent.selectCustomer(customer: $customer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectCustomerImpl &&
            (identical(other.customer, customer) ||
                other.customer == customer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customer);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectCustomerImplCopyWith<_$SelectCustomerImpl> get copyWith =>
      __$$SelectCustomerImplCopyWithImpl<_$SelectCustomerImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Product product, List<ModifierItem> modifiers)
        addProduct,
    required TResult Function(String itemUuid, int quantity) updateQuantity,
    required TResult Function(String itemUuid) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(String barcode) scanItem,
    required TResult Function(Customer? customer) selectCustomer,
    required TResult Function(double? percent, double? fixed) applyDiscount,
    required TResult Function(String code) addPromoCode,
    required TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)
        checkoutProcessed,
    required TResult Function(String tableUuid) parkOrder,
    required TResult Function(String tableUuid) selectTable,
    required TResult Function(String orderUuid, String tableUuid) retrieveOrder,
    required TResult Function(List<String> itemUuids, String paymentMethod)
        checkoutSplit,
    required TResult Function(String productUuid, String? note) updateNote,
    required TResult Function(String itemUuid) toggleItemHold,
    required TResult Function(String itemUuid) fireItem,
  }) {
    return selectCustomer(customer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Product product, List<ModifierItem> modifiers)?
        addProduct,
    TResult? Function(String itemUuid, int quantity)? updateQuantity,
    TResult? Function(String itemUuid)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(String barcode)? scanItem,
    TResult? Function(Customer? customer)? selectCustomer,
    TResult? Function(double? percent, double? fixed)? applyDiscount,
    TResult? Function(String code)? addPromoCode,
    TResult? Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult? Function(String tableUuid)? parkOrder,
    TResult? Function(String tableUuid)? selectTable,
    TResult? Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult? Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult? Function(String productUuid, String? note)? updateNote,
    TResult? Function(String itemUuid)? toggleItemHold,
    TResult? Function(String itemUuid)? fireItem,
  }) {
    return selectCustomer?.call(customer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Product product, List<ModifierItem> modifiers)? addProduct,
    TResult Function(String itemUuid, int quantity)? updateQuantity,
    TResult Function(String itemUuid)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(String barcode)? scanItem,
    TResult Function(Customer? customer)? selectCustomer,
    TResult Function(double? percent, double? fixed)? applyDiscount,
    TResult Function(String code)? addPromoCode,
    TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult Function(String tableUuid)? parkOrder,
    TResult Function(String tableUuid)? selectTable,
    TResult Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult Function(String productUuid, String? note)? updateNote,
    TResult Function(String itemUuid)? toggleItemHold,
    TResult Function(String itemUuid)? fireItem,
    required TResult orElse(),
  }) {
    if (selectCustomer != null) {
      return selectCustomer(customer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(UpdateQuantity value) updateQuantity,
    required TResult Function(RemoveFromCart value) removeFromCart,
    required TResult Function(ClearCart value) clearCart,
    required TResult Function(ScanItem value) scanItem,
    required TResult Function(SelectCustomer value) selectCustomer,
    required TResult Function(ApplyDiscount value) applyDiscount,
    required TResult Function(AddPromoCode value) addPromoCode,
    required TResult Function(CheckoutProcessed value) checkoutProcessed,
    required TResult Function(ParkOrder value) parkOrder,
    required TResult Function(SelectTable value) selectTable,
    required TResult Function(RetrieveOrder value) retrieveOrder,
    required TResult Function(CheckoutSplit value) checkoutSplit,
    required TResult Function(UpdateNote value) updateNote,
    required TResult Function(ToggleItemHold value) toggleItemHold,
    required TResult Function(FireItem value) fireItem,
  }) {
    return selectCustomer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddProduct value)? addProduct,
    TResult? Function(UpdateQuantity value)? updateQuantity,
    TResult? Function(RemoveFromCart value)? removeFromCart,
    TResult? Function(ClearCart value)? clearCart,
    TResult? Function(ScanItem value)? scanItem,
    TResult? Function(SelectCustomer value)? selectCustomer,
    TResult? Function(ApplyDiscount value)? applyDiscount,
    TResult? Function(AddPromoCode value)? addPromoCode,
    TResult? Function(CheckoutProcessed value)? checkoutProcessed,
    TResult? Function(ParkOrder value)? parkOrder,
    TResult? Function(SelectTable value)? selectTable,
    TResult? Function(RetrieveOrder value)? retrieveOrder,
    TResult? Function(CheckoutSplit value)? checkoutSplit,
    TResult? Function(UpdateNote value)? updateNote,
    TResult? Function(ToggleItemHold value)? toggleItemHold,
    TResult? Function(FireItem value)? fireItem,
  }) {
    return selectCustomer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddProduct value)? addProduct,
    TResult Function(UpdateQuantity value)? updateQuantity,
    TResult Function(RemoveFromCart value)? removeFromCart,
    TResult Function(ClearCart value)? clearCart,
    TResult Function(ScanItem value)? scanItem,
    TResult Function(SelectCustomer value)? selectCustomer,
    TResult Function(ApplyDiscount value)? applyDiscount,
    TResult Function(AddPromoCode value)? addPromoCode,
    TResult Function(CheckoutProcessed value)? checkoutProcessed,
    TResult Function(ParkOrder value)? parkOrder,
    TResult Function(SelectTable value)? selectTable,
    TResult Function(RetrieveOrder value)? retrieveOrder,
    TResult Function(CheckoutSplit value)? checkoutSplit,
    TResult Function(UpdateNote value)? updateNote,
    TResult Function(ToggleItemHold value)? toggleItemHold,
    TResult Function(FireItem value)? fireItem,
    required TResult orElse(),
  }) {
    if (selectCustomer != null) {
      return selectCustomer(this);
    }
    return orElse();
  }
}

abstract class SelectCustomer implements CartEvent {
  const factory SelectCustomer(final Customer? customer) = _$SelectCustomerImpl;

  Customer? get customer;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectCustomerImplCopyWith<_$SelectCustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApplyDiscountImplCopyWith<$Res> {
  factory _$$ApplyDiscountImplCopyWith(
          _$ApplyDiscountImpl value, $Res Function(_$ApplyDiscountImpl) then) =
      __$$ApplyDiscountImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double? percent, double? fixed});
}

/// @nodoc
class __$$ApplyDiscountImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$ApplyDiscountImpl>
    implements _$$ApplyDiscountImplCopyWith<$Res> {
  __$$ApplyDiscountImplCopyWithImpl(
      _$ApplyDiscountImpl _value, $Res Function(_$ApplyDiscountImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? percent = freezed,
    Object? fixed = freezed,
  }) {
    return _then(_$ApplyDiscountImpl(
      percent: freezed == percent
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as double?,
      fixed: freezed == fixed
          ? _value.fixed
          : fixed // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$ApplyDiscountImpl implements ApplyDiscount {
  const _$ApplyDiscountImpl({this.percent, this.fixed});

  @override
  final double? percent;
  @override
  final double? fixed;

  @override
  String toString() {
    return 'CartEvent.applyDiscount(percent: $percent, fixed: $fixed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplyDiscountImpl &&
            (identical(other.percent, percent) || other.percent == percent) &&
            (identical(other.fixed, fixed) || other.fixed == fixed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, percent, fixed);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplyDiscountImplCopyWith<_$ApplyDiscountImpl> get copyWith =>
      __$$ApplyDiscountImplCopyWithImpl<_$ApplyDiscountImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Product product, List<ModifierItem> modifiers)
        addProduct,
    required TResult Function(String itemUuid, int quantity) updateQuantity,
    required TResult Function(String itemUuid) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(String barcode) scanItem,
    required TResult Function(Customer? customer) selectCustomer,
    required TResult Function(double? percent, double? fixed) applyDiscount,
    required TResult Function(String code) addPromoCode,
    required TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)
        checkoutProcessed,
    required TResult Function(String tableUuid) parkOrder,
    required TResult Function(String tableUuid) selectTable,
    required TResult Function(String orderUuid, String tableUuid) retrieveOrder,
    required TResult Function(List<String> itemUuids, String paymentMethod)
        checkoutSplit,
    required TResult Function(String productUuid, String? note) updateNote,
    required TResult Function(String itemUuid) toggleItemHold,
    required TResult Function(String itemUuid) fireItem,
  }) {
    return applyDiscount(percent, fixed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Product product, List<ModifierItem> modifiers)?
        addProduct,
    TResult? Function(String itemUuid, int quantity)? updateQuantity,
    TResult? Function(String itemUuid)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(String barcode)? scanItem,
    TResult? Function(Customer? customer)? selectCustomer,
    TResult? Function(double? percent, double? fixed)? applyDiscount,
    TResult? Function(String code)? addPromoCode,
    TResult? Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult? Function(String tableUuid)? parkOrder,
    TResult? Function(String tableUuid)? selectTable,
    TResult? Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult? Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult? Function(String productUuid, String? note)? updateNote,
    TResult? Function(String itemUuid)? toggleItemHold,
    TResult? Function(String itemUuid)? fireItem,
  }) {
    return applyDiscount?.call(percent, fixed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Product product, List<ModifierItem> modifiers)? addProduct,
    TResult Function(String itemUuid, int quantity)? updateQuantity,
    TResult Function(String itemUuid)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(String barcode)? scanItem,
    TResult Function(Customer? customer)? selectCustomer,
    TResult Function(double? percent, double? fixed)? applyDiscount,
    TResult Function(String code)? addPromoCode,
    TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult Function(String tableUuid)? parkOrder,
    TResult Function(String tableUuid)? selectTable,
    TResult Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult Function(String productUuid, String? note)? updateNote,
    TResult Function(String itemUuid)? toggleItemHold,
    TResult Function(String itemUuid)? fireItem,
    required TResult orElse(),
  }) {
    if (applyDiscount != null) {
      return applyDiscount(percent, fixed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(UpdateQuantity value) updateQuantity,
    required TResult Function(RemoveFromCart value) removeFromCart,
    required TResult Function(ClearCart value) clearCart,
    required TResult Function(ScanItem value) scanItem,
    required TResult Function(SelectCustomer value) selectCustomer,
    required TResult Function(ApplyDiscount value) applyDiscount,
    required TResult Function(AddPromoCode value) addPromoCode,
    required TResult Function(CheckoutProcessed value) checkoutProcessed,
    required TResult Function(ParkOrder value) parkOrder,
    required TResult Function(SelectTable value) selectTable,
    required TResult Function(RetrieveOrder value) retrieveOrder,
    required TResult Function(CheckoutSplit value) checkoutSplit,
    required TResult Function(UpdateNote value) updateNote,
    required TResult Function(ToggleItemHold value) toggleItemHold,
    required TResult Function(FireItem value) fireItem,
  }) {
    return applyDiscount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddProduct value)? addProduct,
    TResult? Function(UpdateQuantity value)? updateQuantity,
    TResult? Function(RemoveFromCart value)? removeFromCart,
    TResult? Function(ClearCart value)? clearCart,
    TResult? Function(ScanItem value)? scanItem,
    TResult? Function(SelectCustomer value)? selectCustomer,
    TResult? Function(ApplyDiscount value)? applyDiscount,
    TResult? Function(AddPromoCode value)? addPromoCode,
    TResult? Function(CheckoutProcessed value)? checkoutProcessed,
    TResult? Function(ParkOrder value)? parkOrder,
    TResult? Function(SelectTable value)? selectTable,
    TResult? Function(RetrieveOrder value)? retrieveOrder,
    TResult? Function(CheckoutSplit value)? checkoutSplit,
    TResult? Function(UpdateNote value)? updateNote,
    TResult? Function(ToggleItemHold value)? toggleItemHold,
    TResult? Function(FireItem value)? fireItem,
  }) {
    return applyDiscount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddProduct value)? addProduct,
    TResult Function(UpdateQuantity value)? updateQuantity,
    TResult Function(RemoveFromCart value)? removeFromCart,
    TResult Function(ClearCart value)? clearCart,
    TResult Function(ScanItem value)? scanItem,
    TResult Function(SelectCustomer value)? selectCustomer,
    TResult Function(ApplyDiscount value)? applyDiscount,
    TResult Function(AddPromoCode value)? addPromoCode,
    TResult Function(CheckoutProcessed value)? checkoutProcessed,
    TResult Function(ParkOrder value)? parkOrder,
    TResult Function(SelectTable value)? selectTable,
    TResult Function(RetrieveOrder value)? retrieveOrder,
    TResult Function(CheckoutSplit value)? checkoutSplit,
    TResult Function(UpdateNote value)? updateNote,
    TResult Function(ToggleItemHold value)? toggleItemHold,
    TResult Function(FireItem value)? fireItem,
    required TResult orElse(),
  }) {
    if (applyDiscount != null) {
      return applyDiscount(this);
    }
    return orElse();
  }
}

abstract class ApplyDiscount implements CartEvent {
  const factory ApplyDiscount({final double? percent, final double? fixed}) =
      _$ApplyDiscountImpl;

  double? get percent;
  double? get fixed;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplyDiscountImplCopyWith<_$ApplyDiscountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddPromoCodeImplCopyWith<$Res> {
  factory _$$AddPromoCodeImplCopyWith(
          _$AddPromoCodeImpl value, $Res Function(_$AddPromoCodeImpl) then) =
      __$$AddPromoCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String code});
}

/// @nodoc
class __$$AddPromoCodeImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$AddPromoCodeImpl>
    implements _$$AddPromoCodeImplCopyWith<$Res> {
  __$$AddPromoCodeImplCopyWithImpl(
      _$AddPromoCodeImpl _value, $Res Function(_$AddPromoCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$AddPromoCodeImpl(
      null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddPromoCodeImpl implements AddPromoCode {
  const _$AddPromoCodeImpl(this.code);

  @override
  final String code;

  @override
  String toString() {
    return 'CartEvent.addPromoCode(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPromoCodeImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPromoCodeImplCopyWith<_$AddPromoCodeImpl> get copyWith =>
      __$$AddPromoCodeImplCopyWithImpl<_$AddPromoCodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Product product, List<ModifierItem> modifiers)
        addProduct,
    required TResult Function(String itemUuid, int quantity) updateQuantity,
    required TResult Function(String itemUuid) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(String barcode) scanItem,
    required TResult Function(Customer? customer) selectCustomer,
    required TResult Function(double? percent, double? fixed) applyDiscount,
    required TResult Function(String code) addPromoCode,
    required TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)
        checkoutProcessed,
    required TResult Function(String tableUuid) parkOrder,
    required TResult Function(String tableUuid) selectTable,
    required TResult Function(String orderUuid, String tableUuid) retrieveOrder,
    required TResult Function(List<String> itemUuids, String paymentMethod)
        checkoutSplit,
    required TResult Function(String productUuid, String? note) updateNote,
    required TResult Function(String itemUuid) toggleItemHold,
    required TResult Function(String itemUuid) fireItem,
  }) {
    return addPromoCode(code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Product product, List<ModifierItem> modifiers)?
        addProduct,
    TResult? Function(String itemUuid, int quantity)? updateQuantity,
    TResult? Function(String itemUuid)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(String barcode)? scanItem,
    TResult? Function(Customer? customer)? selectCustomer,
    TResult? Function(double? percent, double? fixed)? applyDiscount,
    TResult? Function(String code)? addPromoCode,
    TResult? Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult? Function(String tableUuid)? parkOrder,
    TResult? Function(String tableUuid)? selectTable,
    TResult? Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult? Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult? Function(String productUuid, String? note)? updateNote,
    TResult? Function(String itemUuid)? toggleItemHold,
    TResult? Function(String itemUuid)? fireItem,
  }) {
    return addPromoCode?.call(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Product product, List<ModifierItem> modifiers)? addProduct,
    TResult Function(String itemUuid, int quantity)? updateQuantity,
    TResult Function(String itemUuid)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(String barcode)? scanItem,
    TResult Function(Customer? customer)? selectCustomer,
    TResult Function(double? percent, double? fixed)? applyDiscount,
    TResult Function(String code)? addPromoCode,
    TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult Function(String tableUuid)? parkOrder,
    TResult Function(String tableUuid)? selectTable,
    TResult Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult Function(String productUuid, String? note)? updateNote,
    TResult Function(String itemUuid)? toggleItemHold,
    TResult Function(String itemUuid)? fireItem,
    required TResult orElse(),
  }) {
    if (addPromoCode != null) {
      return addPromoCode(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(UpdateQuantity value) updateQuantity,
    required TResult Function(RemoveFromCart value) removeFromCart,
    required TResult Function(ClearCart value) clearCart,
    required TResult Function(ScanItem value) scanItem,
    required TResult Function(SelectCustomer value) selectCustomer,
    required TResult Function(ApplyDiscount value) applyDiscount,
    required TResult Function(AddPromoCode value) addPromoCode,
    required TResult Function(CheckoutProcessed value) checkoutProcessed,
    required TResult Function(ParkOrder value) parkOrder,
    required TResult Function(SelectTable value) selectTable,
    required TResult Function(RetrieveOrder value) retrieveOrder,
    required TResult Function(CheckoutSplit value) checkoutSplit,
    required TResult Function(UpdateNote value) updateNote,
    required TResult Function(ToggleItemHold value) toggleItemHold,
    required TResult Function(FireItem value) fireItem,
  }) {
    return addPromoCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddProduct value)? addProduct,
    TResult? Function(UpdateQuantity value)? updateQuantity,
    TResult? Function(RemoveFromCart value)? removeFromCart,
    TResult? Function(ClearCart value)? clearCart,
    TResult? Function(ScanItem value)? scanItem,
    TResult? Function(SelectCustomer value)? selectCustomer,
    TResult? Function(ApplyDiscount value)? applyDiscount,
    TResult? Function(AddPromoCode value)? addPromoCode,
    TResult? Function(CheckoutProcessed value)? checkoutProcessed,
    TResult? Function(ParkOrder value)? parkOrder,
    TResult? Function(SelectTable value)? selectTable,
    TResult? Function(RetrieveOrder value)? retrieveOrder,
    TResult? Function(CheckoutSplit value)? checkoutSplit,
    TResult? Function(UpdateNote value)? updateNote,
    TResult? Function(ToggleItemHold value)? toggleItemHold,
    TResult? Function(FireItem value)? fireItem,
  }) {
    return addPromoCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddProduct value)? addProduct,
    TResult Function(UpdateQuantity value)? updateQuantity,
    TResult Function(RemoveFromCart value)? removeFromCart,
    TResult Function(ClearCart value)? clearCart,
    TResult Function(ScanItem value)? scanItem,
    TResult Function(SelectCustomer value)? selectCustomer,
    TResult Function(ApplyDiscount value)? applyDiscount,
    TResult Function(AddPromoCode value)? addPromoCode,
    TResult Function(CheckoutProcessed value)? checkoutProcessed,
    TResult Function(ParkOrder value)? parkOrder,
    TResult Function(SelectTable value)? selectTable,
    TResult Function(RetrieveOrder value)? retrieveOrder,
    TResult Function(CheckoutSplit value)? checkoutSplit,
    TResult Function(UpdateNote value)? updateNote,
    TResult Function(ToggleItemHold value)? toggleItemHold,
    TResult Function(FireItem value)? fireItem,
    required TResult orElse(),
  }) {
    if (addPromoCode != null) {
      return addPromoCode(this);
    }
    return orElse();
  }
}

abstract class AddPromoCode implements CartEvent {
  const factory AddPromoCode(final String code) = _$AddPromoCodeImpl;

  String get code;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddPromoCodeImplCopyWith<_$AddPromoCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckoutProcessedImplCopyWith<$Res> {
  factory _$$CheckoutProcessedImplCopyWith(_$CheckoutProcessedImpl value,
          $Res Function(_$CheckoutProcessedImpl) then) =
      __$$CheckoutProcessedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String paymentMethod, double? tenderedAmount, double? changeAmount});
}

/// @nodoc
class __$$CheckoutProcessedImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$CheckoutProcessedImpl>
    implements _$$CheckoutProcessedImplCopyWith<$Res> {
  __$$CheckoutProcessedImplCopyWithImpl(_$CheckoutProcessedImpl _value,
      $Res Function(_$CheckoutProcessedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethod = null,
    Object? tenderedAmount = freezed,
    Object? changeAmount = freezed,
  }) {
    return _then(_$CheckoutProcessedImpl(
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      tenderedAmount: freezed == tenderedAmount
          ? _value.tenderedAmount
          : tenderedAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      changeAmount: freezed == changeAmount
          ? _value.changeAmount
          : changeAmount // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$CheckoutProcessedImpl implements CheckoutProcessed {
  const _$CheckoutProcessedImpl(
      {required this.paymentMethod, this.tenderedAmount, this.changeAmount});

  @override
  final String paymentMethod;
  @override
  final double? tenderedAmount;
  @override
  final double? changeAmount;

  @override
  String toString() {
    return 'CartEvent.checkoutProcessed(paymentMethod: $paymentMethod, tenderedAmount: $tenderedAmount, changeAmount: $changeAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutProcessedImpl &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.tenderedAmount, tenderedAmount) ||
                other.tenderedAmount == tenderedAmount) &&
            (identical(other.changeAmount, changeAmount) ||
                other.changeAmount == changeAmount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, paymentMethod, tenderedAmount, changeAmount);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutProcessedImplCopyWith<_$CheckoutProcessedImpl> get copyWith =>
      __$$CheckoutProcessedImplCopyWithImpl<_$CheckoutProcessedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Product product, List<ModifierItem> modifiers)
        addProduct,
    required TResult Function(String itemUuid, int quantity) updateQuantity,
    required TResult Function(String itemUuid) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(String barcode) scanItem,
    required TResult Function(Customer? customer) selectCustomer,
    required TResult Function(double? percent, double? fixed) applyDiscount,
    required TResult Function(String code) addPromoCode,
    required TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)
        checkoutProcessed,
    required TResult Function(String tableUuid) parkOrder,
    required TResult Function(String tableUuid) selectTable,
    required TResult Function(String orderUuid, String tableUuid) retrieveOrder,
    required TResult Function(List<String> itemUuids, String paymentMethod)
        checkoutSplit,
    required TResult Function(String productUuid, String? note) updateNote,
    required TResult Function(String itemUuid) toggleItemHold,
    required TResult Function(String itemUuid) fireItem,
  }) {
    return checkoutProcessed(paymentMethod, tenderedAmount, changeAmount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Product product, List<ModifierItem> modifiers)?
        addProduct,
    TResult? Function(String itemUuid, int quantity)? updateQuantity,
    TResult? Function(String itemUuid)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(String barcode)? scanItem,
    TResult? Function(Customer? customer)? selectCustomer,
    TResult? Function(double? percent, double? fixed)? applyDiscount,
    TResult? Function(String code)? addPromoCode,
    TResult? Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult? Function(String tableUuid)? parkOrder,
    TResult? Function(String tableUuid)? selectTable,
    TResult? Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult? Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult? Function(String productUuid, String? note)? updateNote,
    TResult? Function(String itemUuid)? toggleItemHold,
    TResult? Function(String itemUuid)? fireItem,
  }) {
    return checkoutProcessed?.call(paymentMethod, tenderedAmount, changeAmount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Product product, List<ModifierItem> modifiers)? addProduct,
    TResult Function(String itemUuid, int quantity)? updateQuantity,
    TResult Function(String itemUuid)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(String barcode)? scanItem,
    TResult Function(Customer? customer)? selectCustomer,
    TResult Function(double? percent, double? fixed)? applyDiscount,
    TResult Function(String code)? addPromoCode,
    TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult Function(String tableUuid)? parkOrder,
    TResult Function(String tableUuid)? selectTable,
    TResult Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult Function(String productUuid, String? note)? updateNote,
    TResult Function(String itemUuid)? toggleItemHold,
    TResult Function(String itemUuid)? fireItem,
    required TResult orElse(),
  }) {
    if (checkoutProcessed != null) {
      return checkoutProcessed(paymentMethod, tenderedAmount, changeAmount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(UpdateQuantity value) updateQuantity,
    required TResult Function(RemoveFromCart value) removeFromCart,
    required TResult Function(ClearCart value) clearCart,
    required TResult Function(ScanItem value) scanItem,
    required TResult Function(SelectCustomer value) selectCustomer,
    required TResult Function(ApplyDiscount value) applyDiscount,
    required TResult Function(AddPromoCode value) addPromoCode,
    required TResult Function(CheckoutProcessed value) checkoutProcessed,
    required TResult Function(ParkOrder value) parkOrder,
    required TResult Function(SelectTable value) selectTable,
    required TResult Function(RetrieveOrder value) retrieveOrder,
    required TResult Function(CheckoutSplit value) checkoutSplit,
    required TResult Function(UpdateNote value) updateNote,
    required TResult Function(ToggleItemHold value) toggleItemHold,
    required TResult Function(FireItem value) fireItem,
  }) {
    return checkoutProcessed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddProduct value)? addProduct,
    TResult? Function(UpdateQuantity value)? updateQuantity,
    TResult? Function(RemoveFromCart value)? removeFromCart,
    TResult? Function(ClearCart value)? clearCart,
    TResult? Function(ScanItem value)? scanItem,
    TResult? Function(SelectCustomer value)? selectCustomer,
    TResult? Function(ApplyDiscount value)? applyDiscount,
    TResult? Function(AddPromoCode value)? addPromoCode,
    TResult? Function(CheckoutProcessed value)? checkoutProcessed,
    TResult? Function(ParkOrder value)? parkOrder,
    TResult? Function(SelectTable value)? selectTable,
    TResult? Function(RetrieveOrder value)? retrieveOrder,
    TResult? Function(CheckoutSplit value)? checkoutSplit,
    TResult? Function(UpdateNote value)? updateNote,
    TResult? Function(ToggleItemHold value)? toggleItemHold,
    TResult? Function(FireItem value)? fireItem,
  }) {
    return checkoutProcessed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddProduct value)? addProduct,
    TResult Function(UpdateQuantity value)? updateQuantity,
    TResult Function(RemoveFromCart value)? removeFromCart,
    TResult Function(ClearCart value)? clearCart,
    TResult Function(ScanItem value)? scanItem,
    TResult Function(SelectCustomer value)? selectCustomer,
    TResult Function(ApplyDiscount value)? applyDiscount,
    TResult Function(AddPromoCode value)? addPromoCode,
    TResult Function(CheckoutProcessed value)? checkoutProcessed,
    TResult Function(ParkOrder value)? parkOrder,
    TResult Function(SelectTable value)? selectTable,
    TResult Function(RetrieveOrder value)? retrieveOrder,
    TResult Function(CheckoutSplit value)? checkoutSplit,
    TResult Function(UpdateNote value)? updateNote,
    TResult Function(ToggleItemHold value)? toggleItemHold,
    TResult Function(FireItem value)? fireItem,
    required TResult orElse(),
  }) {
    if (checkoutProcessed != null) {
      return checkoutProcessed(this);
    }
    return orElse();
  }
}

abstract class CheckoutProcessed implements CartEvent {
  const factory CheckoutProcessed(
      {required final String paymentMethod,
      final double? tenderedAmount,
      final double? changeAmount}) = _$CheckoutProcessedImpl;

  String get paymentMethod;
  double? get tenderedAmount;
  double? get changeAmount;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutProcessedImplCopyWith<_$CheckoutProcessedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParkOrderImplCopyWith<$Res> {
  factory _$$ParkOrderImplCopyWith(
          _$ParkOrderImpl value, $Res Function(_$ParkOrderImpl) then) =
      __$$ParkOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String tableUuid});
}

/// @nodoc
class __$$ParkOrderImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$ParkOrderImpl>
    implements _$$ParkOrderImplCopyWith<$Res> {
  __$$ParkOrderImplCopyWithImpl(
      _$ParkOrderImpl _value, $Res Function(_$ParkOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableUuid = null,
  }) {
    return _then(_$ParkOrderImpl(
      null == tableUuid
          ? _value.tableUuid
          : tableUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ParkOrderImpl implements ParkOrder {
  const _$ParkOrderImpl(this.tableUuid);

  @override
  final String tableUuid;

  @override
  String toString() {
    return 'CartEvent.parkOrder(tableUuid: $tableUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParkOrderImpl &&
            (identical(other.tableUuid, tableUuid) ||
                other.tableUuid == tableUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tableUuid);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParkOrderImplCopyWith<_$ParkOrderImpl> get copyWith =>
      __$$ParkOrderImplCopyWithImpl<_$ParkOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Product product, List<ModifierItem> modifiers)
        addProduct,
    required TResult Function(String itemUuid, int quantity) updateQuantity,
    required TResult Function(String itemUuid) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(String barcode) scanItem,
    required TResult Function(Customer? customer) selectCustomer,
    required TResult Function(double? percent, double? fixed) applyDiscount,
    required TResult Function(String code) addPromoCode,
    required TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)
        checkoutProcessed,
    required TResult Function(String tableUuid) parkOrder,
    required TResult Function(String tableUuid) selectTable,
    required TResult Function(String orderUuid, String tableUuid) retrieveOrder,
    required TResult Function(List<String> itemUuids, String paymentMethod)
        checkoutSplit,
    required TResult Function(String productUuid, String? note) updateNote,
    required TResult Function(String itemUuid) toggleItemHold,
    required TResult Function(String itemUuid) fireItem,
  }) {
    return parkOrder(tableUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Product product, List<ModifierItem> modifiers)?
        addProduct,
    TResult? Function(String itemUuid, int quantity)? updateQuantity,
    TResult? Function(String itemUuid)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(String barcode)? scanItem,
    TResult? Function(Customer? customer)? selectCustomer,
    TResult? Function(double? percent, double? fixed)? applyDiscount,
    TResult? Function(String code)? addPromoCode,
    TResult? Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult? Function(String tableUuid)? parkOrder,
    TResult? Function(String tableUuid)? selectTable,
    TResult? Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult? Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult? Function(String productUuid, String? note)? updateNote,
    TResult? Function(String itemUuid)? toggleItemHold,
    TResult? Function(String itemUuid)? fireItem,
  }) {
    return parkOrder?.call(tableUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Product product, List<ModifierItem> modifiers)? addProduct,
    TResult Function(String itemUuid, int quantity)? updateQuantity,
    TResult Function(String itemUuid)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(String barcode)? scanItem,
    TResult Function(Customer? customer)? selectCustomer,
    TResult Function(double? percent, double? fixed)? applyDiscount,
    TResult Function(String code)? addPromoCode,
    TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult Function(String tableUuid)? parkOrder,
    TResult Function(String tableUuid)? selectTable,
    TResult Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult Function(String productUuid, String? note)? updateNote,
    TResult Function(String itemUuid)? toggleItemHold,
    TResult Function(String itemUuid)? fireItem,
    required TResult orElse(),
  }) {
    if (parkOrder != null) {
      return parkOrder(tableUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(UpdateQuantity value) updateQuantity,
    required TResult Function(RemoveFromCart value) removeFromCart,
    required TResult Function(ClearCart value) clearCart,
    required TResult Function(ScanItem value) scanItem,
    required TResult Function(SelectCustomer value) selectCustomer,
    required TResult Function(ApplyDiscount value) applyDiscount,
    required TResult Function(AddPromoCode value) addPromoCode,
    required TResult Function(CheckoutProcessed value) checkoutProcessed,
    required TResult Function(ParkOrder value) parkOrder,
    required TResult Function(SelectTable value) selectTable,
    required TResult Function(RetrieveOrder value) retrieveOrder,
    required TResult Function(CheckoutSplit value) checkoutSplit,
    required TResult Function(UpdateNote value) updateNote,
    required TResult Function(ToggleItemHold value) toggleItemHold,
    required TResult Function(FireItem value) fireItem,
  }) {
    return parkOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddProduct value)? addProduct,
    TResult? Function(UpdateQuantity value)? updateQuantity,
    TResult? Function(RemoveFromCart value)? removeFromCart,
    TResult? Function(ClearCart value)? clearCart,
    TResult? Function(ScanItem value)? scanItem,
    TResult? Function(SelectCustomer value)? selectCustomer,
    TResult? Function(ApplyDiscount value)? applyDiscount,
    TResult? Function(AddPromoCode value)? addPromoCode,
    TResult? Function(CheckoutProcessed value)? checkoutProcessed,
    TResult? Function(ParkOrder value)? parkOrder,
    TResult? Function(SelectTable value)? selectTable,
    TResult? Function(RetrieveOrder value)? retrieveOrder,
    TResult? Function(CheckoutSplit value)? checkoutSplit,
    TResult? Function(UpdateNote value)? updateNote,
    TResult? Function(ToggleItemHold value)? toggleItemHold,
    TResult? Function(FireItem value)? fireItem,
  }) {
    return parkOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddProduct value)? addProduct,
    TResult Function(UpdateQuantity value)? updateQuantity,
    TResult Function(RemoveFromCart value)? removeFromCart,
    TResult Function(ClearCart value)? clearCart,
    TResult Function(ScanItem value)? scanItem,
    TResult Function(SelectCustomer value)? selectCustomer,
    TResult Function(ApplyDiscount value)? applyDiscount,
    TResult Function(AddPromoCode value)? addPromoCode,
    TResult Function(CheckoutProcessed value)? checkoutProcessed,
    TResult Function(ParkOrder value)? parkOrder,
    TResult Function(SelectTable value)? selectTable,
    TResult Function(RetrieveOrder value)? retrieveOrder,
    TResult Function(CheckoutSplit value)? checkoutSplit,
    TResult Function(UpdateNote value)? updateNote,
    TResult Function(ToggleItemHold value)? toggleItemHold,
    TResult Function(FireItem value)? fireItem,
    required TResult orElse(),
  }) {
    if (parkOrder != null) {
      return parkOrder(this);
    }
    return orElse();
  }
}

abstract class ParkOrder implements CartEvent {
  const factory ParkOrder(final String tableUuid) = _$ParkOrderImpl;

  String get tableUuid;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParkOrderImplCopyWith<_$ParkOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectTableImplCopyWith<$Res> {
  factory _$$SelectTableImplCopyWith(
          _$SelectTableImpl value, $Res Function(_$SelectTableImpl) then) =
      __$$SelectTableImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String tableUuid});
}

/// @nodoc
class __$$SelectTableImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$SelectTableImpl>
    implements _$$SelectTableImplCopyWith<$Res> {
  __$$SelectTableImplCopyWithImpl(
      _$SelectTableImpl _value, $Res Function(_$SelectTableImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableUuid = null,
  }) {
    return _then(_$SelectTableImpl(
      null == tableUuid
          ? _value.tableUuid
          : tableUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectTableImpl implements SelectTable {
  const _$SelectTableImpl(this.tableUuid);

  @override
  final String tableUuid;

  @override
  String toString() {
    return 'CartEvent.selectTable(tableUuid: $tableUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectTableImpl &&
            (identical(other.tableUuid, tableUuid) ||
                other.tableUuid == tableUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tableUuid);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectTableImplCopyWith<_$SelectTableImpl> get copyWith =>
      __$$SelectTableImplCopyWithImpl<_$SelectTableImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Product product, List<ModifierItem> modifiers)
        addProduct,
    required TResult Function(String itemUuid, int quantity) updateQuantity,
    required TResult Function(String itemUuid) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(String barcode) scanItem,
    required TResult Function(Customer? customer) selectCustomer,
    required TResult Function(double? percent, double? fixed) applyDiscount,
    required TResult Function(String code) addPromoCode,
    required TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)
        checkoutProcessed,
    required TResult Function(String tableUuid) parkOrder,
    required TResult Function(String tableUuid) selectTable,
    required TResult Function(String orderUuid, String tableUuid) retrieveOrder,
    required TResult Function(List<String> itemUuids, String paymentMethod)
        checkoutSplit,
    required TResult Function(String productUuid, String? note) updateNote,
    required TResult Function(String itemUuid) toggleItemHold,
    required TResult Function(String itemUuid) fireItem,
  }) {
    return selectTable(tableUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Product product, List<ModifierItem> modifiers)?
        addProduct,
    TResult? Function(String itemUuid, int quantity)? updateQuantity,
    TResult? Function(String itemUuid)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(String barcode)? scanItem,
    TResult? Function(Customer? customer)? selectCustomer,
    TResult? Function(double? percent, double? fixed)? applyDiscount,
    TResult? Function(String code)? addPromoCode,
    TResult? Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult? Function(String tableUuid)? parkOrder,
    TResult? Function(String tableUuid)? selectTable,
    TResult? Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult? Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult? Function(String productUuid, String? note)? updateNote,
    TResult? Function(String itemUuid)? toggleItemHold,
    TResult? Function(String itemUuid)? fireItem,
  }) {
    return selectTable?.call(tableUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Product product, List<ModifierItem> modifiers)? addProduct,
    TResult Function(String itemUuid, int quantity)? updateQuantity,
    TResult Function(String itemUuid)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(String barcode)? scanItem,
    TResult Function(Customer? customer)? selectCustomer,
    TResult Function(double? percent, double? fixed)? applyDiscount,
    TResult Function(String code)? addPromoCode,
    TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult Function(String tableUuid)? parkOrder,
    TResult Function(String tableUuid)? selectTable,
    TResult Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult Function(String productUuid, String? note)? updateNote,
    TResult Function(String itemUuid)? toggleItemHold,
    TResult Function(String itemUuid)? fireItem,
    required TResult orElse(),
  }) {
    if (selectTable != null) {
      return selectTable(tableUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(UpdateQuantity value) updateQuantity,
    required TResult Function(RemoveFromCart value) removeFromCart,
    required TResult Function(ClearCart value) clearCart,
    required TResult Function(ScanItem value) scanItem,
    required TResult Function(SelectCustomer value) selectCustomer,
    required TResult Function(ApplyDiscount value) applyDiscount,
    required TResult Function(AddPromoCode value) addPromoCode,
    required TResult Function(CheckoutProcessed value) checkoutProcessed,
    required TResult Function(ParkOrder value) parkOrder,
    required TResult Function(SelectTable value) selectTable,
    required TResult Function(RetrieveOrder value) retrieveOrder,
    required TResult Function(CheckoutSplit value) checkoutSplit,
    required TResult Function(UpdateNote value) updateNote,
    required TResult Function(ToggleItemHold value) toggleItemHold,
    required TResult Function(FireItem value) fireItem,
  }) {
    return selectTable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddProduct value)? addProduct,
    TResult? Function(UpdateQuantity value)? updateQuantity,
    TResult? Function(RemoveFromCart value)? removeFromCart,
    TResult? Function(ClearCart value)? clearCart,
    TResult? Function(ScanItem value)? scanItem,
    TResult? Function(SelectCustomer value)? selectCustomer,
    TResult? Function(ApplyDiscount value)? applyDiscount,
    TResult? Function(AddPromoCode value)? addPromoCode,
    TResult? Function(CheckoutProcessed value)? checkoutProcessed,
    TResult? Function(ParkOrder value)? parkOrder,
    TResult? Function(SelectTable value)? selectTable,
    TResult? Function(RetrieveOrder value)? retrieveOrder,
    TResult? Function(CheckoutSplit value)? checkoutSplit,
    TResult? Function(UpdateNote value)? updateNote,
    TResult? Function(ToggleItemHold value)? toggleItemHold,
    TResult? Function(FireItem value)? fireItem,
  }) {
    return selectTable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddProduct value)? addProduct,
    TResult Function(UpdateQuantity value)? updateQuantity,
    TResult Function(RemoveFromCart value)? removeFromCart,
    TResult Function(ClearCart value)? clearCart,
    TResult Function(ScanItem value)? scanItem,
    TResult Function(SelectCustomer value)? selectCustomer,
    TResult Function(ApplyDiscount value)? applyDiscount,
    TResult Function(AddPromoCode value)? addPromoCode,
    TResult Function(CheckoutProcessed value)? checkoutProcessed,
    TResult Function(ParkOrder value)? parkOrder,
    TResult Function(SelectTable value)? selectTable,
    TResult Function(RetrieveOrder value)? retrieveOrder,
    TResult Function(CheckoutSplit value)? checkoutSplit,
    TResult Function(UpdateNote value)? updateNote,
    TResult Function(ToggleItemHold value)? toggleItemHold,
    TResult Function(FireItem value)? fireItem,
    required TResult orElse(),
  }) {
    if (selectTable != null) {
      return selectTable(this);
    }
    return orElse();
  }
}

abstract class SelectTable implements CartEvent {
  const factory SelectTable(final String tableUuid) = _$SelectTableImpl;

  String get tableUuid;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectTableImplCopyWith<_$SelectTableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RetrieveOrderImplCopyWith<$Res> {
  factory _$$RetrieveOrderImplCopyWith(
          _$RetrieveOrderImpl value, $Res Function(_$RetrieveOrderImpl) then) =
      __$$RetrieveOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderUuid, String tableUuid});
}

/// @nodoc
class __$$RetrieveOrderImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$RetrieveOrderImpl>
    implements _$$RetrieveOrderImplCopyWith<$Res> {
  __$$RetrieveOrderImplCopyWithImpl(
      _$RetrieveOrderImpl _value, $Res Function(_$RetrieveOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderUuid = null,
    Object? tableUuid = null,
  }) {
    return _then(_$RetrieveOrderImpl(
      null == orderUuid
          ? _value.orderUuid
          : orderUuid // ignore: cast_nullable_to_non_nullable
              as String,
      null == tableUuid
          ? _value.tableUuid
          : tableUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RetrieveOrderImpl implements RetrieveOrder {
  const _$RetrieveOrderImpl(this.orderUuid, this.tableUuid);

  @override
  final String orderUuid;
  @override
  final String tableUuid;

  @override
  String toString() {
    return 'CartEvent.retrieveOrder(orderUuid: $orderUuid, tableUuid: $tableUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RetrieveOrderImpl &&
            (identical(other.orderUuid, orderUuid) ||
                other.orderUuid == orderUuid) &&
            (identical(other.tableUuid, tableUuid) ||
                other.tableUuid == tableUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderUuid, tableUuid);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RetrieveOrderImplCopyWith<_$RetrieveOrderImpl> get copyWith =>
      __$$RetrieveOrderImplCopyWithImpl<_$RetrieveOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Product product, List<ModifierItem> modifiers)
        addProduct,
    required TResult Function(String itemUuid, int quantity) updateQuantity,
    required TResult Function(String itemUuid) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(String barcode) scanItem,
    required TResult Function(Customer? customer) selectCustomer,
    required TResult Function(double? percent, double? fixed) applyDiscount,
    required TResult Function(String code) addPromoCode,
    required TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)
        checkoutProcessed,
    required TResult Function(String tableUuid) parkOrder,
    required TResult Function(String tableUuid) selectTable,
    required TResult Function(String orderUuid, String tableUuid) retrieveOrder,
    required TResult Function(List<String> itemUuids, String paymentMethod)
        checkoutSplit,
    required TResult Function(String productUuid, String? note) updateNote,
    required TResult Function(String itemUuid) toggleItemHold,
    required TResult Function(String itemUuid) fireItem,
  }) {
    return retrieveOrder(orderUuid, tableUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Product product, List<ModifierItem> modifiers)?
        addProduct,
    TResult? Function(String itemUuid, int quantity)? updateQuantity,
    TResult? Function(String itemUuid)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(String barcode)? scanItem,
    TResult? Function(Customer? customer)? selectCustomer,
    TResult? Function(double? percent, double? fixed)? applyDiscount,
    TResult? Function(String code)? addPromoCode,
    TResult? Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult? Function(String tableUuid)? parkOrder,
    TResult? Function(String tableUuid)? selectTable,
    TResult? Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult? Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult? Function(String productUuid, String? note)? updateNote,
    TResult? Function(String itemUuid)? toggleItemHold,
    TResult? Function(String itemUuid)? fireItem,
  }) {
    return retrieveOrder?.call(orderUuid, tableUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Product product, List<ModifierItem> modifiers)? addProduct,
    TResult Function(String itemUuid, int quantity)? updateQuantity,
    TResult Function(String itemUuid)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(String barcode)? scanItem,
    TResult Function(Customer? customer)? selectCustomer,
    TResult Function(double? percent, double? fixed)? applyDiscount,
    TResult Function(String code)? addPromoCode,
    TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult Function(String tableUuid)? parkOrder,
    TResult Function(String tableUuid)? selectTable,
    TResult Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult Function(String productUuid, String? note)? updateNote,
    TResult Function(String itemUuid)? toggleItemHold,
    TResult Function(String itemUuid)? fireItem,
    required TResult orElse(),
  }) {
    if (retrieveOrder != null) {
      return retrieveOrder(orderUuid, tableUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(UpdateQuantity value) updateQuantity,
    required TResult Function(RemoveFromCart value) removeFromCart,
    required TResult Function(ClearCart value) clearCart,
    required TResult Function(ScanItem value) scanItem,
    required TResult Function(SelectCustomer value) selectCustomer,
    required TResult Function(ApplyDiscount value) applyDiscount,
    required TResult Function(AddPromoCode value) addPromoCode,
    required TResult Function(CheckoutProcessed value) checkoutProcessed,
    required TResult Function(ParkOrder value) parkOrder,
    required TResult Function(SelectTable value) selectTable,
    required TResult Function(RetrieveOrder value) retrieveOrder,
    required TResult Function(CheckoutSplit value) checkoutSplit,
    required TResult Function(UpdateNote value) updateNote,
    required TResult Function(ToggleItemHold value) toggleItemHold,
    required TResult Function(FireItem value) fireItem,
  }) {
    return retrieveOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddProduct value)? addProduct,
    TResult? Function(UpdateQuantity value)? updateQuantity,
    TResult? Function(RemoveFromCart value)? removeFromCart,
    TResult? Function(ClearCart value)? clearCart,
    TResult? Function(ScanItem value)? scanItem,
    TResult? Function(SelectCustomer value)? selectCustomer,
    TResult? Function(ApplyDiscount value)? applyDiscount,
    TResult? Function(AddPromoCode value)? addPromoCode,
    TResult? Function(CheckoutProcessed value)? checkoutProcessed,
    TResult? Function(ParkOrder value)? parkOrder,
    TResult? Function(SelectTable value)? selectTable,
    TResult? Function(RetrieveOrder value)? retrieveOrder,
    TResult? Function(CheckoutSplit value)? checkoutSplit,
    TResult? Function(UpdateNote value)? updateNote,
    TResult? Function(ToggleItemHold value)? toggleItemHold,
    TResult? Function(FireItem value)? fireItem,
  }) {
    return retrieveOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddProduct value)? addProduct,
    TResult Function(UpdateQuantity value)? updateQuantity,
    TResult Function(RemoveFromCart value)? removeFromCart,
    TResult Function(ClearCart value)? clearCart,
    TResult Function(ScanItem value)? scanItem,
    TResult Function(SelectCustomer value)? selectCustomer,
    TResult Function(ApplyDiscount value)? applyDiscount,
    TResult Function(AddPromoCode value)? addPromoCode,
    TResult Function(CheckoutProcessed value)? checkoutProcessed,
    TResult Function(ParkOrder value)? parkOrder,
    TResult Function(SelectTable value)? selectTable,
    TResult Function(RetrieveOrder value)? retrieveOrder,
    TResult Function(CheckoutSplit value)? checkoutSplit,
    TResult Function(UpdateNote value)? updateNote,
    TResult Function(ToggleItemHold value)? toggleItemHold,
    TResult Function(FireItem value)? fireItem,
    required TResult orElse(),
  }) {
    if (retrieveOrder != null) {
      return retrieveOrder(this);
    }
    return orElse();
  }
}

abstract class RetrieveOrder implements CartEvent {
  const factory RetrieveOrder(final String orderUuid, final String tableUuid) =
      _$RetrieveOrderImpl;

  String get orderUuid;
  String get tableUuid;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RetrieveOrderImplCopyWith<_$RetrieveOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckoutSplitImplCopyWith<$Res> {
  factory _$$CheckoutSplitImplCopyWith(
          _$CheckoutSplitImpl value, $Res Function(_$CheckoutSplitImpl) then) =
      __$$CheckoutSplitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> itemUuids, String paymentMethod});
}

/// @nodoc
class __$$CheckoutSplitImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$CheckoutSplitImpl>
    implements _$$CheckoutSplitImplCopyWith<$Res> {
  __$$CheckoutSplitImplCopyWithImpl(
      _$CheckoutSplitImpl _value, $Res Function(_$CheckoutSplitImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemUuids = null,
    Object? paymentMethod = null,
  }) {
    return _then(_$CheckoutSplitImpl(
      null == itemUuids
          ? _value._itemUuids
          : itemUuids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CheckoutSplitImpl implements CheckoutSplit {
  const _$CheckoutSplitImpl(final List<String> itemUuids, this.paymentMethod)
      : _itemUuids = itemUuids;

  final List<String> _itemUuids;
  @override
  List<String> get itemUuids {
    if (_itemUuids is EqualUnmodifiableListView) return _itemUuids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemUuids);
  }

  @override
  final String paymentMethod;

  @override
  String toString() {
    return 'CartEvent.checkoutSplit(itemUuids: $itemUuids, paymentMethod: $paymentMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutSplitImpl &&
            const DeepCollectionEquality()
                .equals(other._itemUuids, _itemUuids) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_itemUuids), paymentMethod);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutSplitImplCopyWith<_$CheckoutSplitImpl> get copyWith =>
      __$$CheckoutSplitImplCopyWithImpl<_$CheckoutSplitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Product product, List<ModifierItem> modifiers)
        addProduct,
    required TResult Function(String itemUuid, int quantity) updateQuantity,
    required TResult Function(String itemUuid) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(String barcode) scanItem,
    required TResult Function(Customer? customer) selectCustomer,
    required TResult Function(double? percent, double? fixed) applyDiscount,
    required TResult Function(String code) addPromoCode,
    required TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)
        checkoutProcessed,
    required TResult Function(String tableUuid) parkOrder,
    required TResult Function(String tableUuid) selectTable,
    required TResult Function(String orderUuid, String tableUuid) retrieveOrder,
    required TResult Function(List<String> itemUuids, String paymentMethod)
        checkoutSplit,
    required TResult Function(String productUuid, String? note) updateNote,
    required TResult Function(String itemUuid) toggleItemHold,
    required TResult Function(String itemUuid) fireItem,
  }) {
    return checkoutSplit(itemUuids, paymentMethod);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Product product, List<ModifierItem> modifiers)?
        addProduct,
    TResult? Function(String itemUuid, int quantity)? updateQuantity,
    TResult? Function(String itemUuid)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(String barcode)? scanItem,
    TResult? Function(Customer? customer)? selectCustomer,
    TResult? Function(double? percent, double? fixed)? applyDiscount,
    TResult? Function(String code)? addPromoCode,
    TResult? Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult? Function(String tableUuid)? parkOrder,
    TResult? Function(String tableUuid)? selectTable,
    TResult? Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult? Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult? Function(String productUuid, String? note)? updateNote,
    TResult? Function(String itemUuid)? toggleItemHold,
    TResult? Function(String itemUuid)? fireItem,
  }) {
    return checkoutSplit?.call(itemUuids, paymentMethod);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Product product, List<ModifierItem> modifiers)? addProduct,
    TResult Function(String itemUuid, int quantity)? updateQuantity,
    TResult Function(String itemUuid)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(String barcode)? scanItem,
    TResult Function(Customer? customer)? selectCustomer,
    TResult Function(double? percent, double? fixed)? applyDiscount,
    TResult Function(String code)? addPromoCode,
    TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult Function(String tableUuid)? parkOrder,
    TResult Function(String tableUuid)? selectTable,
    TResult Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult Function(String productUuid, String? note)? updateNote,
    TResult Function(String itemUuid)? toggleItemHold,
    TResult Function(String itemUuid)? fireItem,
    required TResult orElse(),
  }) {
    if (checkoutSplit != null) {
      return checkoutSplit(itemUuids, paymentMethod);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(UpdateQuantity value) updateQuantity,
    required TResult Function(RemoveFromCart value) removeFromCart,
    required TResult Function(ClearCart value) clearCart,
    required TResult Function(ScanItem value) scanItem,
    required TResult Function(SelectCustomer value) selectCustomer,
    required TResult Function(ApplyDiscount value) applyDiscount,
    required TResult Function(AddPromoCode value) addPromoCode,
    required TResult Function(CheckoutProcessed value) checkoutProcessed,
    required TResult Function(ParkOrder value) parkOrder,
    required TResult Function(SelectTable value) selectTable,
    required TResult Function(RetrieveOrder value) retrieveOrder,
    required TResult Function(CheckoutSplit value) checkoutSplit,
    required TResult Function(UpdateNote value) updateNote,
    required TResult Function(ToggleItemHold value) toggleItemHold,
    required TResult Function(FireItem value) fireItem,
  }) {
    return checkoutSplit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddProduct value)? addProduct,
    TResult? Function(UpdateQuantity value)? updateQuantity,
    TResult? Function(RemoveFromCart value)? removeFromCart,
    TResult? Function(ClearCart value)? clearCart,
    TResult? Function(ScanItem value)? scanItem,
    TResult? Function(SelectCustomer value)? selectCustomer,
    TResult? Function(ApplyDiscount value)? applyDiscount,
    TResult? Function(AddPromoCode value)? addPromoCode,
    TResult? Function(CheckoutProcessed value)? checkoutProcessed,
    TResult? Function(ParkOrder value)? parkOrder,
    TResult? Function(SelectTable value)? selectTable,
    TResult? Function(RetrieveOrder value)? retrieveOrder,
    TResult? Function(CheckoutSplit value)? checkoutSplit,
    TResult? Function(UpdateNote value)? updateNote,
    TResult? Function(ToggleItemHold value)? toggleItemHold,
    TResult? Function(FireItem value)? fireItem,
  }) {
    return checkoutSplit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddProduct value)? addProduct,
    TResult Function(UpdateQuantity value)? updateQuantity,
    TResult Function(RemoveFromCart value)? removeFromCart,
    TResult Function(ClearCart value)? clearCart,
    TResult Function(ScanItem value)? scanItem,
    TResult Function(SelectCustomer value)? selectCustomer,
    TResult Function(ApplyDiscount value)? applyDiscount,
    TResult Function(AddPromoCode value)? addPromoCode,
    TResult Function(CheckoutProcessed value)? checkoutProcessed,
    TResult Function(ParkOrder value)? parkOrder,
    TResult Function(SelectTable value)? selectTable,
    TResult Function(RetrieveOrder value)? retrieveOrder,
    TResult Function(CheckoutSplit value)? checkoutSplit,
    TResult Function(UpdateNote value)? updateNote,
    TResult Function(ToggleItemHold value)? toggleItemHold,
    TResult Function(FireItem value)? fireItem,
    required TResult orElse(),
  }) {
    if (checkoutSplit != null) {
      return checkoutSplit(this);
    }
    return orElse();
  }
}

abstract class CheckoutSplit implements CartEvent {
  const factory CheckoutSplit(
          final List<String> itemUuids, final String paymentMethod) =
      _$CheckoutSplitImpl;

  List<String> get itemUuids;
  String get paymentMethod;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutSplitImplCopyWith<_$CheckoutSplitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateNoteImplCopyWith<$Res> {
  factory _$$UpdateNoteImplCopyWith(
          _$UpdateNoteImpl value, $Res Function(_$UpdateNoteImpl) then) =
      __$$UpdateNoteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String productUuid, String? note});
}

/// @nodoc
class __$$UpdateNoteImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$UpdateNoteImpl>
    implements _$$UpdateNoteImplCopyWith<$Res> {
  __$$UpdateNoteImplCopyWithImpl(
      _$UpdateNoteImpl _value, $Res Function(_$UpdateNoteImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productUuid = null,
    Object? note = freezed,
  }) {
    return _then(_$UpdateNoteImpl(
      null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UpdateNoteImpl implements UpdateNote {
  const _$UpdateNoteImpl(this.productUuid, this.note);

  @override
  final String productUuid;
  @override
  final String? note;

  @override
  String toString() {
    return 'CartEvent.updateNote(productUuid: $productUuid, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateNoteImpl &&
            (identical(other.productUuid, productUuid) ||
                other.productUuid == productUuid) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productUuid, note);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateNoteImplCopyWith<_$UpdateNoteImpl> get copyWith =>
      __$$UpdateNoteImplCopyWithImpl<_$UpdateNoteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Product product, List<ModifierItem> modifiers)
        addProduct,
    required TResult Function(String itemUuid, int quantity) updateQuantity,
    required TResult Function(String itemUuid) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(String barcode) scanItem,
    required TResult Function(Customer? customer) selectCustomer,
    required TResult Function(double? percent, double? fixed) applyDiscount,
    required TResult Function(String code) addPromoCode,
    required TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)
        checkoutProcessed,
    required TResult Function(String tableUuid) parkOrder,
    required TResult Function(String tableUuid) selectTable,
    required TResult Function(String orderUuid, String tableUuid) retrieveOrder,
    required TResult Function(List<String> itemUuids, String paymentMethod)
        checkoutSplit,
    required TResult Function(String productUuid, String? note) updateNote,
    required TResult Function(String itemUuid) toggleItemHold,
    required TResult Function(String itemUuid) fireItem,
  }) {
    return updateNote(productUuid, note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Product product, List<ModifierItem> modifiers)?
        addProduct,
    TResult? Function(String itemUuid, int quantity)? updateQuantity,
    TResult? Function(String itemUuid)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(String barcode)? scanItem,
    TResult? Function(Customer? customer)? selectCustomer,
    TResult? Function(double? percent, double? fixed)? applyDiscount,
    TResult? Function(String code)? addPromoCode,
    TResult? Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult? Function(String tableUuid)? parkOrder,
    TResult? Function(String tableUuid)? selectTable,
    TResult? Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult? Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult? Function(String productUuid, String? note)? updateNote,
    TResult? Function(String itemUuid)? toggleItemHold,
    TResult? Function(String itemUuid)? fireItem,
  }) {
    return updateNote?.call(productUuid, note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Product product, List<ModifierItem> modifiers)? addProduct,
    TResult Function(String itemUuid, int quantity)? updateQuantity,
    TResult Function(String itemUuid)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(String barcode)? scanItem,
    TResult Function(Customer? customer)? selectCustomer,
    TResult Function(double? percent, double? fixed)? applyDiscount,
    TResult Function(String code)? addPromoCode,
    TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult Function(String tableUuid)? parkOrder,
    TResult Function(String tableUuid)? selectTable,
    TResult Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult Function(String productUuid, String? note)? updateNote,
    TResult Function(String itemUuid)? toggleItemHold,
    TResult Function(String itemUuid)? fireItem,
    required TResult orElse(),
  }) {
    if (updateNote != null) {
      return updateNote(productUuid, note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(UpdateQuantity value) updateQuantity,
    required TResult Function(RemoveFromCart value) removeFromCart,
    required TResult Function(ClearCart value) clearCart,
    required TResult Function(ScanItem value) scanItem,
    required TResult Function(SelectCustomer value) selectCustomer,
    required TResult Function(ApplyDiscount value) applyDiscount,
    required TResult Function(AddPromoCode value) addPromoCode,
    required TResult Function(CheckoutProcessed value) checkoutProcessed,
    required TResult Function(ParkOrder value) parkOrder,
    required TResult Function(SelectTable value) selectTable,
    required TResult Function(RetrieveOrder value) retrieveOrder,
    required TResult Function(CheckoutSplit value) checkoutSplit,
    required TResult Function(UpdateNote value) updateNote,
    required TResult Function(ToggleItemHold value) toggleItemHold,
    required TResult Function(FireItem value) fireItem,
  }) {
    return updateNote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddProduct value)? addProduct,
    TResult? Function(UpdateQuantity value)? updateQuantity,
    TResult? Function(RemoveFromCart value)? removeFromCart,
    TResult? Function(ClearCart value)? clearCart,
    TResult? Function(ScanItem value)? scanItem,
    TResult? Function(SelectCustomer value)? selectCustomer,
    TResult? Function(ApplyDiscount value)? applyDiscount,
    TResult? Function(AddPromoCode value)? addPromoCode,
    TResult? Function(CheckoutProcessed value)? checkoutProcessed,
    TResult? Function(ParkOrder value)? parkOrder,
    TResult? Function(SelectTable value)? selectTable,
    TResult? Function(RetrieveOrder value)? retrieveOrder,
    TResult? Function(CheckoutSplit value)? checkoutSplit,
    TResult? Function(UpdateNote value)? updateNote,
    TResult? Function(ToggleItemHold value)? toggleItemHold,
    TResult? Function(FireItem value)? fireItem,
  }) {
    return updateNote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddProduct value)? addProduct,
    TResult Function(UpdateQuantity value)? updateQuantity,
    TResult Function(RemoveFromCart value)? removeFromCart,
    TResult Function(ClearCart value)? clearCart,
    TResult Function(ScanItem value)? scanItem,
    TResult Function(SelectCustomer value)? selectCustomer,
    TResult Function(ApplyDiscount value)? applyDiscount,
    TResult Function(AddPromoCode value)? addPromoCode,
    TResult Function(CheckoutProcessed value)? checkoutProcessed,
    TResult Function(ParkOrder value)? parkOrder,
    TResult Function(SelectTable value)? selectTable,
    TResult Function(RetrieveOrder value)? retrieveOrder,
    TResult Function(CheckoutSplit value)? checkoutSplit,
    TResult Function(UpdateNote value)? updateNote,
    TResult Function(ToggleItemHold value)? toggleItemHold,
    TResult Function(FireItem value)? fireItem,
    required TResult orElse(),
  }) {
    if (updateNote != null) {
      return updateNote(this);
    }
    return orElse();
  }
}

abstract class UpdateNote implements CartEvent {
  const factory UpdateNote(final String productUuid, final String? note) =
      _$UpdateNoteImpl;

  String get productUuid;
  String? get note;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateNoteImplCopyWith<_$UpdateNoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleItemHoldImplCopyWith<$Res> {
  factory _$$ToggleItemHoldImplCopyWith(_$ToggleItemHoldImpl value,
          $Res Function(_$ToggleItemHoldImpl) then) =
      __$$ToggleItemHoldImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String itemUuid});
}

/// @nodoc
class __$$ToggleItemHoldImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$ToggleItemHoldImpl>
    implements _$$ToggleItemHoldImplCopyWith<$Res> {
  __$$ToggleItemHoldImplCopyWithImpl(
      _$ToggleItemHoldImpl _value, $Res Function(_$ToggleItemHoldImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemUuid = null,
  }) {
    return _then(_$ToggleItemHoldImpl(
      null == itemUuid
          ? _value.itemUuid
          : itemUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ToggleItemHoldImpl implements ToggleItemHold {
  const _$ToggleItemHoldImpl(this.itemUuid);

  @override
  final String itemUuid;

  @override
  String toString() {
    return 'CartEvent.toggleItemHold(itemUuid: $itemUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleItemHoldImpl &&
            (identical(other.itemUuid, itemUuid) ||
                other.itemUuid == itemUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemUuid);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleItemHoldImplCopyWith<_$ToggleItemHoldImpl> get copyWith =>
      __$$ToggleItemHoldImplCopyWithImpl<_$ToggleItemHoldImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Product product, List<ModifierItem> modifiers)
        addProduct,
    required TResult Function(String itemUuid, int quantity) updateQuantity,
    required TResult Function(String itemUuid) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(String barcode) scanItem,
    required TResult Function(Customer? customer) selectCustomer,
    required TResult Function(double? percent, double? fixed) applyDiscount,
    required TResult Function(String code) addPromoCode,
    required TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)
        checkoutProcessed,
    required TResult Function(String tableUuid) parkOrder,
    required TResult Function(String tableUuid) selectTable,
    required TResult Function(String orderUuid, String tableUuid) retrieveOrder,
    required TResult Function(List<String> itemUuids, String paymentMethod)
        checkoutSplit,
    required TResult Function(String productUuid, String? note) updateNote,
    required TResult Function(String itemUuid) toggleItemHold,
    required TResult Function(String itemUuid) fireItem,
  }) {
    return toggleItemHold(itemUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Product product, List<ModifierItem> modifiers)?
        addProduct,
    TResult? Function(String itemUuid, int quantity)? updateQuantity,
    TResult? Function(String itemUuid)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(String barcode)? scanItem,
    TResult? Function(Customer? customer)? selectCustomer,
    TResult? Function(double? percent, double? fixed)? applyDiscount,
    TResult? Function(String code)? addPromoCode,
    TResult? Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult? Function(String tableUuid)? parkOrder,
    TResult? Function(String tableUuid)? selectTable,
    TResult? Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult? Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult? Function(String productUuid, String? note)? updateNote,
    TResult? Function(String itemUuid)? toggleItemHold,
    TResult? Function(String itemUuid)? fireItem,
  }) {
    return toggleItemHold?.call(itemUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Product product, List<ModifierItem> modifiers)? addProduct,
    TResult Function(String itemUuid, int quantity)? updateQuantity,
    TResult Function(String itemUuid)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(String barcode)? scanItem,
    TResult Function(Customer? customer)? selectCustomer,
    TResult Function(double? percent, double? fixed)? applyDiscount,
    TResult Function(String code)? addPromoCode,
    TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult Function(String tableUuid)? parkOrder,
    TResult Function(String tableUuid)? selectTable,
    TResult Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult Function(String productUuid, String? note)? updateNote,
    TResult Function(String itemUuid)? toggleItemHold,
    TResult Function(String itemUuid)? fireItem,
    required TResult orElse(),
  }) {
    if (toggleItemHold != null) {
      return toggleItemHold(itemUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(UpdateQuantity value) updateQuantity,
    required TResult Function(RemoveFromCart value) removeFromCart,
    required TResult Function(ClearCart value) clearCart,
    required TResult Function(ScanItem value) scanItem,
    required TResult Function(SelectCustomer value) selectCustomer,
    required TResult Function(ApplyDiscount value) applyDiscount,
    required TResult Function(AddPromoCode value) addPromoCode,
    required TResult Function(CheckoutProcessed value) checkoutProcessed,
    required TResult Function(ParkOrder value) parkOrder,
    required TResult Function(SelectTable value) selectTable,
    required TResult Function(RetrieveOrder value) retrieveOrder,
    required TResult Function(CheckoutSplit value) checkoutSplit,
    required TResult Function(UpdateNote value) updateNote,
    required TResult Function(ToggleItemHold value) toggleItemHold,
    required TResult Function(FireItem value) fireItem,
  }) {
    return toggleItemHold(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddProduct value)? addProduct,
    TResult? Function(UpdateQuantity value)? updateQuantity,
    TResult? Function(RemoveFromCart value)? removeFromCart,
    TResult? Function(ClearCart value)? clearCart,
    TResult? Function(ScanItem value)? scanItem,
    TResult? Function(SelectCustomer value)? selectCustomer,
    TResult? Function(ApplyDiscount value)? applyDiscount,
    TResult? Function(AddPromoCode value)? addPromoCode,
    TResult? Function(CheckoutProcessed value)? checkoutProcessed,
    TResult? Function(ParkOrder value)? parkOrder,
    TResult? Function(SelectTable value)? selectTable,
    TResult? Function(RetrieveOrder value)? retrieveOrder,
    TResult? Function(CheckoutSplit value)? checkoutSplit,
    TResult? Function(UpdateNote value)? updateNote,
    TResult? Function(ToggleItemHold value)? toggleItemHold,
    TResult? Function(FireItem value)? fireItem,
  }) {
    return toggleItemHold?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddProduct value)? addProduct,
    TResult Function(UpdateQuantity value)? updateQuantity,
    TResult Function(RemoveFromCart value)? removeFromCart,
    TResult Function(ClearCart value)? clearCart,
    TResult Function(ScanItem value)? scanItem,
    TResult Function(SelectCustomer value)? selectCustomer,
    TResult Function(ApplyDiscount value)? applyDiscount,
    TResult Function(AddPromoCode value)? addPromoCode,
    TResult Function(CheckoutProcessed value)? checkoutProcessed,
    TResult Function(ParkOrder value)? parkOrder,
    TResult Function(SelectTable value)? selectTable,
    TResult Function(RetrieveOrder value)? retrieveOrder,
    TResult Function(CheckoutSplit value)? checkoutSplit,
    TResult Function(UpdateNote value)? updateNote,
    TResult Function(ToggleItemHold value)? toggleItemHold,
    TResult Function(FireItem value)? fireItem,
    required TResult orElse(),
  }) {
    if (toggleItemHold != null) {
      return toggleItemHold(this);
    }
    return orElse();
  }
}

abstract class ToggleItemHold implements CartEvent {
  const factory ToggleItemHold(final String itemUuid) = _$ToggleItemHoldImpl;

  String get itemUuid;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToggleItemHoldImplCopyWith<_$ToggleItemHoldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FireItemImplCopyWith<$Res> {
  factory _$$FireItemImplCopyWith(
          _$FireItemImpl value, $Res Function(_$FireItemImpl) then) =
      __$$FireItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String itemUuid});
}

/// @nodoc
class __$$FireItemImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$FireItemImpl>
    implements _$$FireItemImplCopyWith<$Res> {
  __$$FireItemImplCopyWithImpl(
      _$FireItemImpl _value, $Res Function(_$FireItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemUuid = null,
  }) {
    return _then(_$FireItemImpl(
      null == itemUuid
          ? _value.itemUuid
          : itemUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FireItemImpl implements FireItem {
  const _$FireItemImpl(this.itemUuid);

  @override
  final String itemUuid;

  @override
  String toString() {
    return 'CartEvent.fireItem(itemUuid: $itemUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FireItemImpl &&
            (identical(other.itemUuid, itemUuid) ||
                other.itemUuid == itemUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemUuid);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FireItemImplCopyWith<_$FireItemImpl> get copyWith =>
      __$$FireItemImplCopyWithImpl<_$FireItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Product product, List<ModifierItem> modifiers)
        addProduct,
    required TResult Function(String itemUuid, int quantity) updateQuantity,
    required TResult Function(String itemUuid) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(String barcode) scanItem,
    required TResult Function(Customer? customer) selectCustomer,
    required TResult Function(double? percent, double? fixed) applyDiscount,
    required TResult Function(String code) addPromoCode,
    required TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)
        checkoutProcessed,
    required TResult Function(String tableUuid) parkOrder,
    required TResult Function(String tableUuid) selectTable,
    required TResult Function(String orderUuid, String tableUuid) retrieveOrder,
    required TResult Function(List<String> itemUuids, String paymentMethod)
        checkoutSplit,
    required TResult Function(String productUuid, String? note) updateNote,
    required TResult Function(String itemUuid) toggleItemHold,
    required TResult Function(String itemUuid) fireItem,
  }) {
    return fireItem(itemUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Product product, List<ModifierItem> modifiers)?
        addProduct,
    TResult? Function(String itemUuid, int quantity)? updateQuantity,
    TResult? Function(String itemUuid)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(String barcode)? scanItem,
    TResult? Function(Customer? customer)? selectCustomer,
    TResult? Function(double? percent, double? fixed)? applyDiscount,
    TResult? Function(String code)? addPromoCode,
    TResult? Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult? Function(String tableUuid)? parkOrder,
    TResult? Function(String tableUuid)? selectTable,
    TResult? Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult? Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult? Function(String productUuid, String? note)? updateNote,
    TResult? Function(String itemUuid)? toggleItemHold,
    TResult? Function(String itemUuid)? fireItem,
  }) {
    return fireItem?.call(itemUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Product product, List<ModifierItem> modifiers)? addProduct,
    TResult Function(String itemUuid, int quantity)? updateQuantity,
    TResult Function(String itemUuid)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(String barcode)? scanItem,
    TResult Function(Customer? customer)? selectCustomer,
    TResult Function(double? percent, double? fixed)? applyDiscount,
    TResult Function(String code)? addPromoCode,
    TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    TResult Function(String tableUuid)? parkOrder,
    TResult Function(String tableUuid)? selectTable,
    TResult Function(String orderUuid, String tableUuid)? retrieveOrder,
    TResult Function(List<String> itemUuids, String paymentMethod)?
        checkoutSplit,
    TResult Function(String productUuid, String? note)? updateNote,
    TResult Function(String itemUuid)? toggleItemHold,
    TResult Function(String itemUuid)? fireItem,
    required TResult orElse(),
  }) {
    if (fireItem != null) {
      return fireItem(itemUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(UpdateQuantity value) updateQuantity,
    required TResult Function(RemoveFromCart value) removeFromCart,
    required TResult Function(ClearCart value) clearCart,
    required TResult Function(ScanItem value) scanItem,
    required TResult Function(SelectCustomer value) selectCustomer,
    required TResult Function(ApplyDiscount value) applyDiscount,
    required TResult Function(AddPromoCode value) addPromoCode,
    required TResult Function(CheckoutProcessed value) checkoutProcessed,
    required TResult Function(ParkOrder value) parkOrder,
    required TResult Function(SelectTable value) selectTable,
    required TResult Function(RetrieveOrder value) retrieveOrder,
    required TResult Function(CheckoutSplit value) checkoutSplit,
    required TResult Function(UpdateNote value) updateNote,
    required TResult Function(ToggleItemHold value) toggleItemHold,
    required TResult Function(FireItem value) fireItem,
  }) {
    return fireItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddProduct value)? addProduct,
    TResult? Function(UpdateQuantity value)? updateQuantity,
    TResult? Function(RemoveFromCart value)? removeFromCart,
    TResult? Function(ClearCart value)? clearCart,
    TResult? Function(ScanItem value)? scanItem,
    TResult? Function(SelectCustomer value)? selectCustomer,
    TResult? Function(ApplyDiscount value)? applyDiscount,
    TResult? Function(AddPromoCode value)? addPromoCode,
    TResult? Function(CheckoutProcessed value)? checkoutProcessed,
    TResult? Function(ParkOrder value)? parkOrder,
    TResult? Function(SelectTable value)? selectTable,
    TResult? Function(RetrieveOrder value)? retrieveOrder,
    TResult? Function(CheckoutSplit value)? checkoutSplit,
    TResult? Function(UpdateNote value)? updateNote,
    TResult? Function(ToggleItemHold value)? toggleItemHold,
    TResult? Function(FireItem value)? fireItem,
  }) {
    return fireItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddProduct value)? addProduct,
    TResult Function(UpdateQuantity value)? updateQuantity,
    TResult Function(RemoveFromCart value)? removeFromCart,
    TResult Function(ClearCart value)? clearCart,
    TResult Function(ScanItem value)? scanItem,
    TResult Function(SelectCustomer value)? selectCustomer,
    TResult Function(ApplyDiscount value)? applyDiscount,
    TResult Function(AddPromoCode value)? addPromoCode,
    TResult Function(CheckoutProcessed value)? checkoutProcessed,
    TResult Function(ParkOrder value)? parkOrder,
    TResult Function(SelectTable value)? selectTable,
    TResult Function(RetrieveOrder value)? retrieveOrder,
    TResult Function(CheckoutSplit value)? checkoutSplit,
    TResult Function(UpdateNote value)? updateNote,
    TResult Function(ToggleItemHold value)? toggleItemHold,
    TResult Function(FireItem value)? fireItem,
    required TResult orElse(),
  }) {
    if (fireItem != null) {
      return fireItem(this);
    }
    return orElse();
  }
}

abstract class FireItem implements CartEvent {
  const factory FireItem(final String itemUuid) = _$FireItemImpl;

  String get itemUuid;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FireItemImplCopyWith<_$FireItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
