// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_management_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InventoryManagementEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        addProduct,
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        updateProduct,
    required TResult Function(String uuid) deleteProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult? Function(String uuid)? deleteProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult Function(String uuid)? deleteProduct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_UpdateProduct value) updateProduct,
    required TResult Function(_DeleteProduct value) deleteProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_UpdateProduct value)? updateProduct,
    TResult? Function(_DeleteProduct value)? deleteProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_UpdateProduct value)? updateProduct,
    TResult Function(_DeleteProduct value)? deleteProduct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryManagementEventCopyWith<$Res> {
  factory $InventoryManagementEventCopyWith(InventoryManagementEvent value,
          $Res Function(InventoryManagementEvent) then) =
      _$InventoryManagementEventCopyWithImpl<$Res, InventoryManagementEvent>;
}

/// @nodoc
class _$InventoryManagementEventCopyWithImpl<$Res,
        $Val extends InventoryManagementEvent>
    implements $InventoryManagementEventCopyWith<$Res> {
  _$InventoryManagementEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AddProductImplCopyWith<$Res> {
  factory _$$AddProductImplCopyWith(
          _$AddProductImpl value, $Res Function(_$AddProductImpl) then) =
      __$$AddProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Product product, File? imageFile, List<String>? modifierGroupUuids});
}

/// @nodoc
class __$$AddProductImplCopyWithImpl<$Res>
    extends _$InventoryManagementEventCopyWithImpl<$Res, _$AddProductImpl>
    implements _$$AddProductImplCopyWith<$Res> {
  __$$AddProductImplCopyWithImpl(
      _$AddProductImpl _value, $Res Function(_$AddProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? imageFile = freezed,
    Object? modifierGroupUuids = freezed,
  }) {
    return _then(_$AddProductImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
      modifierGroupUuids: freezed == modifierGroupUuids
          ? _value._modifierGroupUuids
          : modifierGroupUuids // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$AddProductImpl implements _AddProduct {
  const _$AddProductImpl(this.product, this.imageFile,
      {final List<String>? modifierGroupUuids})
      : _modifierGroupUuids = modifierGroupUuids;

  @override
  final Product product;
  @override
  final File? imageFile;
  final List<String>? _modifierGroupUuids;
  @override
  List<String>? get modifierGroupUuids {
    final value = _modifierGroupUuids;
    if (value == null) return null;
    if (_modifierGroupUuids is EqualUnmodifiableListView)
      return _modifierGroupUuids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'InventoryManagementEvent.addProduct(product: $product, imageFile: $imageFile, modifierGroupUuids: $modifierGroupUuids)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddProductImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            const DeepCollectionEquality()
                .equals(other._modifierGroupUuids, _modifierGroupUuids));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product, imageFile,
      const DeepCollectionEquality().hash(_modifierGroupUuids));

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddProductImplCopyWith<_$AddProductImpl> get copyWith =>
      __$$AddProductImplCopyWithImpl<_$AddProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        addProduct,
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        updateProduct,
    required TResult Function(String uuid) deleteProduct,
  }) {
    return addProduct(product, imageFile, modifierGroupUuids);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult? Function(String uuid)? deleteProduct,
  }) {
    return addProduct?.call(product, imageFile, modifierGroupUuids);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult Function(String uuid)? deleteProduct,
    required TResult orElse(),
  }) {
    if (addProduct != null) {
      return addProduct(product, imageFile, modifierGroupUuids);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_UpdateProduct value) updateProduct,
    required TResult Function(_DeleteProduct value) deleteProduct,
  }) {
    return addProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_UpdateProduct value)? updateProduct,
    TResult? Function(_DeleteProduct value)? deleteProduct,
  }) {
    return addProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_UpdateProduct value)? updateProduct,
    TResult Function(_DeleteProduct value)? deleteProduct,
    required TResult orElse(),
  }) {
    if (addProduct != null) {
      return addProduct(this);
    }
    return orElse();
  }
}

abstract class _AddProduct implements InventoryManagementEvent {
  const factory _AddProduct(final Product product, final File? imageFile,
      {final List<String>? modifierGroupUuids}) = _$AddProductImpl;

  Product get product;
  File? get imageFile;
  List<String>? get modifierGroupUuids;

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddProductImplCopyWith<_$AddProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateProductImplCopyWith<$Res> {
  factory _$$UpdateProductImplCopyWith(
          _$UpdateProductImpl value, $Res Function(_$UpdateProductImpl) then) =
      __$$UpdateProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Product product, File? imageFile, List<String>? modifierGroupUuids});
}

