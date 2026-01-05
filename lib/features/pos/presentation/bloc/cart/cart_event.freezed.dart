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
    required TResult Function(Product product) addProduct,
    required TResult Function(String productUuid, int quantity) updateQuantity,
    required TResult Function(String productUuid) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(Customer? customer) selectCustomer,
    required TResult Function(double? percent, double? fixed) applyDiscount,
    required TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)
        checkoutProcessed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Product product)? addProduct,
    TResult? Function(String productUuid, int quantity)? updateQuantity,
    TResult? Function(String productUuid)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(Customer? customer)? selectCustomer,
    TResult? Function(double? percent, double? fixed)? applyDiscount,
    TResult? Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Product product)? addProduct,
    TResult Function(String productUuid, int quantity)? updateQuantity,
    TResult Function(String productUuid)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(Customer? customer)? selectCustomer,
    TResult Function(double? percent, double? fixed)? applyDiscount,
    TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_ApplyDiscount value) applyDiscount,
    required TResult Function(_CheckoutProcessed value) checkoutProcessed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_ApplyDiscount value)? applyDiscount,
    TResult? Function(_CheckoutProcessed value)? checkoutProcessed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_ApplyDiscount value)? applyDiscount,
    TResult Function(_CheckoutProcessed value)? checkoutProcessed,
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
  $Res call({Product product});
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
  }) {
    return _then(_$AddProductImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc

class _$AddProductImpl implements _AddProduct {
  const _$AddProductImpl(this.product);

  @override
  final Product product;

  @override
  String toString() {
    return 'CartEvent.addProduct(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddProductImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

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
    required TResult Function(Product product) addProduct,
    required TResult Function(String productUuid, int quantity) updateQuantity,
    required TResult Function(String productUuid) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(Customer? customer) selectCustomer,
    required TResult Function(double? percent, double? fixed) applyDiscount,
    required TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)
        checkoutProcessed,
  }) {
    return addProduct(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Product product)? addProduct,
    TResult? Function(String productUuid, int quantity)? updateQuantity,
    TResult? Function(String productUuid)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(Customer? customer)? selectCustomer,
    TResult? Function(double? percent, double? fixed)? applyDiscount,
    TResult? Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
  }) {
    return addProduct?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Product product)? addProduct,
    TResult Function(String productUuid, int quantity)? updateQuantity,
    TResult Function(String productUuid)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(Customer? customer)? selectCustomer,
    TResult Function(double? percent, double? fixed)? applyDiscount,
    TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    required TResult orElse(),
  }) {
    if (addProduct != null) {
      return addProduct(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_ApplyDiscount value) applyDiscount,
    required TResult Function(_CheckoutProcessed value) checkoutProcessed,
  }) {
    return addProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_ApplyDiscount value)? applyDiscount,
    TResult? Function(_CheckoutProcessed value)? checkoutProcessed,
  }) {
    return addProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_ApplyDiscount value)? applyDiscount,
    TResult Function(_CheckoutProcessed value)? checkoutProcessed,
    required TResult orElse(),
  }) {
    if (addProduct != null) {
      return addProduct(this);
    }
    return orElse();
  }
}

abstract class _AddProduct implements CartEvent {
  const factory _AddProduct(final Product product) = _$AddProductImpl;

