// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SalesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String? categoryId) categorySelected,
    required TResult Function(String query) searchQueryChanged,
    required TResult Function(Product product) selectProduct,
    required TResult Function(Product product, int? quantity,
            List<String>? modifiers, String? note)
        addToCart,
    required TResult Function(String cartItemId) removeFromCart,
    required TResult Function(String cartItemId, int quantity) updateQuantity,
    required TResult Function() clearCart,
    required TResult Function(String? tableUuid, String? customerUuid)
        createOrder,
    required TResult Function(List<Category> categories) categoriesUpdated,
    required TResult Function(List<Product> products) productsUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String? categoryId)? categorySelected,
    TResult? Function(String query)? searchQueryChanged,
    TResult? Function(Product product)? selectProduct,
    TResult? Function(Product product, int? quantity, List<String>? modifiers,
            String? note)?
        addToCart,
    TResult? Function(String cartItemId)? removeFromCart,
    TResult? Function(String cartItemId, int quantity)? updateQuantity,
    TResult? Function()? clearCart,
    TResult? Function(String? tableUuid, String? customerUuid)? createOrder,
    TResult? Function(List<Category> categories)? categoriesUpdated,
    TResult? Function(List<Product> products)? productsUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? categoryId)? categorySelected,
    TResult Function(String query)? searchQueryChanged,
    TResult Function(Product product)? selectProduct,
    TResult Function(Product product, int? quantity, List<String>? modifiers,
            String? note)?
        addToCart,
    TResult Function(String cartItemId)? removeFromCart,
    TResult Function(String cartItemId, int quantity)? updateQuantity,
    TResult Function()? clearCart,
    TResult Function(String? tableUuid, String? customerUuid)? createOrder,
    TResult Function(List<Category> categories)? categoriesUpdated,
    TResult Function(List<Product> products)? productsUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CategorySelected value) categorySelected,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_SelectProduct value) selectProduct,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_CreateOrder value) createOrder,
    required TResult Function(_CategoriesUpdated value) categoriesUpdated,
    required TResult Function(_ProductsUpdated value) productsUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CategorySelected value)? categorySelected,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_SelectProduct value)? selectProduct,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_CreateOrder value)? createOrder,
    TResult? Function(_CategoriesUpdated value)? categoriesUpdated,
    TResult? Function(_ProductsUpdated value)? productsUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CategorySelected value)? categorySelected,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_SelectProduct value)? selectProduct,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_CreateOrder value)? createOrder,
    TResult Function(_CategoriesUpdated value)? categoriesUpdated,
    TResult Function(_ProductsUpdated value)? productsUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesEventCopyWith<$Res> {
  factory $SalesEventCopyWith(
          SalesEvent value, $Res Function(SalesEvent) then) =
      _$SalesEventCopyWithImpl<$Res, SalesEvent>;
}

/// @nodoc
class _$SalesEventCopyWithImpl<$Res, $Val extends SalesEvent>
    implements $SalesEventCopyWith<$Res> {
  _$SalesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$SalesEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'SalesEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String? categoryId) categorySelected,
    required TResult Function(String query) searchQueryChanged,
    required TResult Function(Product product) selectProduct,
    required TResult Function(Product product, int? quantity,
            List<String>? modifiers, String? note)
        addToCart,
    required TResult Function(String cartItemId) removeFromCart,
    required TResult Function(String cartItemId, int quantity) updateQuantity,
    required TResult Function() clearCart,
    required TResult Function(String? tableUuid, String? customerUuid)
        createOrder,
    required TResult Function(List<Category> categories) categoriesUpdated,
    required TResult Function(List<Product> products) productsUpdated,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String? categoryId)? categorySelected,
    TResult? Function(String query)? searchQueryChanged,
    TResult? Function(Product product)? selectProduct,
    TResult? Function(Product product, int? quantity, List<String>? modifiers,
            String? note)?
        addToCart,
    TResult? Function(String cartItemId)? removeFromCart,
    TResult? Function(String cartItemId, int quantity)? updateQuantity,
    TResult? Function()? clearCart,
    TResult? Function(String? tableUuid, String? customerUuid)? createOrder,
    TResult? Function(List<Category> categories)? categoriesUpdated,
    TResult? Function(List<Product> products)? productsUpdated,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? categoryId)? categorySelected,
    TResult Function(String query)? searchQueryChanged,
    TResult Function(Product product)? selectProduct,
    TResult Function(Product product, int? quantity, List<String>? modifiers,
            String? note)?
        addToCart,
    TResult Function(String cartItemId)? removeFromCart,
    TResult Function(String cartItemId, int quantity)? updateQuantity,
    TResult Function()? clearCart,
    TResult Function(String? tableUuid, String? customerUuid)? createOrder,
    TResult Function(List<Category> categories)? categoriesUpdated,
    TResult Function(List<Product> products)? productsUpdated,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CategorySelected value) categorySelected,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_SelectProduct value) selectProduct,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_CreateOrder value) createOrder,
    required TResult Function(_CategoriesUpdated value) categoriesUpdated,
    required TResult Function(_ProductsUpdated value) productsUpdated,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CategorySelected value)? categorySelected,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_SelectProduct value)? selectProduct,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_CreateOrder value)? createOrder,
    TResult? Function(_CategoriesUpdated value)? categoriesUpdated,
    TResult? Function(_ProductsUpdated value)? productsUpdated,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CategorySelected value)? categorySelected,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_SelectProduct value)? selectProduct,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_CreateOrder value)? createOrder,
    TResult Function(_CategoriesUpdated value)? categoriesUpdated,
    TResult Function(_ProductsUpdated value)? productsUpdated,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SalesEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$CategorySelectedImplCopyWith<$Res> {
  factory _$$CategorySelectedImplCopyWith(_$CategorySelectedImpl value,
          $Res Function(_$CategorySelectedImpl) then) =
      __$$CategorySelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? categoryId});
}

