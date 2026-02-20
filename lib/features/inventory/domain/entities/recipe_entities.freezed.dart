// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Ingredient _$IngredientFromJson(Map<String, dynamic> json) {
  return _Ingredient.fromJson(json);
}

/// @nodoc
mixin _$Ingredient {
  String get uuid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError; // g, ml, pcs
  double get currentStock => throw _privateConstructorUsedError;
  double get costPerUnit => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;

  /// Serializes this Ingredient to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Ingredient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IngredientCopyWith<Ingredient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientCopyWith<$Res> {
  factory $IngredientCopyWith(
          Ingredient value, $Res Function(Ingredient) then) =
      _$IngredientCopyWithImpl<$Res, Ingredient>;
  @useResult
  $Res call(
      {String uuid,
      String name,
      String unit,
      double currentStock,
      double costPerUnit,
      bool isDeleted});
}

/// @nodoc
class _$IngredientCopyWithImpl<$Res, $Val extends Ingredient>
    implements $IngredientCopyWith<$Res> {
  _$IngredientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Ingredient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? unit = null,
    Object? currentStock = null,
    Object? costPerUnit = null,
    Object? isDeleted = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      currentStock: null == currentStock
          ? _value.currentStock
          : currentStock // ignore: cast_nullable_to_non_nullable
              as double,
      costPerUnit: null == costPerUnit
          ? _value.costPerUnit
          : costPerUnit // ignore: cast_nullable_to_non_nullable
              as double,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IngredientImplCopyWith<$Res>
    implements $IngredientCopyWith<$Res> {
  factory _$$IngredientImplCopyWith(
          _$IngredientImpl value, $Res Function(_$IngredientImpl) then) =
      __$$IngredientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String name,
      String unit,
      double currentStock,
      double costPerUnit,
      bool isDeleted});
}

/// @nodoc
class __$$IngredientImplCopyWithImpl<$Res>
    extends _$IngredientCopyWithImpl<$Res, _$IngredientImpl>
    implements _$$IngredientImplCopyWith<$Res> {
  __$$IngredientImplCopyWithImpl(
      _$IngredientImpl _value, $Res Function(_$IngredientImpl) _then)
      : super(_value, _then);

  /// Create a copy of Ingredient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? unit = null,
    Object? currentStock = null,
    Object? costPerUnit = null,
    Object? isDeleted = null,
  }) {
    return _then(_$IngredientImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      currentStock: null == currentStock
          ? _value.currentStock
          : currentStock // ignore: cast_nullable_to_non_nullable
              as double,
      costPerUnit: null == costPerUnit
          ? _value.costPerUnit
          : costPerUnit // ignore: cast_nullable_to_non_nullable
              as double,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IngredientImpl implements _Ingredient {
  const _$IngredientImpl(
      {required this.uuid,
      required this.name,
      required this.unit,
      required this.currentStock,
      required this.costPerUnit,
      this.isDeleted = false});

  factory _$IngredientImpl.fromJson(Map<String, dynamic> json) =>
      _$$IngredientImplFromJson(json);

  @override
  final String uuid;
  @override
  final String name;
  @override
  final String unit;
// g, ml, pcs
  @override
  final double currentStock;
  @override
  final double costPerUnit;
  @override
  @JsonKey()
  final bool isDeleted;

  @override
  String toString() {
    return 'Ingredient(uuid: $uuid, name: $name, unit: $unit, currentStock: $currentStock, costPerUnit: $costPerUnit, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.currentStock, currentStock) ||
                other.currentStock == currentStock) &&
            (identical(other.costPerUnit, costPerUnit) ||
                other.costPerUnit == costPerUnit) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, uuid, name, unit, currentStock, costPerUnit, isDeleted);

  /// Create a copy of Ingredient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientImplCopyWith<_$IngredientImpl> get copyWith =>
      __$$IngredientImplCopyWithImpl<_$IngredientImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IngredientImplToJson(
      this,
    );
  }
}

