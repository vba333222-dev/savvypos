// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kiosk_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KioskSession _$KioskSessionFromJson(Map<String, dynamic> json) {
  return _KioskSession.fromJson(json);
}

/// @nodoc
mixin _$KioskSession {
  String get uuid => throw _privateConstructorUsedError;
  DateTime get startedAt =>
      throw _privateConstructorUsedError; // Time session began
  DateTime? get lastInteractionAt =>
      throw _privateConstructorUsedError; // For idle timeout logic
// Guest Preferences
  String get languageCode => throw _privateConstructorUsedError;
  bool get isDineIn =>
      throw _privateConstructorUsedError; // Current Order State
  List<KioskCartItem> get cartItems =>
      throw _privateConstructorUsedError; // Status
  KioskFlowStep get currentStep => throw _privateConstructorUsedError;

  /// Serializes this KioskSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KioskSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KioskSessionCopyWith<KioskSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KioskSessionCopyWith<$Res> {
  factory $KioskSessionCopyWith(
          KioskSession value, $Res Function(KioskSession) then) =
      _$KioskSessionCopyWithImpl<$Res, KioskSession>;
  @useResult
  $Res call(
      {String uuid,
      DateTime startedAt,
      DateTime? lastInteractionAt,
      String languageCode,
      bool isDineIn,
      List<KioskCartItem> cartItems,
      KioskFlowStep currentStep});
}

/// @nodoc
class _$KioskSessionCopyWithImpl<$Res, $Val extends KioskSession>
    implements $KioskSessionCopyWith<$Res> {
  _$KioskSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KioskSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? startedAt = null,
    Object? lastInteractionAt = freezed,
    Object? languageCode = null,
    Object? isDineIn = null,
    Object? cartItems = null,
    Object? currentStep = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastInteractionAt: freezed == lastInteractionAt
          ? _value.lastInteractionAt
          : lastInteractionAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      isDineIn: null == isDineIn
          ? _value.isDineIn
          : isDineIn // ignore: cast_nullable_to_non_nullable
              as bool,
      cartItems: null == cartItems
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<KioskCartItem>,
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as KioskFlowStep,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KioskSessionImplCopyWith<$Res>
    implements $KioskSessionCopyWith<$Res> {
  factory _$$KioskSessionImplCopyWith(
          _$KioskSessionImpl value, $Res Function(_$KioskSessionImpl) then) =
      __$$KioskSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      DateTime startedAt,
      DateTime? lastInteractionAt,
      String languageCode,
      bool isDineIn,
      List<KioskCartItem> cartItems,
      KioskFlowStep currentStep});
}