/// @nodoc
class __$$CategorySelectedImplCopyWithImpl<$Res>
    extends _$SalesEventCopyWithImpl<$Res, _$CategorySelectedImpl>
    implements _$$CategorySelectedImplCopyWith<$Res> {
  __$$CategorySelectedImplCopyWithImpl(_$CategorySelectedImpl _value,
      $Res Function(_$CategorySelectedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
  }) {
    return _then(_$CategorySelectedImpl(
      freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CategorySelectedImpl implements _CategorySelected {
  const _$CategorySelectedImpl(this.categoryId);

  @override
  final String? categoryId;

  @override
  String toString() {
    return 'SalesEvent.categorySelected(categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategorySelectedImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId);

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategorySelectedImplCopyWith<_$CategorySelectedImpl> get copyWith =>
      __$$CategorySelectedImplCopyWithImpl<_$CategorySelectedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String? categoryId) categorySelected,
    required TResult Function(String query) searchQueryChanged,
    required TResult Function(Product product) selectProduct,
    required TResult Function(Product product, int? quantity,
            List<String>? modifiers, String? note)
        addToCart,
    required TResult Function(String cartItemId) removeFromCart,
    required TResult Function(String cartItemId, int quantity) updateQuantity,
    required TResult Function() clearCart,
    required TResult Function(String? tableUuid, String? customerUuid)
        createOrder,
    required TResult Function(List<Category> categories) categoriesUpdated,
    required TResult Function(List<Product> products) productsUpdated,
  }) {
    return categorySelected(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String? categoryId)? categorySelected,
    TResult? Function(String query)? searchQueryChanged,
    TResult? Function(Product product)? selectProduct,
    TResult? Function(Product product, int? quantity, List<String>? modifiers,
            String? note)?
        addToCart,
    TResult? Function(String cartItemId)? removeFromCart,
    TResult? Function(String cartItemId, int quantity)? updateQuantity,
    TResult? Function()? clearCart,
    TResult? Function(String? tableUuid, String? customerUuid)? createOrder,
    TResult? Function(List<Category> categories)? categoriesUpdated,
    TResult? Function(List<Product> products)? productsUpdated,
  }) {
    return categorySelected?.call(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? categoryId)? categorySelected,
    TResult Function(String query)? searchQueryChanged,
    TResult Function(Product product)? selectProduct,
    TResult Function(Product product, int? quantity, List<String>? modifiers,
            String? note)?
        addToCart,
    TResult Function(String cartItemId)? removeFromCart,
    TResult Function(String cartItemId, int quantity)? updateQuantity,
    TResult Function()? clearCart,
    TResult Function(String? tableUuid, String? customerUuid)? createOrder,
    TResult Function(List<Category> categories)? categoriesUpdated,
    TResult Function(List<Product> products)? productsUpdated,
    required TResult orElse(),
  }) {
    if (categorySelected != null) {
      return categorySelected(categoryId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CategorySelected value) categorySelected,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_SelectProduct value) selectProduct,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_CreateOrder value) createOrder,
    required TResult Function(_CategoriesUpdated value) categoriesUpdated,
    required TResult Function(_ProductsUpdated value) productsUpdated,
  }) {
    return categorySelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CategorySelected value)? categorySelected,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_SelectProduct value)? selectProduct,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_CreateOrder value)? createOrder,
    TResult? Function(_CategoriesUpdated value)? categoriesUpdated,
    TResult? Function(_ProductsUpdated value)? productsUpdated,
  }) {
    return categorySelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CategorySelected value)? categorySelected,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_SelectProduct value)? selectProduct,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_CreateOrder value)? createOrder,
    TResult Function(_CategoriesUpdated value)? categoriesUpdated,
    TResult Function(_ProductsUpdated value)? productsUpdated,
    required TResult orElse(),
  }) {
    if (categorySelected != null) {
      return categorySelected(this);
    }
    return orElse();
  }
}

abstract class _CategorySelected implements SalesEvent {
  const factory _CategorySelected(final String? categoryId) =
      _$CategorySelectedImpl;

  String? get categoryId;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategorySelectedImplCopyWith<_$CategorySelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchQueryChangedImplCopyWith<$Res> {
  factory _$$SearchQueryChangedImplCopyWith(_$SearchQueryChangedImpl value,
          $Res Function(_$SearchQueryChangedImpl) then) =
      __$$SearchQueryChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchQueryChangedImplCopyWithImpl<$Res>
    extends _$SalesEventCopyWithImpl<$Res, _$SearchQueryChangedImpl>
    implements _$$SearchQueryChangedImplCopyWith<$Res> {
  __$$SearchQueryChangedImplCopyWithImpl(_$SearchQueryChangedImpl _value,
      $Res Function(_$SearchQueryChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchQueryChangedImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchQueryChangedImpl implements _SearchQueryChanged {
  const _$SearchQueryChangedImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'SalesEvent.searchQueryChanged(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchQueryChangedImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchQueryChangedImplCopyWith<_$SearchQueryChangedImpl> get copyWith =>
      __$$SearchQueryChangedImplCopyWithImpl<_$SearchQueryChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String? categoryId) categorySelected,
    required TResult Function(String query) searchQueryChanged,
    required TResult Function(Product product) selectProduct,
    required TResult Function(Product product, int? quantity,
            List<String>? modifiers, String? note)
        addToCart,
    required TResult Function(String cartItemId) removeFromCart,
    required TResult Function(String cartItemId, int quantity) updateQuantity,
    required TResult Function() clearCart,
    required TResult Function(String? tableUuid, String? customerUuid)
        createOrder,
    required TResult Function(List<Category> categories) categoriesUpdated,
    required TResult Function(List<Product> products) productsUpdated,
  }) {
    return searchQueryChanged(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String? categoryId)? categorySelected,
    TResult? Function(String query)? searchQueryChanged,
    TResult? Function(Product product)? selectProduct,
    TResult? Function(Product product, int? quantity, List<String>? modifiers,
            String? note)?
        addToCart,
    TResult? Function(String cartItemId)? removeFromCart,
    TResult? Function(String cartItemId, int quantity)? updateQuantity,
    TResult? Function()? clearCart,
    TResult? Function(String? tableUuid, String? customerUuid)? createOrder,
    TResult? Function(List<Category> categories)? categoriesUpdated,
    TResult? Function(List<Product> products)? productsUpdated,
  }) {
    return searchQueryChanged?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? categoryId)? categorySelected,
    TResult Function(String query)? searchQueryChanged,
    TResult Function(Product product)? selectProduct,
    TResult Function(Product product, int? quantity, List<String>? modifiers,
            String? note)?
        addToCart,
    TResult Function(String cartItemId)? removeFromCart,
    TResult Function(String cartItemId, int quantity)? updateQuantity,
    TResult Function()? clearCart,
    TResult Function(String? tableUuid, String? customerUuid)? createOrder,
    TResult Function(List<Category> categories)? categoriesUpdated,
    TResult Function(List<Product> products)? productsUpdated,
    required TResult orElse(),
  }) {
    if (searchQueryChanged != null) {
      return searchQueryChanged(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CategorySelected value) categorySelected,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_SelectProduct value) selectProduct,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_CreateOrder value) createOrder,
    required TResult Function(_CategoriesUpdated value) categoriesUpdated,
    required TResult Function(_ProductsUpdated value) productsUpdated,
  }) {
    return searchQueryChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CategorySelected value)? categorySelected,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_SelectProduct value)? selectProduct,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_CreateOrder value)? createOrder,
    TResult? Function(_CategoriesUpdated value)? categoriesUpdated,
    TResult? Function(_ProductsUpdated value)? productsUpdated,
  }) {
    return searchQueryChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CategorySelected value)? categorySelected,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_SelectProduct value)? selectProduct,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_CreateOrder value)? createOrder,
    TResult Function(_CategoriesUpdated value)? categoriesUpdated,
    TResult Function(_ProductsUpdated value)? productsUpdated,
    required TResult orElse(),
  }) {
    if (searchQueryChanged != null) {
      return searchQueryChanged(this);
    }
    return orElse();
  }
}

abstract class _SearchQueryChanged implements SalesEvent {
  const factory _SearchQueryChanged(final String query) =
      _$SearchQueryChangedImpl;

  String get query;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchQueryChangedImplCopyWith<_$SearchQueryChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectProductImplCopyWith<$Res> {
  factory _$$SelectProductImplCopyWith(
          _$SelectProductImpl value, $Res Function(_$SelectProductImpl) then) =
      __$$SelectProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product});
}

