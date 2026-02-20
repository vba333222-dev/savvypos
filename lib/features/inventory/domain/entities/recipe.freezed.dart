// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return _Recipe.fromJson(json);
}

/// @nodoc
mixin _$Recipe {
  String get productUuid => throw _privateConstructorUsedError;
  List<RecipeItem> get items => throw _privateConstructorUsedError;

  /// Serializes this Recipe to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeCopyWith<Recipe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) =
      _$RecipeCopyWithImpl<$Res, Recipe>;
  @useResult
  $Res call({String productUuid, List<RecipeItem> items});
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res, $Val extends Recipe>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productUuid = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      productUuid: null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RecipeItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeImplCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$$RecipeImplCopyWith(
          _$RecipeImpl value, $Res Function(_$RecipeImpl) then) =
      __$$RecipeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String productUuid, List<RecipeItem> items});
}

/// @nodoc
class __$$RecipeImplCopyWithImpl<$Res>
    extends _$RecipeCopyWithImpl<$Res, _$RecipeImpl>
    implements _$$RecipeImplCopyWith<$Res> {
  __$$RecipeImplCopyWithImpl(
      _$RecipeImpl _value, $Res Function(_$RecipeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productUuid = null,
    Object? items = null,
  }) {
    return _then(_$RecipeImpl(
      productUuid: null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RecipeItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeImpl implements _Recipe {
  const _$RecipeImpl(
      {required this.productUuid, required final List<RecipeItem> items})
      : _items = items;

  factory _$RecipeImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeImplFromJson(json);

  @override
  final String productUuid;
  final List<RecipeItem> _items;
  @override
  List<RecipeItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'Recipe(productUuid: $productUuid, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeImpl &&
            (identical(other.productUuid, productUuid) ||
                other.productUuid == productUuid) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, productUuid, const DeepCollectionEquality().hash(_items));

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      __$$RecipeImplCopyWithImpl<_$RecipeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeImplToJson(
      this,
    );
  }
}

abstract class _Recipe implements Recipe {
  const factory _Recipe(
      {required final String productUuid,
      required final List<RecipeItem> items}) = _$RecipeImpl;

  factory _Recipe.fromJson(Map<String, dynamic> json) = _$RecipeImpl.fromJson;

  @override
  String get productUuid;
  @override
  List<RecipeItem> get items;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeImplCopyWith<_$RecipeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecipeItem _$RecipeItemFromJson(Map<String, dynamic> json) {
  return _RecipeItem.fromJson(json);
}

/// @nodoc
mixin _$RecipeItem {
  Ingredient get ingredient => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;

  /// Serializes this RecipeItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecipeItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeItemCopyWith<RecipeItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeItemCopyWith<$Res> {
  factory $RecipeItemCopyWith(
          RecipeItem value, $Res Function(RecipeItem) then) =
      _$RecipeItemCopyWithImpl<$Res, RecipeItem>;
  @useResult
  $Res call({Ingredient ingredient, double quantity});

  $IngredientCopyWith<$Res> get ingredient;
}

/// @nodoc
class _$RecipeItemCopyWithImpl<$Res, $Val extends RecipeItem>
    implements $RecipeItemCopyWith<$Res> {
  _$RecipeItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredient = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      ingredient: null == ingredient
          ? _value.ingredient
          : ingredient // ignore: cast_nullable_to_non_nullable
              as Ingredient,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of RecipeItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IngredientCopyWith<$Res> get ingredient {
    return $IngredientCopyWith<$Res>(_value.ingredient, (value) {
      return _then(_value.copyWith(ingredient: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecipeItemImplCopyWith<$Res>
    implements $RecipeItemCopyWith<$Res> {
  factory _$$RecipeItemImplCopyWith(
          _$RecipeItemImpl value, $Res Function(_$RecipeItemImpl) then) =
      __$$RecipeItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Ingredient ingredient, double quantity});

  @override
  $IngredientCopyWith<$Res> get ingredient;
}

/// @nodoc
class __$$RecipeItemImplCopyWithImpl<$Res>
    extends _$RecipeItemCopyWithImpl<$Res, _$RecipeItemImpl>
    implements _$$RecipeItemImplCopyWith<$Res> {
  __$$RecipeItemImplCopyWithImpl(
      _$RecipeItemImpl _value, $Res Function(_$RecipeItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredient = null,
    Object? quantity = null,
  }) {
    return _then(_$RecipeItemImpl(
      ingredient: null == ingredient
          ? _value.ingredient
          : ingredient // ignore: cast_nullable_to_non_nullable
              as Ingredient,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeItemImpl implements _RecipeItem {
  const _$RecipeItemImpl({required this.ingredient, required this.quantity});

  factory _$RecipeItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeItemImplFromJson(json);

  @override
  final Ingredient ingredient;
  @override
  final double quantity;

  @override
  String toString() {
    return 'RecipeItem(ingredient: $ingredient, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeItemImpl &&
            (identical(other.ingredient, ingredient) ||
                other.ingredient == ingredient) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ingredient, quantity);

  /// Create a copy of RecipeItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeItemImplCopyWith<_$RecipeItemImpl> get copyWith =>
      __$$RecipeItemImplCopyWithImpl<_$RecipeItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeItemImplToJson(
      this,
    );
  }
}

abstract class _RecipeItem implements RecipeItem {
  const factory _RecipeItem(
      {required final Ingredient ingredient,
      required final double quantity}) = _$RecipeItemImpl;

  factory _RecipeItem.fromJson(Map<String, dynamic> json) =
      _$RecipeItemImpl.fromJson;

  @override
  Ingredient get ingredient;
  @override
  double get quantity;

  /// Create a copy of RecipeItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeItemImplCopyWith<_$RecipeItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