/// @nodoc
class __$$UpdateProductImplCopyWithImpl<$Res>
    extends _$InventoryManagementEventCopyWithImpl<$Res, _$UpdateProductImpl>
    implements _$$UpdateProductImplCopyWith<$Res> {
  __$$UpdateProductImplCopyWithImpl(
      _$UpdateProductImpl _value, $Res Function(_$UpdateProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? imageFile = freezed,
    Object? modifierGroupUuids = freezed,
  }) {
    return _then(_$UpdateProductImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
      modifierGroupUuids: freezed == modifierGroupUuids
          ? _value._modifierGroupUuids
          : modifierGroupUuids // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$UpdateProductImpl implements _UpdateProduct {
  const _$UpdateProductImpl(this.product, this.imageFile,
      {final List<String>? modifierGroupUuids})
      : _modifierGroupUuids = modifierGroupUuids;

  @override
  final Product product;
  @override
  final File? imageFile;
  final List<String>? _modifierGroupUuids;
  @override
  List<String>? get modifierGroupUuids {
    final value = _modifierGroupUuids;
    if (value == null) return null;
    if (_modifierGroupUuids is EqualUnmodifiableListView)
      return _modifierGroupUuids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'InventoryManagementEvent.updateProduct(product: $product, imageFile: $imageFile, modifierGroupUuids: $modifierGroupUuids)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProductImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            const DeepCollectionEquality()
                .equals(other._modifierGroupUuids, _modifierGroupUuids));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product, imageFile,
      const DeepCollectionEquality().hash(_modifierGroupUuids));

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProductImplCopyWith<_$UpdateProductImpl> get copyWith =>
      __$$UpdateProductImplCopyWithImpl<_$UpdateProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        addProduct,
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        updateProduct,
    required TResult Function(String uuid) deleteProduct,
  }) {
    return updateProduct(product, imageFile, modifierGroupUuids);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult? Function(String uuid)? deleteProduct,
  }) {
    return updateProduct?.call(product, imageFile, modifierGroupUuids);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult Function(String uuid)? deleteProduct,
    required TResult orElse(),
  }) {
    if (updateProduct != null) {
      return updateProduct(product, imageFile, modifierGroupUuids);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_UpdateProduct value) updateProduct,
    required TResult Function(_DeleteProduct value) deleteProduct,
  }) {
    return updateProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_UpdateProduct value)? updateProduct,
    TResult? Function(_DeleteProduct value)? deleteProduct,
  }) {
    return updateProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_UpdateProduct value)? updateProduct,
    TResult Function(_DeleteProduct value)? deleteProduct,
    required TResult orElse(),
  }) {
    if (updateProduct != null) {
      return updateProduct(this);
    }
    return orElse();
  }
}

abstract class _UpdateProduct implements InventoryManagementEvent {
  const factory _UpdateProduct(final Product product, final File? imageFile,
      {final List<String>? modifierGroupUuids}) = _$UpdateProductImpl;

  Product get product;
  File? get imageFile;
  List<String>? get modifierGroupUuids;

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateProductImplCopyWith<_$UpdateProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteProductImplCopyWith<$Res> {
  factory _$$DeleteProductImplCopyWith(
          _$DeleteProductImpl value, $Res Function(_$DeleteProductImpl) then) =
      __$$DeleteProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uuid});
}

/// @nodoc
class __$$DeleteProductImplCopyWithImpl<$Res>
    extends _$InventoryManagementEventCopyWithImpl<$Res, _$DeleteProductImpl>
    implements _$$DeleteProductImplCopyWith<$Res> {
  __$$DeleteProductImplCopyWithImpl(
      _$DeleteProductImpl _value, $Res Function(_$DeleteProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
  }) {
    return _then(_$DeleteProductImpl(
      null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteProductImpl implements _DeleteProduct {
  const _$DeleteProductImpl(this.uuid);

  @override
  final String uuid;

  @override
  String toString() {
    return 'InventoryManagementEvent.deleteProduct(uuid: $uuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteProductImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid);

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteProductImplCopyWith<_$DeleteProductImpl> get copyWith =>
      __$$DeleteProductImplCopyWithImpl<_$DeleteProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        addProduct,
    required TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)
        updateProduct,
    required TResult Function(String uuid) deleteProduct,
  }) {
    return deleteProduct(uuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult? Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult? Function(String uuid)? deleteProduct,
  }) {
    return deleteProduct?.call(uuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        addProduct,
    TResult Function(
            Product product, File? imageFile, List<String>? modifierGroupUuids)?
        updateProduct,
    TResult Function(String uuid)? deleteProduct,
    required TResult orElse(),
  }) {
    if (deleteProduct != null) {
      return deleteProduct(uuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_UpdateProduct value) updateProduct,
    required TResult Function(_DeleteProduct value) deleteProduct,
  }) {
    return deleteProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_UpdateProduct value)? updateProduct,
    TResult? Function(_DeleteProduct value)? deleteProduct,
  }) {
    return deleteProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_UpdateProduct value)? updateProduct,
    TResult Function(_DeleteProduct value)? deleteProduct,
    required TResult orElse(),
  }) {
    if (deleteProduct != null) {
      return deleteProduct(this);
    }
    return orElse();
  }
}

abstract class _DeleteProduct implements InventoryManagementEvent {
  const factory _DeleteProduct(final String uuid) = _$DeleteProductImpl;

  String get uuid;

  /// Create a copy of InventoryManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteProductImplCopyWith<_$DeleteProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InventoryManagementState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryManagementStateCopyWith<$Res> {
  factory $InventoryManagementStateCopyWith(InventoryManagementState value,
          $Res Function(InventoryManagementState) then) =
      _$InventoryManagementStateCopyWithImpl<$Res, InventoryManagementState>;
}

/// @nodoc
class _$InventoryManagementStateCopyWithImpl<$Res,
        $Val extends InventoryManagementState>
    implements $InventoryManagementStateCopyWith<$Res> {
  _$InventoryManagementStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InventoryManagementState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$InventoryManagementStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryManagementState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'InventoryManagementState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements InventoryManagementState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$InventoryManagementStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryManagementState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'InventoryManagementState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements InventoryManagementState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$InventoryManagementStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryManagementState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'InventoryManagementState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements InventoryManagementState {
  const factory _Success() = _$SuccessImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$InventoryManagementStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'InventoryManagementState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of InventoryManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements InventoryManagementState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of InventoryManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