/// @nodoc
class __$$SelectProductImplCopyWithImpl<$Res>
    extends _$SalesEventCopyWithImpl<$Res, _$SelectProductImpl>
    implements _$$SelectProductImplCopyWith<$Res> {
  __$$SelectProductImplCopyWithImpl(
      _$SelectProductImpl _value, $Res Function(_$SelectProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$SelectProductImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc

class _$SelectProductImpl implements _SelectProduct {
  const _$SelectProductImpl(this.product);

  @override
  final Product product;

  @override
  String toString() {
    return 'SalesEvent.selectProduct(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectProductImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectProductImplCopyWith<_$SelectProductImpl> get copyWith =>
      __$$SelectProductImplCopyWithImpl<_$SelectProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String? categoryId) categorySelected,
    required TResult Function(String query) searchQueryChanged,
    required TResult Function(Product product) selectProduct,
    required TResult Function(Product product, int? quantity,
            List<String>? modifiers, String? note)
        addToCart,
    required TResult Function(String cartItemId) removeFromCart,
    required TResult Function(String cartItemId, int quantity) updateQuantity,
    required TResult Function() clearCart,
    required TResult Function(String? tableUuid, String? customerUuid)
        createOrder,
    required TResult Function(List<Category> categories) categoriesUpdated,
    required TResult Function(List<Product> products) productsUpdated,
  }) {
    return selectProduct(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String? categoryId)? categorySelected,
    TResult? Function(String query)? searchQueryChanged,
    TResult? Function(Product product)? selectProduct,
    TResult? Function(Product product, int? quantity, List<String>? modifiers,
            String? note)?
        addToCart,
    TResult? Function(String cartItemId)? removeFromCart,
    TResult? Function(String cartItemId, int quantity)? updateQuantity,
    TResult? Function()? clearCart,
    TResult? Function(String? tableUuid, String? customerUuid)? createOrder,
    TResult? Function(List<Category> categories)? categoriesUpdated,
    TResult? Function(List<Product> products)? productsUpdated,
  }) {
    return selectProduct?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? categoryId)? categorySelected,
    TResult Function(String query)? searchQueryChanged,
    TResult Function(Product product)? selectProduct,
    TResult Function(Product product, int? quantity, List<String>? modifiers,
            String? note)?
        addToCart,
    TResult Function(String cartItemId)? removeFromCart,
    TResult Function(String cartItemId, int quantity)? updateQuantity,
    TResult Function()? clearCart,
    TResult Function(String? tableUuid, String? customerUuid)? createOrder,
    TResult Function(List<Category> categories)? categoriesUpdated,
    TResult Function(List<Product> products)? productsUpdated,
    required TResult orElse(),
  }) {
    if (selectProduct != null) {
      return selectProduct(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CategorySelected value) categorySelected,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_SelectProduct value) selectProduct,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_CreateOrder value) createOrder,
    required TResult Function(_CategoriesUpdated value) categoriesUpdated,
    required TResult Function(_ProductsUpdated value) productsUpdated,
  }) {
    return selectProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CategorySelected value)? categorySelected,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_SelectProduct value)? selectProduct,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_CreateOrder value)? createOrder,
    TResult? Function(_CategoriesUpdated value)? categoriesUpdated,
    TResult? Function(_ProductsUpdated value)? productsUpdated,
  }) {
    return selectProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CategorySelected value)? categorySelected,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_SelectProduct value)? selectProduct,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_CreateOrder value)? createOrder,
    TResult Function(_CategoriesUpdated value)? categoriesUpdated,
    TResult Function(_ProductsUpdated value)? productsUpdated,
    required TResult orElse(),
  }) {
    if (selectProduct != null) {
      return selectProduct(this);
    }
    return orElse();
  }
}

abstract class _SelectProduct implements SalesEvent {
  const factory _SelectProduct(final Product product) = _$SelectProductImpl;

  Product get product;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectProductImplCopyWith<_$SelectProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddToCartImplCopyWith<$Res> {
  factory _$$AddToCartImplCopyWith(
          _$AddToCartImpl value, $Res Function(_$AddToCartImpl) then) =
      __$$AddToCartImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Product product, int? quantity, List<String>? modifiers, String? note});
}

/// @nodoc
class __$$AddToCartImplCopyWithImpl<$Res>
    extends _$SalesEventCopyWithImpl<$Res, _$AddToCartImpl>
    implements _$$AddToCartImplCopyWith<$Res> {
  __$$AddToCartImplCopyWithImpl(
      _$AddToCartImpl _value, $Res Function(_$AddToCartImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = freezed,
    Object? modifiers = freezed,
    Object? note = freezed,
  }) {
    return _then(_$AddToCartImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      modifiers: freezed == modifiers
          ? _value._modifiers
          : modifiers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AddToCartImpl implements _AddToCart {
  const _$AddToCartImpl(this.product,
      {this.quantity, final List<String>? modifiers, this.note})
      : _modifiers = modifiers;

  @override
  final Product product;
  @override
  final int? quantity;
  final List<String>? _modifiers;
  @override
  List<String>? get modifiers {
    final value = _modifiers;
    if (value == null) return null;
    if (_modifiers is EqualUnmodifiableListView) return _modifiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? note;

  @override
  String toString() {
    return 'SalesEvent.addToCart(product: $product, quantity: $quantity, modifiers: $modifiers, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddToCartImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            const DeepCollectionEquality()
                .equals(other._modifiers, _modifiers) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product, quantity,
      const DeepCollectionEquality().hash(_modifiers), note);

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddToCartImplCopyWith<_$AddToCartImpl> get copyWith =>
      __$$AddToCartImplCopyWithImpl<_$AddToCartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String? categoryId) categorySelected,
    required TResult Function(String query) searchQueryChanged,
    required TResult Function(Product product) selectProduct,
    required TResult Function(Product product, int? quantity,
            List<String>? modifiers, String? note)
        addToCart,
    required TResult Function(String cartItemId) removeFromCart,
    required TResult Function(String cartItemId, int quantity) updateQuantity,
    required TResult Function() clearCart,
    required TResult Function(String? tableUuid, String? customerUuid)
        createOrder,
    required TResult Function(List<Category> categories) categoriesUpdated,
    required TResult Function(List<Product> products) productsUpdated,
  }) {
    return addToCart(product, quantity, modifiers, note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String? categoryId)? categorySelected,
    TResult? Function(String query)? searchQueryChanged,
    TResult? Function(Product product)? selectProduct,
    TResult? Function(Product product, int? quantity, List<String>? modifiers,
            String? note)?
        addToCart,
    TResult? Function(String cartItemId)? removeFromCart,
    TResult? Function(String cartItemId, int quantity)? updateQuantity,
    TResult? Function()? clearCart,
    TResult? Function(String? tableUuid, String? customerUuid)? createOrder,
    TResult? Function(List<Category> categories)? categoriesUpdated,
    TResult? Function(List<Product> products)? productsUpdated,
  }) {
    return addToCart?.call(product, quantity, modifiers, note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? categoryId)? categorySelected,
    TResult Function(String query)? searchQueryChanged,
    TResult Function(Product product)? selectProduct,
    TResult Function(Product product, int? quantity, List<String>? modifiers,
            String? note)?
        addToCart,
    TResult Function(String cartItemId)? removeFromCart,
    TResult Function(String cartItemId, int quantity)? updateQuantity,
    TResult Function()? clearCart,
    TResult Function(String? tableUuid, String? customerUuid)? createOrder,
    TResult Function(List<Category> categories)? categoriesUpdated,
    TResult Function(List<Product> products)? productsUpdated,
    required TResult orElse(),
  }) {
    if (addToCart != null) {
      return addToCart(product, quantity, modifiers, note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CategorySelected value) categorySelected,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_SelectProduct value) selectProduct,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_CreateOrder value) createOrder,
    required TResult Function(_CategoriesUpdated value) categoriesUpdated,
    required TResult Function(_ProductsUpdated value) productsUpdated,
  }) {
    return addToCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CategorySelected value)? categorySelected,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_SelectProduct value)? selectProduct,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_CreateOrder value)? createOrder,
    TResult? Function(_CategoriesUpdated value)? categoriesUpdated,
    TResult? Function(_ProductsUpdated value)? productsUpdated,
  }) {
    return addToCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CategorySelected value)? categorySelected,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_SelectProduct value)? selectProduct,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_CreateOrder value)? createOrder,
    TResult Function(_CategoriesUpdated value)? categoriesUpdated,
    TResult Function(_ProductsUpdated value)? productsUpdated,
    required TResult orElse(),
  }) {
    if (addToCart != null) {
      return addToCart(this);
    }
    return orElse();
  }
}