  Product get product;

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
  $Res call({String productUuid, int quantity});
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
    Object? productUuid = null,
    Object? quantity = null,
  }) {
    return _then(_$UpdateQuantityImpl(
      null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
      null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UpdateQuantityImpl implements _UpdateQuantity {
  const _$UpdateQuantityImpl(this.productUuid, this.quantity);

  @override
  final String productUuid;
  @override
  final int quantity;

  @override
  String toString() {
    return 'CartEvent.updateQuantity(productUuid: $productUuid, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateQuantityImpl &&
            (identical(other.productUuid, productUuid) ||
                other.productUuid == productUuid) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productUuid, quantity);

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
    required TResult Function(Product product) addProduct,
    required TResult Function(String productUuid, int quantity) updateQuantity,
    required TResult Function(String productUuid) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(Customer? customer) selectCustomer,
    required TResult Function(double? percent, double? fixed) applyDiscount,
    required TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)
        checkoutProcessed,
  }) {
    return updateQuantity(productUuid, quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Product product)? addProduct,
    TResult? Function(String productUuid, int quantity)? updateQuantity,
    TResult? Function(String productUuid)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(Customer? customer)? selectCustomer,
    TResult? Function(double? percent, double? fixed)? applyDiscount,
    TResult? Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
  }) {
    return updateQuantity?.call(productUuid, quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Product product)? addProduct,
    TResult Function(String productUuid, int quantity)? updateQuantity,
    TResult Function(String productUuid)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(Customer? customer)? selectCustomer,
    TResult Function(double? percent, double? fixed)? applyDiscount,
    TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    required TResult orElse(),
  }) {
    if (updateQuantity != null) {
      return updateQuantity(productUuid, quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_ApplyDiscount value) applyDiscount,
    required TResult Function(_CheckoutProcessed value) checkoutProcessed,
  }) {
    return updateQuantity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_ApplyDiscount value)? applyDiscount,
    TResult? Function(_CheckoutProcessed value)? checkoutProcessed,
  }) {
    return updateQuantity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_ApplyDiscount value)? applyDiscount,
    TResult Function(_CheckoutProcessed value)? checkoutProcessed,
    required TResult orElse(),
  }) {
    if (updateQuantity != null) {
      return updateQuantity(this);
    }
    return orElse();
  }
}

abstract class _UpdateQuantity implements CartEvent {
  const factory _UpdateQuantity(final String productUuid, final int quantity) =
      _$UpdateQuantityImpl;

  String get productUuid;
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
  $Res call({String productUuid});
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
    Object? productUuid = null,
  }) {
    return _then(_$RemoveFromCartImpl(
      null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoveFromCartImpl implements _RemoveFromCart {
  const _$RemoveFromCartImpl(this.productUuid);

  @override
  final String productUuid;

  @override
  String toString() {
    return 'CartEvent.removeFromCart(productUuid: $productUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFromCartImpl &&
            (identical(other.productUuid, productUuid) ||
                other.productUuid == productUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productUuid);

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
    required TResult Function(Product product) addProduct,
    required TResult Function(String productUuid, int quantity) updateQuantity,
    required TResult Function(String productUuid) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(Customer? customer) selectCustomer,
    required TResult Function(double? percent, double? fixed) applyDiscount,
    required TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)
        checkoutProcessed,
  }) {
    return removeFromCart(productUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Product product)? addProduct,
    TResult? Function(String productUuid, int quantity)? updateQuantity,
    TResult? Function(String productUuid)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(Customer? customer)? selectCustomer,
    TResult? Function(double? percent, double? fixed)? applyDiscount,
    TResult? Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
  }) {
    return removeFromCart?.call(productUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Product product)? addProduct,
    TResult Function(String productUuid, int quantity)? updateQuantity,
    TResult Function(String productUuid)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(Customer? customer)? selectCustomer,
    TResult Function(double? percent, double? fixed)? applyDiscount,
    TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
    required TResult orElse(),
  }) {
    if (removeFromCart != null) {
      return removeFromCart(productUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_ApplyDiscount value) applyDiscount,
    required TResult Function(_CheckoutProcessed value) checkoutProcessed,
  }) {
    return removeFromCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_ApplyDiscount value)? applyDiscount,
    TResult? Function(_CheckoutProcessed value)? checkoutProcessed,
  }) {
    return removeFromCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_ApplyDiscount value)? applyDiscount,
    TResult Function(_CheckoutProcessed value)? checkoutProcessed,
    required TResult orElse(),
  }) {
    if (removeFromCart != null) {
      return removeFromCart(this);
    }
    return orElse();
  }
}