/// @nodoc
class __$$KioskSessionImplCopyWithImpl<$Res>
    extends _$KioskSessionCopyWithImpl<$Res, _$KioskSessionImpl>
    implements _$$KioskSessionImplCopyWith<$Res> {
  __$$KioskSessionImplCopyWithImpl(
      _$KioskSessionImpl _value, $Res Function(_$KioskSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of KioskSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? startedAt = null,
    Object? lastInteractionAt = freezed,
    Object? languageCode = null,
    Object? isDineIn = null,
    Object? cartItems = null,
    Object? currentStep = null,
  }) {
    return _then(_$KioskSessionImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastInteractionAt: freezed == lastInteractionAt
          ? _value.lastInteractionAt
          : lastInteractionAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      isDineIn: null == isDineIn
          ? _value.isDineIn
          : isDineIn // ignore: cast_nullable_to_non_nullable
              as bool,
      cartItems: null == cartItems
          ? _value._cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<KioskCartItem>,
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as KioskFlowStep,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KioskSessionImpl extends _KioskSession {
  const _$KioskSessionImpl(
      {required this.uuid,
      required this.startedAt,
      this.lastInteractionAt,
      this.languageCode = 'en',
      this.isDineIn = false,
      final List<KioskCartItem> cartItems = const [],
      this.currentStep = KioskFlowStep.welcome})
      : _cartItems = cartItems,
        super._();

  factory _$KioskSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$KioskSessionImplFromJson(json);

  @override
  final String uuid;
  @override
  final DateTime startedAt;
// Time session began
  @override
  final DateTime? lastInteractionAt;
// For idle timeout logic
// Guest Preferences
  @override
  @JsonKey()
  final String languageCode;
  @override
  @JsonKey()
  final bool isDineIn;
// Current Order State
  final List<KioskCartItem> _cartItems;
// Current Order State
  @override
  @JsonKey()
  List<KioskCartItem> get cartItems {
    if (_cartItems is EqualUnmodifiableListView) return _cartItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItems);
  }

// Status
  @override
  @JsonKey()
  final KioskFlowStep currentStep;

  @override
  String toString() {
    return 'KioskSession(uuid: $uuid, startedAt: $startedAt, lastInteractionAt: $lastInteractionAt, languageCode: $languageCode, isDineIn: $isDineIn, cartItems: $cartItems, currentStep: $currentStep)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KioskSessionImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.lastInteractionAt, lastInteractionAt) ||
                other.lastInteractionAt == lastInteractionAt) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.isDineIn, isDineIn) ||
                other.isDineIn == isDineIn) &&
            const DeepCollectionEquality()
                .equals(other._cartItems, _cartItems) &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      startedAt,
      lastInteractionAt,
      languageCode,
      isDineIn,
      const DeepCollectionEquality().hash(_cartItems),
      currentStep);

  /// Create a copy of KioskSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KioskSessionImplCopyWith<_$KioskSessionImpl> get copyWith =>
      __$$KioskSessionImplCopyWithImpl<_$KioskSessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KioskSessionImplToJson(
      this,
    );
  }
}

abstract class _KioskSession extends KioskSession {
  const factory _KioskSession(
      {required final String uuid,
      required final DateTime startedAt,
      final DateTime? lastInteractionAt,
      final String languageCode,
      final bool isDineIn,
      final List<KioskCartItem> cartItems,
      final KioskFlowStep currentStep}) = _$KioskSessionImpl;
  const _KioskSession._() : super._();

  factory _KioskSession.fromJson(Map<String, dynamic> json) =
      _$KioskSessionImpl.fromJson;

  @override
  String get uuid;
  @override
  DateTime get startedAt; // Time session began
  @override
  DateTime? get lastInteractionAt; // For idle timeout logic
// Guest Preferences
  @override
  String get languageCode;
  @override
  bool get isDineIn; // Current Order State
  @override
  List<KioskCartItem> get cartItems; // Status
  @override
  KioskFlowStep get currentStep;

  /// Create a copy of KioskSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KioskSessionImplCopyWith<_$KioskSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KioskCartItem _$KioskCartItemFromJson(Map<String, dynamic> json) {
  return _KioskCartItem.fromJson(json);
}

/// @nodoc
mixin _$KioskCartItem {
  String get uuid => throw _privateConstructorUsedError;
  String get productUuid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get unitPrice => throw _privateConstructorUsedError;
  int get quantity =>
      throw _privateConstructorUsedError; // Image for visual confirmation
  String? get imageUrl =>
      throw _privateConstructorUsedError; // Selected options
  List<String> get modifiers => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this KioskCartItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KioskCartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KioskCartItemCopyWith<KioskCartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KioskCartItemCopyWith<$Res> {
  factory $KioskCartItemCopyWith(
          KioskCartItem value, $Res Function(KioskCartItem) then) =
      _$KioskCartItemCopyWithImpl<$Res, KioskCartItem>;
  @useResult
  $Res call(
      {String uuid,
      String productUuid,
      String name,
      double unitPrice,
      int quantity,
      String? imageUrl,
      List<String> modifiers,
      String? note});
}

/// @nodoc
class _$KioskCartItemCopyWithImpl<$Res, $Val extends KioskCartItem>
    implements $KioskCartItemCopyWith<$Res> {
  _$KioskCartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KioskCartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? productUuid = null,
    Object? name = null,
    Object? unitPrice = null,
    Object? quantity = null,
    Object? imageUrl = freezed,
    Object? modifiers = null,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      productUuid: null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiers: null == modifiers
          ? _value.modifiers
          : modifiers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KioskCartItemImplCopyWith<$Res>
    implements $KioskCartItemCopyWith<$Res> {
  factory _$$KioskCartItemImplCopyWith(
          _$KioskCartItemImpl value, $Res Function(_$KioskCartItemImpl) then) =
      __$$KioskCartItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String productUuid,
      String name,
      double unitPrice,
      int quantity,
      String? imageUrl,
      List<String> modifiers,
      String? note});
}