abstract class _AddToCart implements SalesEvent {
  const factory _AddToCart(final Product product,
      {final int? quantity,
      final List<String>? modifiers,
      final String? note}) = _$AddToCartImpl;

  Product get product;
  int? get quantity;
  List<String>? get modifiers;
  String? get note;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddToCartImplCopyWith<_$AddToCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveFromCartImplCopyWith<$Res> {
  factory _$$RemoveFromCartImplCopyWith(_$RemoveFromCartImpl value,
          $Res Function(_$RemoveFromCartImpl) then) =
      __$$RemoveFromCartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cartItemId});
}

/// @nodoc
class __$$RemoveFromCartImplCopyWithImpl<$Res>
    extends _$SalesEventCopyWithImpl<$Res, _$RemoveFromCartImpl>
    implements _$$RemoveFromCartImplCopyWith<$Res> {
  __$$RemoveFromCartImplCopyWithImpl(
      _$RemoveFromCartImpl _value, $Res Function(_$RemoveFromCartImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItemId = null,
  }) {
    return _then(_$RemoveFromCartImpl(
      null == cartItemId
          ? _value.cartItemId
          : cartItemId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoveFromCartImpl implements _RemoveFromCart {
  const _$RemoveFromCartImpl(this.cartItemId);

  @override
  final String cartItemId;

  @override
  String toString() {
    return 'SalesEvent.removeFromCart(cartItemId: $cartItemId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFromCartImpl &&
            (identical(other.cartItemId, cartItemId) ||
                other.cartItemId == cartItemId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cartItemId);

  /// Create a copy of SalesEvent
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
    required TResult Function() started,
    required TResult Function(String? categoryId) categorySelected,
    required TResult Function(String query) searchQueryChanged,
    required TResult Function(Product product) selectProduct,
    required TResult Function(Product product, int? quantity,
            List<String>? modifiers, String? note)
        addToCart,
    required TResult Function(String cartItemId) removeFromCart,
    required TResult Function(String cartItemId, int quantity) updateQuantity,
    required TResult Function() clearCart,
    required TResult Function(String? tableUuid, String? customerUuid)
        createOrder,
    required TResult Function(List<Category> categories) categoriesUpdated,
    required TResult Function(List<Product> products) productsUpdated,
  }) {
    return removeFromCart(cartItemId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String? categoryId)? categorySelected,
    TResult? Function(String query)? searchQueryChanged,
    TResult? Function(Product product)? selectProduct,
    TResult? Function(Product product, int? quantity, List<String>? modifiers,
            String? note)?
        addToCart,
    TResult? Function(String cartItemId)? removeFromCart,
    TResult? Function(String cartItemId, int quantity)? updateQuantity,
    TResult? Function()? clearCart,
    TResult? Function(String? tableUuid, String? customerUuid)? createOrder,
    TResult? Function(List<Category> categories)? categoriesUpdated,
    TResult? Function(List<Product> products)? productsUpdated,
  }) {
    return removeFromCart?.call(cartItemId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? categoryId)? categorySelected,
    TResult Function(String query)? searchQueryChanged,
    TResult Function(Product product)? selectProduct,
    TResult Function(Product product, int? quantity, List<String>? modifiers,
            String? note)?
        addToCart,
    TResult Function(String cartItemId)? removeFromCart,
    TResult Function(String cartItemId, int quantity)? updateQuantity,
    TResult Function()? clearCart,
    TResult Function(String? tableUuid, String? customerUuid)? createOrder,
    TResult Function(List<Category> categories)? categoriesUpdated,
    TResult Function(List<Product> products)? productsUpdated,
    required TResult orElse(),
  }) {
    if (removeFromCart != null) {
      return removeFromCart(cartItemId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CategorySelected value) categorySelected,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_SelectProduct value) selectProduct,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_CreateOrder value) createOrder,
    required TResult Function(_CategoriesUpdated value) categoriesUpdated,
    required TResult Function(_ProductsUpdated value) productsUpdated,
  }) {
    return removeFromCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CategorySelected value)? categorySelected,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_SelectProduct value)? selectProduct,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_CreateOrder value)? createOrder,
    TResult? Function(_CategoriesUpdated value)? categoriesUpdated,
    TResult? Function(_ProductsUpdated value)? productsUpdated,
  }) {
    return removeFromCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CategorySelected value)? categorySelected,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_SelectProduct value)? selectProduct,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_CreateOrder value)? createOrder,
    TResult Function(_CategoriesUpdated value)? categoriesUpdated,
    TResult Function(_ProductsUpdated value)? productsUpdated,
    required TResult orElse(),
  }) {
    if (removeFromCart != null) {
      return removeFromCart(this);
    }
    return orElse();
  }
}

abstract class _RemoveFromCart implements SalesEvent {
  const factory _RemoveFromCart(final String cartItemId) = _$RemoveFromCartImpl;

  String get cartItemId;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveFromCartImplCopyWith<_$RemoveFromCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateQuantityImplCopyWith<$Res> {
  factory _$$UpdateQuantityImplCopyWith(_$UpdateQuantityImpl value,
          $Res Function(_$UpdateQuantityImpl) then) =
      __$$UpdateQuantityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cartItemId, int quantity});
}