abstract class _RemoveFromCart implements CartEvent {
  const factory _RemoveFromCart(final String productUuid) =
      _$RemoveFromCartImpl;

  String get productUuid;

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

class _$ClearCartImpl implements _ClearCart {
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
    required TResult Function(Product product) addProduct,
    required TResult Function(String productUuid, int quantity) updateQuantity,
    required TResult Function(String productUuid) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(Customer? customer) selectCustomer,
    required TResult Function(double? percent, double? fixed) applyDiscount,
    required TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)
        checkoutProcessed,
  }) {
    return clearCart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Product product)? addProduct,
    TResult? Function(String productUuid, int quantity)? updateQuantity,
    TResult? Function(String productUuid)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(Customer? customer)? selectCustomer,
    TResult? Function(double? percent, double? fixed)? applyDiscount,
    TResult? Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
  }) {
    return clearCart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Product product)? addProduct,
    TResult Function(String productUuid, int quantity)? updateQuantity,
    TResult Function(String productUuid)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(Customer? customer)? selectCustomer,
    TResult Function(double? percent, double? fixed)? applyDiscount,
    TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
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
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_ApplyDiscount value) applyDiscount,
    required TResult Function(_CheckoutProcessed value) checkoutProcessed,
  }) {
    return clearCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_ApplyDiscount value)? applyDiscount,
    TResult? Function(_CheckoutProcessed value)? checkoutProcessed,
  }) {
    return clearCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_ApplyDiscount value)? applyDiscount,
    TResult Function(_CheckoutProcessed value)? checkoutProcessed,
    required TResult orElse(),
  }) {
    if (clearCart != null) {
      return clearCart(this);
    }
    return orElse();
  }
}

abstract class _ClearCart implements CartEvent {
  const factory _ClearCart() = _$ClearCartImpl;
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

class _$SelectCustomerImpl implements _SelectCustomer {
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
    required TResult Function(Product product) addProduct,
    required TResult Function(String productUuid, int quantity) updateQuantity,
    required TResult Function(String productUuid) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(Customer? customer) selectCustomer,
    required TResult Function(double? percent, double? fixed) applyDiscount,
    required TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)
        checkoutProcessed,
  }) {
    return selectCustomer(customer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Product product)? addProduct,
    TResult? Function(String productUuid, int quantity)? updateQuantity,
    TResult? Function(String productUuid)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(Customer? customer)? selectCustomer,
    TResult? Function(double? percent, double? fixed)? applyDiscount,
    TResult? Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
  }) {
    return selectCustomer?.call(customer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Product product)? addProduct,
    TResult Function(String productUuid, int quantity)? updateQuantity,
    TResult Function(String productUuid)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(Customer? customer)? selectCustomer,
    TResult Function(double? percent, double? fixed)? applyDiscount,
    TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
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
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_ApplyDiscount value) applyDiscount,
    required TResult Function(_CheckoutProcessed value) checkoutProcessed,
  }) {
    return selectCustomer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_ApplyDiscount value)? applyDiscount,
    TResult? Function(_CheckoutProcessed value)? checkoutProcessed,
  }) {
    return selectCustomer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_ApplyDiscount value)? applyDiscount,
    TResult Function(_CheckoutProcessed value)? checkoutProcessed,
    required TResult orElse(),
  }) {
    if (selectCustomer != null) {
      return selectCustomer(this);
    }
    return orElse();
  }
}