/// @nodoc
class __$$KioskCartItemImplCopyWithImpl<$Res>
    extends _$KioskCartItemCopyWithImpl<$Res, _$KioskCartItemImpl>
    implements _$$KioskCartItemImplCopyWith<$Res> {
  __$$KioskCartItemImplCopyWithImpl(
      _$KioskCartItemImpl _value, $Res Function(_$KioskCartItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of KioskCartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? productUuid = null,
    Object? name = null,
    Object? unitPrice = null,
    Object? quantity = null,
    Object? imageUrl = freezed,
    Object? modifiers = null,
    Object? note = freezed,
  }) {
    return _then(_$KioskCartItemImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      productUuid: null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiers: null == modifiers
          ? _value._modifiers
          : modifiers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KioskCartItemImpl implements _KioskCartItem {
  const _$KioskCartItemImpl(
      {required this.uuid,
      required this.productUuid,
      required this.name,
      required this.unitPrice,
      required this.quantity,
      this.imageUrl,
      final List<String> modifiers = const [],
      this.note})
      : _modifiers = modifiers;

  factory _$KioskCartItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$KioskCartItemImplFromJson(json);

  @override
  final String uuid;
  @override
  final String productUuid;
  @override
  final String name;
  @override
  final double unitPrice;
  @override
  final int quantity;
// Image for visual confirmation
  @override
  final String? imageUrl;
// Selected options
  final List<String> _modifiers;
// Selected options
  @override
  @JsonKey()
  List<String> get modifiers {
    if (_modifiers is EqualUnmodifiableListView) return _modifiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modifiers);
  }

  @override
  final String? note;

  @override
  String toString() {
    return 'KioskCartItem(uuid: $uuid, productUuid: $productUuid, name: $name, unitPrice: $unitPrice, quantity: $quantity, imageUrl: $imageUrl, modifiers: $modifiers, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KioskCartItemImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.productUuid, productUuid) ||
                other.productUuid == productUuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality()
                .equals(other._modifiers, _modifiers) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      productUuid,
      name,
      unitPrice,
      quantity,
      imageUrl,
      const DeepCollectionEquality().hash(_modifiers),
      note);

  /// Create a copy of KioskCartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KioskCartItemImplCopyWith<_$KioskCartItemImpl> get copyWith =>
      __$$KioskCartItemImplCopyWithImpl<_$KioskCartItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KioskCartItemImplToJson(
      this,
    );
  }
}

abstract class _KioskCartItem implements KioskCartItem {
  const factory _KioskCartItem(
      {required final String uuid,
      required final String productUuid,
      required final String name,
      required final double unitPrice,
      required final int quantity,
      final String? imageUrl,
      final List<String> modifiers,
      final String? note}) = _$KioskCartItemImpl;

  factory _KioskCartItem.fromJson(Map<String, dynamic> json) =
      _$KioskCartItemImpl.fromJson;

  @override
  String get uuid;
  @override
  String get productUuid;
  @override
  String get name;
  @override
  double get unitPrice;
  @override
  int get quantity; // Image for visual confirmation
  @override
  String? get imageUrl; // Selected options
  @override
  List<String> get modifiers;
  @override
  String? get note;

  /// Create a copy of KioskCartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KioskCartItemImplCopyWith<_$KioskCartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