/// @nodoc
class __$$UpdateQuantityImplCopyWithImpl<$Res>
    extends _$SalesEventCopyWithImpl<$Res, _$UpdateQuantityImpl>
    implements _$$UpdateQuantityImplCopyWith<$Res> {
  __$$UpdateQuantityImplCopyWithImpl(
      _$UpdateQuantityImpl _value, $Res Function(_$UpdateQuantityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItemId = null,
    Object? quantity = null,
  }) {
    return _then(_$UpdateQuantityImpl(
      null == cartItemId
          ? _value.cartItemId
          : cartItemId // ignore: cast_nullable_to_non_nullable
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
  const _$UpdateQuantityImpl(this.cartItemId, this.quantity);

  @override
  final String cartItemId;
  @override
  final int quantity;

  @override
  String toString() {
    return 'SalesEvent.updateQuantity(cartItemId: $cartItemId, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateQuantityImpl &&
            (identical(other.cartItemId, cartItemId) ||
                other.cartItemId == cartItemId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cartItemId, quantity);

  /// Create a copy of SalesEvent
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
    required TResult Function() started,
    required TResult Function(String? categoryId) categorySelected,
    required TResult Function(String query) searchQueryChanged,
    required TResult Function(Product product) selectProduct,
    required TResult Function(Product product, int? quantity,
            List<String>? modifiers, String? note)
        addToCart,
    required TResult Function(String cartItemId) removeFromCart,
    required TResult Function(String cartItemId, int quantity) updateQuantity,
    required TResult Function() clearCart,
    required TResult Function(String? tableUuid, String? customerUuid)
        createOrder,
    required TResult Function(List<Category> categories) categoriesUpdated,
    required TResult Function(List<Product> products) productsUpdated,
  }) {
    return updateQuantity(cartItemId, quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String? categoryId)? categorySelected,
    TResult? Function(String query)? searchQueryChanged,
    TResult? Function(Product product)? selectProduct,
    TResult? Function(Product product, int? quantity, List<String>? modifiers,
            String? note)?
        addToCart,
    TResult? Function(String cartItemId)? removeFromCart,
    TResult? Function(String cartItemId, int quantity)? updateQuantity,
    TResult? Function()? clearCart,
    TResult? Function(String? tableUuid, String? customerUuid)? createOrder,
    TResult? Function(List<Category> categories)? categoriesUpdated,
    TResult? Function(List<Product> products)? productsUpdated,
  }) {
    return updateQuantity?.call(cartItemId, quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? categoryId)? categorySelected,
    TResult Function(String query)? searchQueryChanged,
    TResult Function(Product product)? selectProduct,
    TResult Function(Product product, int? quantity, List<String>? modifiers,
            String? note)?
        addToCart,
    TResult Function(String cartItemId)? removeFromCart,
    TResult Function(String cartItemId, int quantity)? updateQuantity,
    TResult Function()? clearCart,
    TResult Function(String? tableUuid, String? customerUuid)? createOrder,
    TResult Function(List<Category> categories)? categoriesUpdated,
    TResult Function(List<Product> products)? productsUpdated,
    required TResult orElse(),
  }) {
    if (updateQuantity != null) {
      return updateQuantity(cartItemId, quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CategorySelected value) categorySelected,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_SelectProduct value) selectProduct,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_CreateOrder value) createOrder,
    required TResult Function(_CategoriesUpdated value) categoriesUpdated,
    required TResult Function(_ProductsUpdated value) productsUpdated,
  }) {
    return updateQuantity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CategorySelected value)? categorySelected,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_SelectProduct value)? selectProduct,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_CreateOrder value)? createOrder,
    TResult? Function(_CategoriesUpdated value)? categoriesUpdated,
    TResult? Function(_ProductsUpdated value)? productsUpdated,
  }) {
    return updateQuantity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CategorySelected value)? categorySelected,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_SelectProduct value)? selectProduct,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_CreateOrder value)? createOrder,
    TResult Function(_CategoriesUpdated value)? categoriesUpdated,
    TResult Function(_ProductsUpdated value)? productsUpdated,
    required TResult orElse(),
  }) {
    if (updateQuantity != null) {
      return updateQuantity(this);
    }
    return orElse();
  }
}

abstract class _UpdateQuantity implements SalesEvent {
  const factory _UpdateQuantity(final String cartItemId, final int quantity) =
      _$UpdateQuantityImpl;

  String get cartItemId;
  int get quantity;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateQuantityImplCopyWith<_$UpdateQuantityImpl> get copyWith =>
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
    extends _$SalesEventCopyWithImpl<$Res, _$ClearCartImpl>
    implements _$$ClearCartImplCopyWith<$Res> {
  __$$ClearCartImplCopyWithImpl(
      _$ClearCartImpl _value, $Res Function(_$ClearCartImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearCartImpl implements _ClearCart {
  const _$ClearCartImpl();

  @override
  String toString() {
    return 'SalesEvent.clearCart()';
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
    required TResult Function() started,
    required TResult Function(String? categoryId) categorySelected,
    required TResult Function(String query) searchQueryChanged,
    required TResult Function(Product product) selectProduct,
    required TResult Function(Product product, int? quantity,
            List<String>? modifiers, String? note)
        addToCart,
    required TResult Function(String cartItemId) removeFromCart,
    required TResult Function(String cartItemId, int quantity) updateQuantity,
    required TResult Function() clearCart,
    required TResult Function(String? tableUuid, String? customerUuid)
        createOrder,
    required TResult Function(List<Category> categories) categoriesUpdated,
    required TResult Function(List<Product> products) productsUpdated,
  }) {
    return clearCart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String? categoryId)? categorySelected,
    TResult? Function(String query)? searchQueryChanged,
    TResult? Function(Product product)? selectProduct,
    TResult? Function(Product product, int? quantity, List<String>? modifiers,
            String? note)?
        addToCart,
    TResult? Function(String cartItemId)? removeFromCart,
    TResult? Function(String cartItemId, int quantity)? updateQuantity,
    TResult? Function()? clearCart,
    TResult? Function(String? tableUuid, String? customerUuid)? createOrder,
    TResult? Function(List<Category> categories)? categoriesUpdated,
    TResult? Function(List<Product> products)? productsUpdated,
  }) {
    return clearCart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? categoryId)? categorySelected,
    TResult Function(String query)? searchQueryChanged,
    TResult Function(Product product)? selectProduct,
    TResult Function(Product product, int? quantity, List<String>? modifiers,
            String? note)?
        addToCart,
    TResult Function(String cartItemId)? removeFromCart,
    TResult Function(String cartItemId, int quantity)? updateQuantity,
    TResult Function()? clearCart,
    TResult Function(String? tableUuid, String? customerUuid)? createOrder,
    TResult Function(List<Category> categories)? categoriesUpdated,
    TResult Function(List<Product> products)? productsUpdated,
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
    required TResult Function(_Started value) started,
    required TResult Function(_CategorySelected value) categorySelected,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_SelectProduct value) selectProduct,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_CreateOrder value) createOrder,
    required TResult Function(_CategoriesUpdated value) categoriesUpdated,
    required TResult Function(_ProductsUpdated value) productsUpdated,
  }) {
    return clearCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CategorySelected value)? categorySelected,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_SelectProduct value)? selectProduct,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_CreateOrder value)? createOrder,
    TResult? Function(_CategoriesUpdated value)? categoriesUpdated,
    TResult? Function(_ProductsUpdated value)? productsUpdated,
  }) {
    return clearCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CategorySelected value)? categorySelected,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_SelectProduct value)? selectProduct,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_CreateOrder value)? createOrder,
    TResult Function(_CategoriesUpdated value)? categoriesUpdated,
    TResult Function(_ProductsUpdated value)? productsUpdated,
    required TResult orElse(),
  }) {
    if (clearCart != null) {
      return clearCart(this);
    }
    return orElse();
  }
}

abstract class _ClearCart implements SalesEvent {
  const factory _ClearCart() = _$ClearCartImpl;
}

/// @nodoc
abstract class _$$CreateOrderImplCopyWith<$Res> {
  factory _$$CreateOrderImplCopyWith(
          _$CreateOrderImpl value, $Res Function(_$CreateOrderImpl) then) =
      __$$CreateOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? tableUuid, String? customerUuid});
}