abstract class _SelectCustomer implements CartEvent {
  const factory _SelectCustomer(final Customer? customer) =
      _$SelectCustomerImpl;

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

class _$ApplyDiscountImpl implements _ApplyDiscount {
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
    required TResult Function(Product product) addProduct,
    required TResult Function(String productUuid, int quantity) updateQuantity,
    required TResult Function(String productUuid) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(Customer? customer) selectCustomer,
    required TResult Function(double? percent, double? fixed) applyDiscount,
    required TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)
        checkoutProcessed,
  }) {
    return applyDiscount(percent, fixed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Product product)? addProduct,
    TResult? Function(String productUuid, int quantity)? updateQuantity,
    TResult? Function(String productUuid)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(Customer? customer)? selectCustomer,
    TResult? Function(double? percent, double? fixed)? applyDiscount,
    TResult? Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
  }) {
    return applyDiscount?.call(percent, fixed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Product product)? addProduct,
    TResult Function(String productUuid, int quantity)? updateQuantity,
    TResult Function(String productUuid)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(Customer? customer)? selectCustomer,
    TResult Function(double? percent, double? fixed)? applyDiscount,
    TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
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
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_ApplyDiscount value) applyDiscount,
    required TResult Function(_CheckoutProcessed value) checkoutProcessed,
  }) {
    return applyDiscount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_ApplyDiscount value)? applyDiscount,
    TResult? Function(_CheckoutProcessed value)? checkoutProcessed,
  }) {
    return applyDiscount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_ApplyDiscount value)? applyDiscount,
    TResult Function(_CheckoutProcessed value)? checkoutProcessed,
    required TResult orElse(),
  }) {
    if (applyDiscount != null) {
      return applyDiscount(this);
    }
    return orElse();
  }
}

abstract class _ApplyDiscount implements CartEvent {
  const factory _ApplyDiscount({final double? percent, final double? fixed}) =
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

class _$CheckoutProcessedImpl implements _CheckoutProcessed {
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
    required TResult Function(Product product) addProduct,
    required TResult Function(String productUuid, int quantity) updateQuantity,
    required TResult Function(String productUuid) removeFromCart,
    required TResult Function() clearCart,
    required TResult Function(Customer? customer) selectCustomer,
    required TResult Function(double? percent, double? fixed) applyDiscount,
    required TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)
        checkoutProcessed,
  }) {
    return checkoutProcessed(paymentMethod, tenderedAmount, changeAmount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Product product)? addProduct,
    TResult? Function(String productUuid, int quantity)? updateQuantity,
    TResult? Function(String productUuid)? removeFromCart,
    TResult? Function()? clearCart,
    TResult? Function(Customer? customer)? selectCustomer,
    TResult? Function(double? percent, double? fixed)? applyDiscount,
    TResult? Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
  }) {
    return checkoutProcessed?.call(paymentMethod, tenderedAmount, changeAmount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Product product)? addProduct,
    TResult Function(String productUuid, int quantity)? updateQuantity,
    TResult Function(String productUuid)? removeFromCart,
    TResult Function()? clearCart,
    TResult Function(Customer? customer)? selectCustomer,
    TResult Function(double? percent, double? fixed)? applyDiscount,
    TResult Function(
            String paymentMethod, double? tenderedAmount, double? changeAmount)?
        checkoutProcessed,
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
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_SelectCustomer value) selectCustomer,
    required TResult Function(_ApplyDiscount value) applyDiscount,
    required TResult Function(_CheckoutProcessed value) checkoutProcessed,
  }) {
    return checkoutProcessed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_SelectCustomer value)? selectCustomer,
    TResult? Function(_ApplyDiscount value)? applyDiscount,
    TResult? Function(_CheckoutProcessed value)? checkoutProcessed,
  }) {
    return checkoutProcessed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_SelectCustomer value)? selectCustomer,
    TResult Function(_ApplyDiscount value)? applyDiscount,
    TResult Function(_CheckoutProcessed value)? checkoutProcessed,
    required TResult orElse(),
  }) {
    if (checkoutProcessed != null) {
      return checkoutProcessed(this);
    }
    return orElse();
  }
}

abstract class _CheckoutProcessed implements CartEvent {
  const factory _CheckoutProcessed(
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