abstract class _Ingredient implements Ingredient {
  const factory _Ingredient(
      {required final String uuid,
      required final String name,
      required final String unit,
      required final double currentStock,
      required final double costPerUnit,
      final bool isDeleted}) = _$IngredientImpl;

  factory _Ingredient.fromJson(Map<String, dynamic> json) =
      _$IngredientImpl.fromJson;

  @override
  String get uuid;
  @override
  String get name;
  @override
  String get unit; // g, ml, pcs
  @override
  double get currentStock;
  @override
  double get costPerUnit;
  @override
  bool get isDeleted;

  /// Create a copy of Ingredient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IngredientImplCopyWith<_$IngredientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

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
  String get ingredientUuid => throw _privateConstructorUsedError;
  double get quantityRequired => throw _privateConstructorUsedError;
  String? get ingredientName =>
      throw _privateConstructorUsedError; // Helper for UI
  String? get unit => throw _privateConstructorUsedError;

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
  $Res call(
      {String ingredientUuid,
      double quantityRequired,
      String? ingredientName,
      String? unit});
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
    Object? ingredientUuid = null,
    Object? quantityRequired = null,
    Object? ingredientName = freezed,
    Object? unit = freezed,
  }) {
    return _then(_value.copyWith(
      ingredientUuid: null == ingredientUuid
          ? _value.ingredientUuid
          : ingredientUuid // ignore: cast_nullable_to_non_nullable
              as String,
      quantityRequired: null == quantityRequired
          ? _value.quantityRequired
          : quantityRequired // ignore: cast_nullable_to_non_nullable
              as double,
      ingredientName: freezed == ingredientName
          ? _value.ingredientName
          : ingredientName // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
  $Res call(
      {String ingredientUuid,
      double quantityRequired,
      String? ingredientName,
      String? unit});
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
    Object? ingredientUuid = null,
    Object? quantityRequired = null,
    Object? ingredientName = freezed,
    Object? unit = freezed,
  }) {
    return _then(_$RecipeItemImpl(
      ingredientUuid: null == ingredientUuid
          ? _value.ingredientUuid
          : ingredientUuid // ignore: cast_nullable_to_non_nullable
              as String,
      quantityRequired: null == quantityRequired
          ? _value.quantityRequired
          : quantityRequired // ignore: cast_nullable_to_non_nullable
              as double,
      ingredientName: freezed == ingredientName
          ? _value.ingredientName
          : ingredientName // ignore: cast_nullable_to_non_nullable
              as String?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeItemImpl implements _RecipeItem {
  const _$RecipeItemImpl(
      {required this.ingredientUuid,
      required this.quantityRequired,
      this.ingredientName,
      this.unit});

  factory _$RecipeItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeItemImplFromJson(json);

  @override
  final String ingredientUuid;
  @override
  final double quantityRequired;
  @override
  final String? ingredientName;
// Helper for UI
  @override
  final String? unit;

  @override
  String toString() {
    return 'RecipeItem(ingredientUuid: $ingredientUuid, quantityRequired: $quantityRequired, ingredientName: $ingredientName, unit: $unit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeItemImpl &&
            (identical(other.ingredientUuid, ingredientUuid) ||
                other.ingredientUuid == ingredientUuid) &&
            (identical(other.quantityRequired, quantityRequired) ||
                other.quantityRequired == quantityRequired) &&
            (identical(other.ingredientName, ingredientName) ||
                other.ingredientName == ingredientName) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, ingredientUuid, quantityRequired, ingredientName, unit);

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
      {required final String ingredientUuid,
      required final double quantityRequired,
      final String? ingredientName,
      final String? unit}) = _$RecipeItemImpl;

  factory _RecipeItem.fromJson(Map<String, dynamic> json) =
      _$RecipeItemImpl.fromJson;

  @override
  String get ingredientUuid;
  @override
  double get quantityRequired;
  @override
  String? get ingredientName; // Helper for UI
  @override
  String? get unit;

  /// Create a copy of RecipeItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeItemImplCopyWith<_$RecipeItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