/// @nodoc
class __$$CreateOrderImplCopyWithImpl<$Res>
    extends _$SalesEventCopyWithImpl<$Res, _$CreateOrderImpl>
    implements _$$CreateOrderImplCopyWith<$Res> {
  __$$CreateOrderImplCopyWithImpl(
      _$CreateOrderImpl _value, $Res Function(_$CreateOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableUuid = freezed,
    Object? customerUuid = freezed,
  }) {
    return _then(_$CreateOrderImpl(
      tableUuid: freezed == tableUuid
          ? _value.tableUuid
          : tableUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      customerUuid: freezed == customerUuid
          ? _value.customerUuid
          : customerUuid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CreateOrderImpl implements _CreateOrder {
  const _$CreateOrderImpl({this.tableUuid, this.customerUuid});

  @override
  final String? tableUuid;
  @override
  final String? customerUuid;

  @override
  String toString() {
    return 'SalesEvent.createOrder(tableUuid: $tableUuid, customerUuid: $customerUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateOrderImpl &&
            (identical(other.tableUuid, tableUuid) ||
                other.tableUuid == tableUuid) &&
            (identical(other.customerUuid, customerUuid) ||
                other.customerUuid == customerUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tableUuid, customerUuid);

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateOrderImplCopyWith<_$CreateOrderImpl> get copyWith =>
      __$$CreateOrderImplCopyWithImpl<_$CreateOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String? categoryId) categorySelected,
    required TResult Function(String query) searchQueryChanged,
    required TResult Function(Product product) selectProduct,
    required TResult Function(Product product, int? quantity,
            List<String>? modifiers, String? note)
        addToCart,
    required TResult Function(String cartItemId) removeFromCart,
    required TResult Function(String cartItemId, int quantity) updateQuantity,
    required TResult Function() clearCart,
    required TResult Function(String? tableUuid, String? customerUuid)
        createOrder,
    required TResult Function(List<Category> categories) categoriesUpdated,
    required TResult Function(List<Product> products) productsUpdated,
  }) {
    return createOrder(tableUuid, customerUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String? categoryId)? categorySelected,
    TResult? Function(String query)? searchQueryChanged,
    TResult? Function(Product product)? selectProduct,
    TResult? Function(Product product, int? quantity, List<String>? modifiers,
            String? note)?
        addToCart,
    TResult? Function(String cartItemId)? removeFromCart,
    TResult? Function(String cartItemId, int quantity)? updateQuantity,
    TResult? Function()? clearCart,
    TResult? Function(String? tableUuid, String? customerUuid)? createOrder,
    TResult? Function(List<Category> categories)? categoriesUpdated,
    TResult? Function(List<Product> products)? productsUpdated,
  }) {
    return createOrder?.call(tableUuid, customerUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? categoryId)? categorySelected,
    TResult Function(String query)? searchQueryChanged,
    TResult Function(Product product)? selectProduct,
    TResult Function(Product product, int? quantity, List<String>? modifiers,
            String? note)?
        addToCart,
    TResult Function(String cartItemId)? removeFromCart,
    TResult Function(String cartItemId, int quantity)? updateQuantity,
    TResult Function()? clearCart,
    TResult Function(String? tableUuid, String? customerUuid)? createOrder,
    TResult Function(List<Category> categories)? categoriesUpdated,
    TResult Function(List<Product> products)? productsUpdated,
    required TResult orElse(),
  }) {
    if (createOrder != null) {
      return createOrder(tableUuid, customerUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CategorySelected value) categorySelected,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_SelectProduct value) selectProduct,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_CreateOrder value) createOrder,
    required TResult Function(_CategoriesUpdated value) categoriesUpdated,
    required TResult Function(_ProductsUpdated value) productsUpdated,
  }) {
    return createOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CategorySelected value)? categorySelected,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_SelectProduct value)? selectProduct,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_CreateOrder value)? createOrder,
    TResult? Function(_CategoriesUpdated value)? categoriesUpdated,
    TResult? Function(_ProductsUpdated value)? productsUpdated,
  }) {
    return createOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CategorySelected value)? categorySelected,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_SelectProduct value)? selectProduct,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_CreateOrder value)? createOrder,
    TResult Function(_CategoriesUpdated value)? categoriesUpdated,
    TResult Function(_ProductsUpdated value)? productsUpdated,
    required TResult orElse(),
  }) {
    if (createOrder != null) {
      return createOrder(this);
    }
    return orElse();
  }
}

abstract class _CreateOrder implements SalesEvent {
  const factory _CreateOrder(
      {final String? tableUuid,
      final String? customerUuid}) = _$CreateOrderImpl;

  String? get tableUuid;
  String? get customerUuid;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateOrderImplCopyWith<_$CreateOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoriesUpdatedImplCopyWith<$Res> {
  factory _$$CategoriesUpdatedImplCopyWith(_$CategoriesUpdatedImpl value,
          $Res Function(_$CategoriesUpdatedImpl) then) =
      __$$CategoriesUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Category> categories});
}

/// @nodoc
class __$$CategoriesUpdatedImplCopyWithImpl<$Res>
    extends _$SalesEventCopyWithImpl<$Res, _$CategoriesUpdatedImpl>
    implements _$$CategoriesUpdatedImplCopyWith<$Res> {
  __$$CategoriesUpdatedImplCopyWithImpl(_$CategoriesUpdatedImpl _value,
      $Res Function(_$CategoriesUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$CategoriesUpdatedImpl(
      null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc

class _$CategoriesUpdatedImpl implements _CategoriesUpdated {
  const _$CategoriesUpdatedImpl(final List<Category> categories)
      : _categories = categories;

  final List<Category> _categories;
  @override
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'SalesEvent.categoriesUpdated(categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoriesUpdatedImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoriesUpdatedImplCopyWith<_$CategoriesUpdatedImpl> get copyWith =>
      __$$CategoriesUpdatedImplCopyWithImpl<_$CategoriesUpdatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String? categoryId) categorySelected,
    required TResult Function(String query) searchQueryChanged,
    required TResult Function(Product product) selectProduct,
    required TResult Function(Product product, int? quantity,
            List<String>? modifiers, String? note)
        addToCart,
    required TResult Function(String cartItemId) removeFromCart,
    required TResult Function(String cartItemId, int quantity) updateQuantity,
    required TResult Function() clearCart,
    required TResult Function(String? tableUuid, String? customerUuid)
        createOrder,
    required TResult Function(List<Category> categories) categoriesUpdated,
    required TResult Function(List<Product> products) productsUpdated,
  }) {
    return categoriesUpdated(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String? categoryId)? categorySelected,
    TResult? Function(String query)? searchQueryChanged,
    TResult? Function(Product product)? selectProduct,
    TResult? Function(Product product, int? quantity, List<String>? modifiers,
            String? note)?
        addToCart,
    TResult? Function(String cartItemId)? removeFromCart,
    TResult? Function(String cartItemId, int quantity)? updateQuantity,
    TResult? Function()? clearCart,
    TResult? Function(String? tableUuid, String? customerUuid)? createOrder,
    TResult? Function(List<Category> categories)? categoriesUpdated,
    TResult? Function(List<Product> products)? productsUpdated,
  }) {
    return categoriesUpdated?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? categoryId)? categorySelected,
    TResult Function(String query)? searchQueryChanged,
    TResult Function(Product product)? selectProduct,
    TResult Function(Product product, int? quantity, List<String>? modifiers,
            String? note)?
        addToCart,
    TResult Function(String cartItemId)? removeFromCart,
    TResult Function(String cartItemId, int quantity)? updateQuantity,
    TResult Function()? clearCart,
    TResult Function(String? tableUuid, String? customerUuid)? createOrder,
    TResult Function(List<Category> categories)? categoriesUpdated,
    TResult Function(List<Product> products)? productsUpdated,
    required TResult orElse(),
  }) {
    if (categoriesUpdated != null) {
      return categoriesUpdated(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CategorySelected value) categorySelected,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_SelectProduct value) selectProduct,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_CreateOrder value) createOrder,
    required TResult Function(_CategoriesUpdated value) categoriesUpdated,
    required TResult Function(_ProductsUpdated value) productsUpdated,
  }) {
    return categoriesUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CategorySelected value)? categorySelected,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_SelectProduct value)? selectProduct,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_CreateOrder value)? createOrder,
    TResult? Function(_CategoriesUpdated value)? categoriesUpdated,
    TResult? Function(_ProductsUpdated value)? productsUpdated,
  }) {
    return categoriesUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CategorySelected value)? categorySelected,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_SelectProduct value)? selectProduct,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_CreateOrder value)? createOrder,
    TResult Function(_CategoriesUpdated value)? categoriesUpdated,
    TResult Function(_ProductsUpdated value)? productsUpdated,
    required TResult orElse(),
  }) {
    if (categoriesUpdated != null) {
      return categoriesUpdated(this);
    }
    return orElse();
  }
}

abstract class _CategoriesUpdated implements SalesEvent {
  const factory _CategoriesUpdated(final List<Category> categories) =
      _$CategoriesUpdatedImpl;

  List<Category> get categories;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoriesUpdatedImplCopyWith<_$CategoriesUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductsUpdatedImplCopyWith<$Res> {
  factory _$$ProductsUpdatedImplCopyWith(_$ProductsUpdatedImpl value,
          $Res Function(_$ProductsUpdatedImpl) then) =
      __$$ProductsUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Product> products});
}

/// @nodoc
class __$$ProductsUpdatedImplCopyWithImpl<$Res>
    extends _$SalesEventCopyWithImpl<$Res, _$ProductsUpdatedImpl>
    implements _$$ProductsUpdatedImplCopyWith<$Res> {
  __$$ProductsUpdatedImplCopyWithImpl(
      _$ProductsUpdatedImpl _value, $Res Function(_$ProductsUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$ProductsUpdatedImpl(
      null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class _$ProductsUpdatedImpl implements _ProductsUpdated {
  const _$ProductsUpdatedImpl(final List<Product> products)
      : _products = products;

  final List<Product> _products;
  @override
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'SalesEvent.productsUpdated(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsUpdatedImpl &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsUpdatedImplCopyWith<_$ProductsUpdatedImpl> get copyWith =>
      __$$ProductsUpdatedImplCopyWithImpl<_$ProductsUpdatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String? categoryId) categorySelected,
    required TResult Function(String query) searchQueryChanged,
    required TResult Function(Product product) selectProduct,
    required TResult Function(Product product, int? quantity,
            List<String>? modifiers, String? note)
        addToCart,
    required TResult Function(String cartItemId) removeFromCart,
    required TResult Function(String cartItemId, int quantity) updateQuantity,
    required TResult Function() clearCart,
    required TResult Function(String? tableUuid, String? customerUuid)
        createOrder,
    required TResult Function(List<Category> categories) categoriesUpdated,
    required TResult Function(List<Product> products) productsUpdated,
  }) {
    return productsUpdated(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String? categoryId)? categorySelected,
    TResult? Function(String query)? searchQueryChanged,
    TResult? Function(Product product)? selectProduct,
    TResult? Function(Product product, int? quantity, List<String>? modifiers,
            String? note)?
        addToCart,
    TResult? Function(String cartItemId)? removeFromCart,
    TResult? Function(String cartItemId, int quantity)? updateQuantity,
    TResult? Function()? clearCart,
    TResult? Function(String? tableUuid, String? customerUuid)? createOrder,
    TResult? Function(List<Category> categories)? categoriesUpdated,
    TResult? Function(List<Product> products)? productsUpdated,
  }) {
    return productsUpdated?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String? categoryId)? categorySelected,
    TResult Function(String query)? searchQueryChanged,
    TResult Function(Product product)? selectProduct,
    TResult Function(Product product, int? quantity, List<String>? modifiers,
            String? note)?
        addToCart,
    TResult Function(String cartItemId)? removeFromCart,
    TResult Function(String cartItemId, int quantity)? updateQuantity,
    TResult Function()? clearCart,
    TResult Function(String? tableUuid, String? customerUuid)? createOrder,
    TResult Function(List<Category> categories)? categoriesUpdated,
    TResult Function(List<Product> products)? productsUpdated,
    required TResult orElse(),
  }) {
    if (productsUpdated != null) {
      return productsUpdated(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CategorySelected value) categorySelected,
    required TResult Function(_SearchQueryChanged value) searchQueryChanged,
    required TResult Function(_SelectProduct value) selectProduct,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_CreateOrder value) createOrder,
    required TResult Function(_CategoriesUpdated value) categoriesUpdated,
    required TResult Function(_ProductsUpdated value) productsUpdated,
  }) {
    return productsUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CategorySelected value)? categorySelected,
    TResult? Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult? Function(_SelectProduct value)? selectProduct,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_CreateOrder value)? createOrder,
    TResult? Function(_CategoriesUpdated value)? categoriesUpdated,
    TResult? Function(_ProductsUpdated value)? productsUpdated,
  }) {
    return productsUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CategorySelected value)? categorySelected,
    TResult Function(_SearchQueryChanged value)? searchQueryChanged,
    TResult Function(_SelectProduct value)? selectProduct,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_CreateOrder value)? createOrder,
    TResult Function(_CategoriesUpdated value)? categoriesUpdated,
    TResult Function(_ProductsUpdated value)? productsUpdated,
    required TResult orElse(),
  }) {
    if (productsUpdated != null) {
      return productsUpdated(this);
    }
    return orElse();
  }
}

abstract class _ProductsUpdated implements SalesEvent {
  const factory _ProductsUpdated(final List<Product> products) =
      _$ProductsUpdatedImpl;

  List<Product> get products;

  /// Create a copy of SalesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductsUpdatedImplCopyWith<_$ProductsUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SalesState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Category> get categories => throw _privateConstructorUsedError;
  List<Product> get products => throw _privateConstructorUsedError;
  Cart get cart => throw _privateConstructorUsedError;
  String? get selectedCategoryId => throw _privateConstructorUsedError;
  String? get searchQuery => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get isOrderSuccess => throw _privateConstructorUsedError;
  String? get lastCreatedOrderUuid =>
      throw _privateConstructorUsedError; // Added for navigation
  Product? get selectedProductForModifiers =>
      throw _privateConstructorUsedError; // To show dialog
  List<ModifierGroupWithItems> get modifierGroups =>
      throw _privateConstructorUsedError;

  /// Create a copy of SalesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesStateCopyWith<SalesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesStateCopyWith<$Res> {
  factory $SalesStateCopyWith(
          SalesState value, $Res Function(SalesState) then) =
      _$SalesStateCopyWithImpl<$Res, SalesState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<Category> categories,
      List<Product> products,
      Cart cart,
      String? selectedCategoryId,
      String? searchQuery,
      String? errorMessage,
      bool isOrderSuccess,
      String? lastCreatedOrderUuid,
      Product? selectedProductForModifiers,
      List<ModifierGroupWithItems> modifierGroups});
}

/// @nodoc
class _$SalesStateCopyWithImpl<$Res, $Val extends SalesState>
    implements $SalesStateCopyWith<$Res> {
  _$SalesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? categories = null,
    Object? products = null,
    Object? cart = null,
    Object? selectedCategoryId = freezed,
    Object? searchQuery = freezed,
    Object? errorMessage = freezed,
    Object? isOrderSuccess = null,
    Object? lastCreatedOrderUuid = freezed,
    Object? selectedProductForModifiers = freezed,
    Object? modifierGroups = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      cart: null == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as Cart,
      selectedCategoryId: freezed == selectedCategoryId
          ? _value.selectedCategoryId
          : selectedCategoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isOrderSuccess: null == isOrderSuccess
          ? _value.isOrderSuccess
          : isOrderSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      lastCreatedOrderUuid: freezed == lastCreatedOrderUuid
          ? _value.lastCreatedOrderUuid
          : lastCreatedOrderUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedProductForModifiers: freezed == selectedProductForModifiers
          ? _value.selectedProductForModifiers
          : selectedProductForModifiers // ignore: cast_nullable_to_non_nullable
              as Product?,
      modifierGroups: null == modifierGroups
          ? _value.modifierGroups
          : modifierGroups // ignore: cast_nullable_to_non_nullable
              as List<ModifierGroupWithItems>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesStateImplCopyWith<$Res>
    implements $SalesStateCopyWith<$Res> {
  factory _$$SalesStateImplCopyWith(
          _$SalesStateImpl value, $Res Function(_$SalesStateImpl) then) =
      __$$SalesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<Category> categories,
      List<Product> products,
      Cart cart,
      String? selectedCategoryId,
      String? searchQuery,
      String? errorMessage,
      bool isOrderSuccess,
      String? lastCreatedOrderUuid,
      Product? selectedProductForModifiers,
      List<ModifierGroupWithItems> modifierGroups});
}

/// @nodoc
class __$$SalesStateImplCopyWithImpl<$Res>
    extends _$SalesStateCopyWithImpl<$Res, _$SalesStateImpl>
    implements _$$SalesStateImplCopyWith<$Res> {
  __$$SalesStateImplCopyWithImpl(
      _$SalesStateImpl _value, $Res Function(_$SalesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? categories = null,
    Object? products = null,
    Object? cart = null,
    Object? selectedCategoryId = freezed,
    Object? searchQuery = freezed,
    Object? errorMessage = freezed,
    Object? isOrderSuccess = null,
    Object? lastCreatedOrderUuid = freezed,
    Object? selectedProductForModifiers = freezed,
    Object? modifierGroups = null,
  }) {
    return _then(_$SalesStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      cart: null == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as Cart,
      selectedCategoryId: freezed == selectedCategoryId
          ? _value.selectedCategoryId
          : selectedCategoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isOrderSuccess: null == isOrderSuccess
          ? _value.isOrderSuccess
          : isOrderSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      lastCreatedOrderUuid: freezed == lastCreatedOrderUuid
          ? _value.lastCreatedOrderUuid
          : lastCreatedOrderUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedProductForModifiers: freezed == selectedProductForModifiers
          ? _value.selectedProductForModifiers
          : selectedProductForModifiers // ignore: cast_nullable_to_non_nullable
              as Product?,
      modifierGroups: null == modifierGroups
          ? _value._modifierGroups
          : modifierGroups // ignore: cast_nullable_to_non_nullable
              as List<ModifierGroupWithItems>,
    ));
  }
}

/// @nodoc

class _$SalesStateImpl implements _SalesState {
  const _$SalesStateImpl(
      {this.isLoading = false,
      final List<Category> categories = const [],
      final List<Product> products = const [],
      this.cart = const Cart(),
      this.selectedCategoryId,
      this.searchQuery,
      this.errorMessage,
      this.isOrderSuccess = false,
      this.lastCreatedOrderUuid,
      this.selectedProductForModifiers,
      final List<ModifierGroupWithItems> modifierGroups = const []})
      : _categories = categories,
        _products = products,
        _modifierGroups = modifierGroups;

  @override
  @JsonKey()
  final bool isLoading;
  final List<Category> _categories;
  @override
  @JsonKey()
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<Product> _products;
  @override
  @JsonKey()
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  @JsonKey()
  final Cart cart;
  @override
  final String? selectedCategoryId;
  @override
  final String? searchQuery;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final bool isOrderSuccess;
  @override
  final String? lastCreatedOrderUuid;
// Added for navigation
  @override
  final Product? selectedProductForModifiers;
// To show dialog
  final List<ModifierGroupWithItems> _modifierGroups;
// To show dialog
  @override
  @JsonKey()
  List<ModifierGroupWithItems> get modifierGroups {
    if (_modifierGroups is EqualUnmodifiableListView) return _modifierGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modifierGroups);
  }

  @override
  String toString() {
    return 'SalesState(isLoading: $isLoading, categories: $categories, products: $products, cart: $cart, selectedCategoryId: $selectedCategoryId, searchQuery: $searchQuery, errorMessage: $errorMessage, isOrderSuccess: $isOrderSuccess, lastCreatedOrderUuid: $lastCreatedOrderUuid, selectedProductForModifiers: $selectedProductForModifiers, modifierGroups: $modifierGroups)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.cart, cart) || other.cart == cart) &&
            (identical(other.selectedCategoryId, selectedCategoryId) ||
                other.selectedCategoryId == selectedCategoryId) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isOrderSuccess, isOrderSuccess) ||
                other.isOrderSuccess == isOrderSuccess) &&
            (identical(other.lastCreatedOrderUuid, lastCreatedOrderUuid) ||
                other.lastCreatedOrderUuid == lastCreatedOrderUuid) &&
            (identical(other.selectedProductForModifiers,
                    selectedProductForModifiers) ||
                other.selectedProductForModifiers ==
                    selectedProductForModifiers) &&
            const DeepCollectionEquality()
                .equals(other._modifierGroups, _modifierGroups));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_products),
      cart,
      selectedCategoryId,
      searchQuery,
      errorMessage,
      isOrderSuccess,
      lastCreatedOrderUuid,
      selectedProductForModifiers,
      const DeepCollectionEquality().hash(_modifierGroups));

  /// Create a copy of SalesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesStateImplCopyWith<_$SalesStateImpl> get copyWith =>
      __$$SalesStateImplCopyWithImpl<_$SalesStateImpl>(this, _$identity);
}

abstract class _SalesState implements SalesState {
  const factory _SalesState(
      {final bool isLoading,
      final List<Category> categories,
      final List<Product> products,
      final Cart cart,
      final String? selectedCategoryId,
      final String? searchQuery,
      final String? errorMessage,
      final bool isOrderSuccess,
      final String? lastCreatedOrderUuid,
      final Product? selectedProductForModifiers,
      final List<ModifierGroupWithItems> modifierGroups}) = _$SalesStateImpl;

  @override
  bool get isLoading;
  @override
  List<Category> get categories;
  @override
  List<Product> get products;
  @override
  Cart get cart;
  @override
  String? get selectedCategoryId;
  @override
  String? get searchQuery;
  @override
  String? get errorMessage;
  @override
  bool get isOrderSuccess;
  @override
  String? get lastCreatedOrderUuid; // Added for navigation
  @override
  Product? get selectedProductForModifiers; // To show dialog
  @override
  List<ModifierGroupWithItems> get modifierGroups;

  /// Create a copy of SalesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesStateImplCopyWith<_$SalesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
