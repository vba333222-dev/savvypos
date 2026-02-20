// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tip_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Tip _$TipFromJson(Map<String, dynamic> json) {
  return _Tip.fromJson(json);
}

/// @nodoc
mixin _$Tip {
  String get uuid => throw _privateConstructorUsedError;
  String get orderUuid => throw _privateConstructorUsedError;
  String get orderNumber => throw _privateConstructorUsedError;
  TipType get type => throw _privateConstructorUsedError;
  double get amount =>
      throw _privateConstructorUsedError; // The employee who processed the tip
  String get processedByUuid => throw _privateConstructorUsedError;
  String get processedByName =>
      throw _privateConstructorUsedError; // If pooled, distribution will be handled separately
  bool get isPooled => throw _privateConstructorUsedError;
  String? get poolUuid => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Tip to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Tip
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TipCopyWith<Tip> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TipCopyWith<$Res> {
  factory $TipCopyWith(Tip value, $Res Function(Tip) then) =
      _$TipCopyWithImpl<$Res, Tip>;
  @useResult
  $Res call(
      {String uuid,
      String orderUuid,
      String orderNumber,
      TipType type,
      double amount,
      String processedByUuid,
      String processedByName,
      bool isPooled,
      String? poolUuid,
      String? notes,
      DateTime createdAt});
}

/// @nodoc
class _$TipCopyWithImpl<$Res, $Val extends Tip> implements $TipCopyWith<$Res> {
  _$TipCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Tip
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? orderUuid = null,
    Object? orderNumber = null,
    Object? type = null,
    Object? amount = null,
    Object? processedByUuid = null,
    Object? processedByName = null,
    Object? isPooled = null,
    Object? poolUuid = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      orderUuid: null == orderUuid
          ? _value.orderUuid
          : orderUuid // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TipType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      processedByUuid: null == processedByUuid
          ? _value.processedByUuid
          : processedByUuid // ignore: cast_nullable_to_non_nullable
              as String,
      processedByName: null == processedByName
          ? _value.processedByName
          : processedByName // ignore: cast_nullable_to_non_nullable
              as String,
      isPooled: null == isPooled
          ? _value.isPooled
          : isPooled // ignore: cast_nullable_to_non_nullable
              as bool,
      poolUuid: freezed == poolUuid
          ? _value.poolUuid
          : poolUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TipImplCopyWith<$Res> implements $TipCopyWith<$Res> {
  factory _$$TipImplCopyWith(_$TipImpl value, $Res Function(_$TipImpl) then) =
      __$$TipImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String orderUuid,
      String orderNumber,
      TipType type,
      double amount,
      String processedByUuid,
      String processedByName,
      bool isPooled,
      String? poolUuid,
      String? notes,
      DateTime createdAt});
}

/// @nodoc
class __$$TipImplCopyWithImpl<$Res> extends _$TipCopyWithImpl<$Res, _$TipImpl>
    implements _$$TipImplCopyWith<$Res> {
  __$$TipImplCopyWithImpl(_$TipImpl _value, $Res Function(_$TipImpl) _then)
      : super(_value, _then);

  /// Create a copy of Tip
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? orderUuid = null,
    Object? orderNumber = null,
    Object? type = null,
    Object? amount = null,
    Object? processedByUuid = null,
    Object? processedByName = null,
    Object? isPooled = null,
    Object? poolUuid = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$TipImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      orderUuid: null == orderUuid
          ? _value.orderUuid
          : orderUuid // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TipType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      processedByUuid: null == processedByUuid
          ? _value.processedByUuid
          : processedByUuid // ignore: cast_nullable_to_non_nullable
              as String,
      processedByName: null == processedByName
          ? _value.processedByName
          : processedByName // ignore: cast_nullable_to_non_nullable
              as String,
      isPooled: null == isPooled
          ? _value.isPooled
          : isPooled // ignore: cast_nullable_to_non_nullable
              as bool,
      poolUuid: freezed == poolUuid
          ? _value.poolUuid
          : poolUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TipImpl implements _Tip {
  const _$TipImpl(
      {required this.uuid,
      required this.orderUuid,
      required this.orderNumber,
      required this.type,
      required this.amount,
      required this.processedByUuid,
      required this.processedByName,
      this.isPooled = false,
      this.poolUuid,
      this.notes,
      required this.createdAt});

  factory _$TipImpl.fromJson(Map<String, dynamic> json) =>
      _$$TipImplFromJson(json);

  @override
  final String uuid;
  @override
  final String orderUuid;
  @override
  final String orderNumber;
  @override
  final TipType type;
  @override
  final double amount;
// The employee who processed the tip
  @override
  final String processedByUuid;
  @override
  final String processedByName;
// If pooled, distribution will be handled separately
  @override
  @JsonKey()
  final bool isPooled;
  @override
  final String? poolUuid;
  @override
  final String? notes;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Tip(uuid: $uuid, orderUuid: $orderUuid, orderNumber: $orderNumber, type: $type, amount: $amount, processedByUuid: $processedByUuid, processedByName: $processedByName, isPooled: $isPooled, poolUuid: $poolUuid, notes: $notes, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TipImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.orderUuid, orderUuid) ||
                other.orderUuid == orderUuid) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.processedByUuid, processedByUuid) ||
                other.processedByUuid == processedByUuid) &&
            (identical(other.processedByName, processedByName) ||
                other.processedByName == processedByName) &&
            (identical(other.isPooled, isPooled) ||
                other.isPooled == isPooled) &&
            (identical(other.poolUuid, poolUuid) ||
                other.poolUuid == poolUuid) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      orderUuid,
      orderNumber,
      type,
      amount,
      processedByUuid,
      processedByName,
      isPooled,
      poolUuid,
      notes,
      createdAt);

  /// Create a copy of Tip
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TipImplCopyWith<_$TipImpl> get copyWith =>
      __$$TipImplCopyWithImpl<_$TipImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TipImplToJson(
      this,
    );
  }
}

abstract class _Tip implements Tip {
  const factory _Tip(
      {required final String uuid,
      required final String orderUuid,
      required final String orderNumber,
      required final TipType type,
      required final double amount,
      required final String processedByUuid,
      required final String processedByName,
      final bool isPooled,
      final String? poolUuid,
      final String? notes,
      required final DateTime createdAt}) = _$TipImpl;

  factory _Tip.fromJson(Map<String, dynamic> json) = _$TipImpl.fromJson;

  @override
  String get uuid;
  @override
  String get orderUuid;
  @override
  String get orderNumber;
  @override
  TipType get type;
  @override
  double get amount; // The employee who processed the tip
  @override
  String get processedByUuid;
  @override
  String
      get processedByName; // If pooled, distribution will be handled separately
  @override
  bool get isPooled;
  @override
  String? get poolUuid;
  @override
  String? get notes;
  @override
  DateTime get createdAt;

  /// Create a copy of Tip
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TipImplCopyWith<_$TipImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TipPool _$TipPoolFromJson(Map<String, dynamic> json) {
  return _TipPool.fromJson(json);
}

/// @nodoc
mixin _$TipPool {
  String get uuid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  TipPoolMethod get method => throw _privateConstructorUsedError;
  bool get isActive =>
      throw _privateConstructorUsedError; // Role-based percentages (JSON: {"server": 60, "bartender": 30, "busser": 10})
  Map<String, int> get rolePercentages =>
      throw _privateConstructorUsedError; // Role-based points (for points method)
  Map<String, double> get rolePoints =>
      throw _privateConstructorUsedError; // Excluded roles (e.g., managers)
  List<String> get excludedRoles => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this TipPool to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TipPool
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TipPoolCopyWith<TipPool> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TipPoolCopyWith<$Res> {
  factory $TipPoolCopyWith(TipPool value, $Res Function(TipPool) then) =
      _$TipPoolCopyWithImpl<$Res, TipPool>;
  @useResult
  $Res call(
      {String uuid,
      String name,
      TipPoolMethod method,
      bool isActive,
      Map<String, int> rolePercentages,
      Map<String, double> rolePoints,
      List<String> excludedRoles,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$TipPoolCopyWithImpl<$Res, $Val extends TipPool>
    implements $TipPoolCopyWith<$Res> {
  _$TipPoolCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TipPool
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? method = null,
    Object? isActive = null,
    Object? rolePercentages = null,
    Object? rolePoints = null,
    Object? excludedRoles = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as TipPoolMethod,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      rolePercentages: null == rolePercentages
          ? _value.rolePercentages
          : rolePercentages // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      rolePoints: null == rolePoints
          ? _value.rolePoints
          : rolePoints // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      excludedRoles: null == excludedRoles
          ? _value.excludedRoles
          : excludedRoles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TipPoolImplCopyWith<$Res> implements $TipPoolCopyWith<$Res> {
  factory _$$TipPoolImplCopyWith(
          _$TipPoolImpl value, $Res Function(_$TipPoolImpl) then) =
      __$$TipPoolImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String name,
      TipPoolMethod method,
      bool isActive,
      Map<String, int> rolePercentages,
      Map<String, double> rolePoints,
      List<String> excludedRoles,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$TipPoolImplCopyWithImpl<$Res>
    extends _$TipPoolCopyWithImpl<$Res, _$TipPoolImpl>
    implements _$$TipPoolImplCopyWith<$Res> {
  __$$TipPoolImplCopyWithImpl(
      _$TipPoolImpl _value, $Res Function(_$TipPoolImpl) _then)
      : super(_value, _then);

  /// Create a copy of TipPool
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? method = null,
    Object? isActive = null,
    Object? rolePercentages = null,
    Object? rolePoints = null,
    Object? excludedRoles = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$TipPoolImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as TipPoolMethod,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      rolePercentages: null == rolePercentages
          ? _value._rolePercentages
          : rolePercentages // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      rolePoints: null == rolePoints
          ? _value._rolePoints
          : rolePoints // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      excludedRoles: null == excludedRoles
          ? _value._excludedRoles
          : excludedRoles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TipPoolImpl implements _TipPool {
  const _$TipPoolImpl(
      {required this.uuid,
      required this.name,
      this.method = TipPoolMethod.equal,
      this.isActive = true,
      final Map<String, int> rolePercentages = const {},
      final Map<String, double> rolePoints = const {},
      final List<String> excludedRoles = const [],
      this.createdAt,
      this.updatedAt})
      : _rolePercentages = rolePercentages,
        _rolePoints = rolePoints,
        _excludedRoles = excludedRoles;

  factory _$TipPoolImpl.fromJson(Map<String, dynamic> json) =>
      _$$TipPoolImplFromJson(json);

  @override
  final String uuid;
  @override
  final String name;
  @override
  @JsonKey()
  final TipPoolMethod method;
  @override
  @JsonKey()
  final bool isActive;
// Role-based percentages (JSON: {"server": 60, "bartender": 30, "busser": 10})
  final Map<String, int> _rolePercentages;
// Role-based percentages (JSON: {"server": 60, "bartender": 30, "busser": 10})
  @override
  @JsonKey()
  Map<String, int> get rolePercentages {
    if (_rolePercentages is EqualUnmodifiableMapView) return _rolePercentages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rolePercentages);
  }

// Role-based points (for points method)
  final Map<String, double> _rolePoints;
// Role-based points (for points method)
  @override
  @JsonKey()
  Map<String, double> get rolePoints {
    if (_rolePoints is EqualUnmodifiableMapView) return _rolePoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rolePoints);
  }

// Excluded roles (e.g., managers)
  final List<String> _excludedRoles;
// Excluded roles (e.g., managers)
  @override
  @JsonKey()
  List<String> get excludedRoles {
    if (_excludedRoles is EqualUnmodifiableListView) return _excludedRoles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_excludedRoles);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'TipPool(uuid: $uuid, name: $name, method: $method, isActive: $isActive, rolePercentages: $rolePercentages, rolePoints: $rolePoints, excludedRoles: $excludedRoles, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TipPoolImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._rolePercentages, _rolePercentages) &&
            const DeepCollectionEquality()
                .equals(other._rolePoints, _rolePoints) &&
            const DeepCollectionEquality()
                .equals(other._excludedRoles, _excludedRoles) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      name,
      method,
      isActive,
      const DeepCollectionEquality().hash(_rolePercentages),
      const DeepCollectionEquality().hash(_rolePoints),
      const DeepCollectionEquality().hash(_excludedRoles),
      createdAt,
      updatedAt);

  /// Create a copy of TipPool
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TipPoolImplCopyWith<_$TipPoolImpl> get copyWith =>
      __$$TipPoolImplCopyWithImpl<_$TipPoolImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TipPoolImplToJson(
      this,
    );
  }
}

abstract class _TipPool implements TipPool {
  const factory _TipPool(
      {required final String uuid,
      required final String name,
      final TipPoolMethod method,
      final bool isActive,
      final Map<String, int> rolePercentages,
      final Map<String, double> rolePoints,
      final List<String> excludedRoles,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$TipPoolImpl;

  factory _TipPool.fromJson(Map<String, dynamic> json) = _$TipPoolImpl.fromJson;

  @override
  String get uuid;
  @override
  String get name;
  @override
  TipPoolMethod get method;
  @override
  bool
      get isActive; // Role-based percentages (JSON: {"server": 60, "bartender": 30, "busser": 10})
  @override
  Map<String, int> get rolePercentages; // Role-based points (for points method)
  @override
  Map<String, double> get rolePoints; // Excluded roles (e.g., managers)
  @override
  List<String> get excludedRoles;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of TipPool
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TipPoolImplCopyWith<_$TipPoolImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TipDistribution _$TipDistributionFromJson(Map<String, dynamic> json) {
  return _TipDistribution.fromJson(json);
}

/// @nodoc
mixin _$TipDistribution {
  String get uuid => throw _privateConstructorUsedError;
  String get tipUuid =>
      throw _privateConstructorUsedError; // Link to original tip
  String get employeeUuid => throw _privateConstructorUsedError;
  String get employeeName => throw _privateConstructorUsedError;
  String get employeeRole => throw _privateConstructorUsedError;
  double get amount =>
      throw _privateConstructorUsedError; // Distribution metadata
  double get percentage =>
      throw _privateConstructorUsedError; // What % of pool they received
  double? get hoursWorked =>
      throw _privateConstructorUsedError; // If hours-based
  double? get pointsEarned =>
      throw _privateConstructorUsedError; // If points-based
  bool get isPaidOut => throw _privateConstructorUsedError;
  DateTime? get paidOutAt => throw _privateConstructorUsedError;
  String? get paidOutByUuid => throw _privateConstructorUsedError;
  DateTime get distributedAt => throw _privateConstructorUsedError;

  /// Serializes this TipDistribution to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TipDistribution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TipDistributionCopyWith<TipDistribution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TipDistributionCopyWith<$Res> {
  factory $TipDistributionCopyWith(
          TipDistribution value, $Res Function(TipDistribution) then) =
      _$TipDistributionCopyWithImpl<$Res, TipDistribution>;
  @useResult
  $Res call(
      {String uuid,
      String tipUuid,
      String employeeUuid,
      String employeeName,
      String employeeRole,
      double amount,
      double percentage,
      double? hoursWorked,
      double? pointsEarned,
      bool isPaidOut,
      DateTime? paidOutAt,
      String? paidOutByUuid,
      DateTime distributedAt});
}

/// @nodoc
class _$TipDistributionCopyWithImpl<$Res, $Val extends TipDistribution>
    implements $TipDistributionCopyWith<$Res> {
  _$TipDistributionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TipDistribution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? tipUuid = null,
    Object? employeeUuid = null,
    Object? employeeName = null,
    Object? employeeRole = null,
    Object? amount = null,
    Object? percentage = null,
    Object? hoursWorked = freezed,
    Object? pointsEarned = freezed,
    Object? isPaidOut = null,
    Object? paidOutAt = freezed,
    Object? paidOutByUuid = freezed,
    Object? distributedAt = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      tipUuid: null == tipUuid
          ? _value.tipUuid
          : tipUuid // ignore: cast_nullable_to_non_nullable
              as String,
      employeeUuid: null == employeeUuid
          ? _value.employeeUuid
          : employeeUuid // ignore: cast_nullable_to_non_nullable
              as String,
      employeeName: null == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      employeeRole: null == employeeRole
          ? _value.employeeRole
          : employeeRole // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      hoursWorked: freezed == hoursWorked
          ? _value.hoursWorked
          : hoursWorked // ignore: cast_nullable_to_non_nullable
              as double?,
      pointsEarned: freezed == pointsEarned
          ? _value.pointsEarned
          : pointsEarned // ignore: cast_nullable_to_non_nullable
              as double?,
      isPaidOut: null == isPaidOut
          ? _value.isPaidOut
          : isPaidOut // ignore: cast_nullable_to_non_nullable
              as bool,
      paidOutAt: freezed == paidOutAt
          ? _value.paidOutAt
          : paidOutAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paidOutByUuid: freezed == paidOutByUuid
          ? _value.paidOutByUuid
          : paidOutByUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      distributedAt: null == distributedAt
          ? _value.distributedAt
          : distributedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TipDistributionImplCopyWith<$Res>
    implements $TipDistributionCopyWith<$Res> {
  factory _$$TipDistributionImplCopyWith(_$TipDistributionImpl value,
          $Res Function(_$TipDistributionImpl) then) =
      __$$TipDistributionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String tipUuid,
      String employeeUuid,
      String employeeName,
      String employeeRole,
      double amount,
      double percentage,
      double? hoursWorked,
      double? pointsEarned,
      bool isPaidOut,
      DateTime? paidOutAt,
      String? paidOutByUuid,
      DateTime distributedAt});
}

/// @nodoc
class __$$TipDistributionImplCopyWithImpl<$Res>
    extends _$TipDistributionCopyWithImpl<$Res, _$TipDistributionImpl>
    implements _$$TipDistributionImplCopyWith<$Res> {
  __$$TipDistributionImplCopyWithImpl(
      _$TipDistributionImpl _value, $Res Function(_$TipDistributionImpl) _then)
      : super(_value, _then);

  /// Create a copy of TipDistribution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? tipUuid = null,
    Object? employeeUuid = null,
    Object? employeeName = null,
    Object? employeeRole = null,
    Object? amount = null,
    Object? percentage = null,
    Object? hoursWorked = freezed,
    Object? pointsEarned = freezed,
    Object? isPaidOut = null,
    Object? paidOutAt = freezed,
    Object? paidOutByUuid = freezed,
    Object? distributedAt = null,
  }) {
    return _then(_$TipDistributionImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      tipUuid: null == tipUuid
          ? _value.tipUuid
          : tipUuid // ignore: cast_nullable_to_non_nullable
              as String,
      employeeUuid: null == employeeUuid
          ? _value.employeeUuid
          : employeeUuid // ignore: cast_nullable_to_non_nullable
              as String,
      employeeName: null == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      employeeRole: null == employeeRole
          ? _value.employeeRole
          : employeeRole // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      hoursWorked: freezed == hoursWorked
          ? _value.hoursWorked
          : hoursWorked // ignore: cast_nullable_to_non_nullable
              as double?,
      pointsEarned: freezed == pointsEarned
          ? _value.pointsEarned
          : pointsEarned // ignore: cast_nullable_to_non_nullable
              as double?,
      isPaidOut: null == isPaidOut
          ? _value.isPaidOut
          : isPaidOut // ignore: cast_nullable_to_non_nullable
              as bool,
      paidOutAt: freezed == paidOutAt
          ? _value.paidOutAt
          : paidOutAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paidOutByUuid: freezed == paidOutByUuid
          ? _value.paidOutByUuid
          : paidOutByUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      distributedAt: null == distributedAt
          ? _value.distributedAt
          : distributedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TipDistributionImpl implements _TipDistribution {
  const _$TipDistributionImpl(
      {required this.uuid,
      required this.tipUuid,
      required this.employeeUuid,
      required this.employeeName,
      required this.employeeRole,
      required this.amount,
      required this.percentage,
      this.hoursWorked,
      this.pointsEarned,
      this.isPaidOut = false,
      this.paidOutAt,
      this.paidOutByUuid,
      required this.distributedAt});

  factory _$TipDistributionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TipDistributionImplFromJson(json);

  @override
  final String uuid;
  @override
  final String tipUuid;
// Link to original tip
  @override
  final String employeeUuid;
  @override
  final String employeeName;
  @override
  final String employeeRole;
  @override
  final double amount;
// Distribution metadata
  @override
  final double percentage;
// What % of pool they received
  @override
  final double? hoursWorked;
// If hours-based
  @override
  final double? pointsEarned;
// If points-based
  @override
  @JsonKey()
  final bool isPaidOut;
  @override
  final DateTime? paidOutAt;
  @override
  final String? paidOutByUuid;
  @override
  final DateTime distributedAt;

  @override
  String toString() {
    return 'TipDistribution(uuid: $uuid, tipUuid: $tipUuid, employeeUuid: $employeeUuid, employeeName: $employeeName, employeeRole: $employeeRole, amount: $amount, percentage: $percentage, hoursWorked: $hoursWorked, pointsEarned: $pointsEarned, isPaidOut: $isPaidOut, paidOutAt: $paidOutAt, paidOutByUuid: $paidOutByUuid, distributedAt: $distributedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TipDistributionImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.tipUuid, tipUuid) || other.tipUuid == tipUuid) &&
            (identical(other.employeeUuid, employeeUuid) ||
                other.employeeUuid == employeeUuid) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.employeeRole, employeeRole) ||
                other.employeeRole == employeeRole) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.hoursWorked, hoursWorked) ||
                other.hoursWorked == hoursWorked) &&
            (identical(other.pointsEarned, pointsEarned) ||
                other.pointsEarned == pointsEarned) &&
            (identical(other.isPaidOut, isPaidOut) ||
                other.isPaidOut == isPaidOut) &&
            (identical(other.paidOutAt, paidOutAt) ||
                other.paidOutAt == paidOutAt) &&
            (identical(other.paidOutByUuid, paidOutByUuid) ||
                other.paidOutByUuid == paidOutByUuid) &&
            (identical(other.distributedAt, distributedAt) ||
                other.distributedAt == distributedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      tipUuid,
      employeeUuid,
      employeeName,
      employeeRole,
      amount,
      percentage,
      hoursWorked,
      pointsEarned,
      isPaidOut,
      paidOutAt,
      paidOutByUuid,
      distributedAt);

  /// Create a copy of TipDistribution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TipDistributionImplCopyWith<_$TipDistributionImpl> get copyWith =>
      __$$TipDistributionImplCopyWithImpl<_$TipDistributionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TipDistributionImplToJson(
      this,
    );
  }
}

abstract class _TipDistribution implements TipDistribution {
  const factory _TipDistribution(
      {required final String uuid,
      required final String tipUuid,
      required final String employeeUuid,
      required final String employeeName,
      required final String employeeRole,
      required final double amount,
      required final double percentage,
      final double? hoursWorked,
      final double? pointsEarned,
      final bool isPaidOut,
      final DateTime? paidOutAt,
      final String? paidOutByUuid,
      required final DateTime distributedAt}) = _$TipDistributionImpl;

  factory _TipDistribution.fromJson(Map<String, dynamic> json) =
      _$TipDistributionImpl.fromJson;

  @override
  String get uuid;
  @override
  String get tipUuid; // Link to original tip
  @override
  String get employeeUuid;
  @override
  String get employeeName;
  @override
  String get employeeRole;
  @override
  double get amount; // Distribution metadata
  @override
  double get percentage; // What % of pool they received
  @override
  double? get hoursWorked; // If hours-based
  @override
  double? get pointsEarned; // If points-based
  @override
  bool get isPaidOut;
  @override
  DateTime? get paidOutAt;
  @override
  String? get paidOutByUuid;
  @override
  DateTime get distributedAt;

  /// Create a copy of TipDistribution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TipDistributionImplCopyWith<_$TipDistributionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TipReport _$TipReportFromJson(Map<String, dynamic> json) {
  return _TipReport.fromJson(json);
}

/// @nodoc
mixin _$TipReport {
  double get totalTips => throw _privateConstructorUsedError;
  double get cashTips => throw _privateConstructorUsedError;
  double get cardTips => throw _privateConstructorUsedError;
  int get tipCount => throw _privateConstructorUsedError;
  double get averageTip => throw _privateConstructorUsedError;
  double get averageTipPercentage =>
      throw _privateConstructorUsedError; // vs order total
// Top earners
  List<TipEmployeeSummary> get employeeSummaries =>
      throw _privateConstructorUsedError;
  DateTime? get periodStart => throw _privateConstructorUsedError;
  DateTime? get periodEnd => throw _privateConstructorUsedError;

  /// Serializes this TipReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TipReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TipReportCopyWith<TipReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TipReportCopyWith<$Res> {
  factory $TipReportCopyWith(TipReport value, $Res Function(TipReport) then) =
      _$TipReportCopyWithImpl<$Res, TipReport>;
  @useResult
  $Res call(
      {double totalTips,
      double cashTips,
      double cardTips,
      int tipCount,
      double averageTip,
      double averageTipPercentage,
      List<TipEmployeeSummary> employeeSummaries,
      DateTime? periodStart,
      DateTime? periodEnd});
}

/// @nodoc
class _$TipReportCopyWithImpl<$Res, $Val extends TipReport>
    implements $TipReportCopyWith<$Res> {
  _$TipReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TipReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTips = null,
    Object? cashTips = null,
    Object? cardTips = null,
    Object? tipCount = null,
    Object? averageTip = null,
    Object? averageTipPercentage = null,
    Object? employeeSummaries = null,
    Object? periodStart = freezed,
    Object? periodEnd = freezed,
  }) {
    return _then(_value.copyWith(
      totalTips: null == totalTips
          ? _value.totalTips
          : totalTips // ignore: cast_nullable_to_non_nullable
              as double,
      cashTips: null == cashTips
          ? _value.cashTips
          : cashTips // ignore: cast_nullable_to_non_nullable
              as double,
      cardTips: null == cardTips
          ? _value.cardTips
          : cardTips // ignore: cast_nullable_to_non_nullable
              as double,
      tipCount: null == tipCount
          ? _value.tipCount
          : tipCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageTip: null == averageTip
          ? _value.averageTip
          : averageTip // ignore: cast_nullable_to_non_nullable
              as double,
      averageTipPercentage: null == averageTipPercentage
          ? _value.averageTipPercentage
          : averageTipPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      employeeSummaries: null == employeeSummaries
          ? _value.employeeSummaries
          : employeeSummaries // ignore: cast_nullable_to_non_nullable
              as List<TipEmployeeSummary>,
      periodStart: freezed == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      periodEnd: freezed == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TipReportImplCopyWith<$Res>
    implements $TipReportCopyWith<$Res> {
  factory _$$TipReportImplCopyWith(
          _$TipReportImpl value, $Res Function(_$TipReportImpl) then) =
      __$$TipReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double totalTips,
      double cashTips,
      double cardTips,
      int tipCount,
      double averageTip,
      double averageTipPercentage,
      List<TipEmployeeSummary> employeeSummaries,
      DateTime? periodStart,
      DateTime? periodEnd});
}

/// @nodoc
class __$$TipReportImplCopyWithImpl<$Res>
    extends _$TipReportCopyWithImpl<$Res, _$TipReportImpl>
    implements _$$TipReportImplCopyWith<$Res> {
  __$$TipReportImplCopyWithImpl(
      _$TipReportImpl _value, $Res Function(_$TipReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of TipReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTips = null,
    Object? cashTips = null,
    Object? cardTips = null,
    Object? tipCount = null,
    Object? averageTip = null,
    Object? averageTipPercentage = null,
    Object? employeeSummaries = null,
    Object? periodStart = freezed,
    Object? periodEnd = freezed,
  }) {
    return _then(_$TipReportImpl(
      totalTips: null == totalTips
          ? _value.totalTips
          : totalTips // ignore: cast_nullable_to_non_nullable
              as double,
      cashTips: null == cashTips
          ? _value.cashTips
          : cashTips // ignore: cast_nullable_to_non_nullable
              as double,
      cardTips: null == cardTips
          ? _value.cardTips
          : cardTips // ignore: cast_nullable_to_non_nullable
              as double,
      tipCount: null == tipCount
          ? _value.tipCount
          : tipCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageTip: null == averageTip
          ? _value.averageTip
          : averageTip // ignore: cast_nullable_to_non_nullable
              as double,
      averageTipPercentage: null == averageTipPercentage
          ? _value.averageTipPercentage
          : averageTipPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      employeeSummaries: null == employeeSummaries
          ? _value._employeeSummaries
          : employeeSummaries // ignore: cast_nullable_to_non_nullable
              as List<TipEmployeeSummary>,
      periodStart: freezed == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      periodEnd: freezed == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TipReportImpl implements _TipReport {
  const _$TipReportImpl(
      {required this.totalTips,
      required this.cashTips,
      required this.cardTips,
      required this.tipCount,
      required this.averageTip,
      required this.averageTipPercentage,
      final List<TipEmployeeSummary> employeeSummaries = const [],
      this.periodStart,
      this.periodEnd})
      : _employeeSummaries = employeeSummaries;

  factory _$TipReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$TipReportImplFromJson(json);

  @override
  final double totalTips;
  @override
  final double cashTips;
  @override
  final double cardTips;
  @override
  final int tipCount;
  @override
  final double averageTip;
  @override
  final double averageTipPercentage;
// vs order total
// Top earners
  final List<TipEmployeeSummary> _employeeSummaries;
// vs order total
// Top earners
  @override
  @JsonKey()
  List<TipEmployeeSummary> get employeeSummaries {
    if (_employeeSummaries is EqualUnmodifiableListView)
      return _employeeSummaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_employeeSummaries);
  }

  @override
  final DateTime? periodStart;
  @override
  final DateTime? periodEnd;

  @override
  String toString() {
    return 'TipReport(totalTips: $totalTips, cashTips: $cashTips, cardTips: $cardTips, tipCount: $tipCount, averageTip: $averageTip, averageTipPercentage: $averageTipPercentage, employeeSummaries: $employeeSummaries, periodStart: $periodStart, periodEnd: $periodEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TipReportImpl &&
            (identical(other.totalTips, totalTips) ||
                other.totalTips == totalTips) &&
            (identical(other.cashTips, cashTips) ||
                other.cashTips == cashTips) &&
            (identical(other.cardTips, cardTips) ||
                other.cardTips == cardTips) &&
            (identical(other.tipCount, tipCount) ||
                other.tipCount == tipCount) &&
            (identical(other.averageTip, averageTip) ||
                other.averageTip == averageTip) &&
            (identical(other.averageTipPercentage, averageTipPercentage) ||
                other.averageTipPercentage == averageTipPercentage) &&
            const DeepCollectionEquality()
                .equals(other._employeeSummaries, _employeeSummaries) &&
            (identical(other.periodStart, periodStart) ||
                other.periodStart == periodStart) &&
            (identical(other.periodEnd, periodEnd) ||
                other.periodEnd == periodEnd));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalTips,
      cashTips,
      cardTips,
      tipCount,
      averageTip,
      averageTipPercentage,
      const DeepCollectionEquality().hash(_employeeSummaries),
      periodStart,
      periodEnd);

  /// Create a copy of TipReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TipReportImplCopyWith<_$TipReportImpl> get copyWith =>
      __$$TipReportImplCopyWithImpl<_$TipReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TipReportImplToJson(
      this,
    );
  }
}

abstract class _TipReport implements TipReport {
  const factory _TipReport(
      {required final double totalTips,
      required final double cashTips,
      required final double cardTips,
      required final int tipCount,
      required final double averageTip,
      required final double averageTipPercentage,
      final List<TipEmployeeSummary> employeeSummaries,
      final DateTime? periodStart,
      final DateTime? periodEnd}) = _$TipReportImpl;

  factory _TipReport.fromJson(Map<String, dynamic> json) =
      _$TipReportImpl.fromJson;

  @override
  double get totalTips;
  @override
  double get cashTips;
  @override
  double get cardTips;
  @override
  int get tipCount;
  @override
  double get averageTip;
  @override
  double get averageTipPercentage; // vs order total
// Top earners
  @override
  List<TipEmployeeSummary> get employeeSummaries;
  @override
  DateTime? get periodStart;
  @override
  DateTime? get periodEnd;

  /// Create a copy of TipReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TipReportImplCopyWith<_$TipReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TipEmployeeSummary _$TipEmployeeSummaryFromJson(Map<String, dynamic> json) {
  return _TipEmployeeSummary.fromJson(json);
}

/// @nodoc
mixin _$TipEmployeeSummary {
  String get employeeUuid => throw _privateConstructorUsedError;
  String get employeeName => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  double get totalTips => throw _privateConstructorUsedError;
  int get ordersServed => throw _privateConstructorUsedError;
  double get averageTipPerOrder => throw _privateConstructorUsedError;
  double get hoursWorked => throw _privateConstructorUsedError;
  double get tipsPerHour => throw _privateConstructorUsedError;

  /// Serializes this TipEmployeeSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TipEmployeeSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TipEmployeeSummaryCopyWith<TipEmployeeSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TipEmployeeSummaryCopyWith<$Res> {
  factory $TipEmployeeSummaryCopyWith(
          TipEmployeeSummary value, $Res Function(TipEmployeeSummary) then) =
      _$TipEmployeeSummaryCopyWithImpl<$Res, TipEmployeeSummary>;
  @useResult
  $Res call(
      {String employeeUuid,
      String employeeName,
      String role,
      double totalTips,
      int ordersServed,
      double averageTipPerOrder,
      double hoursWorked,
      double tipsPerHour});
}

/// @nodoc
class _$TipEmployeeSummaryCopyWithImpl<$Res, $Val extends TipEmployeeSummary>
    implements $TipEmployeeSummaryCopyWith<$Res> {
  _$TipEmployeeSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TipEmployeeSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeUuid = null,
    Object? employeeName = null,
    Object? role = null,
    Object? totalTips = null,
    Object? ordersServed = null,
    Object? averageTipPerOrder = null,
    Object? hoursWorked = null,
    Object? tipsPerHour = null,
  }) {
    return _then(_value.copyWith(
      employeeUuid: null == employeeUuid
          ? _value.employeeUuid
          : employeeUuid // ignore: cast_nullable_to_non_nullable
              as String,
      employeeName: null == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      totalTips: null == totalTips
          ? _value.totalTips
          : totalTips // ignore: cast_nullable_to_non_nullable
              as double,
      ordersServed: null == ordersServed
          ? _value.ordersServed
          : ordersServed // ignore: cast_nullable_to_non_nullable
              as int,
      averageTipPerOrder: null == averageTipPerOrder
          ? _value.averageTipPerOrder
          : averageTipPerOrder // ignore: cast_nullable_to_non_nullable
              as double,
      hoursWorked: null == hoursWorked
          ? _value.hoursWorked
          : hoursWorked // ignore: cast_nullable_to_non_nullable
              as double,
      tipsPerHour: null == tipsPerHour
          ? _value.tipsPerHour
          : tipsPerHour // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TipEmployeeSummaryImplCopyWith<$Res>
    implements $TipEmployeeSummaryCopyWith<$Res> {
  factory _$$TipEmployeeSummaryImplCopyWith(_$TipEmployeeSummaryImpl value,
          $Res Function(_$TipEmployeeSummaryImpl) then) =
      __$$TipEmployeeSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String employeeUuid,
      String employeeName,
      String role,
      double totalTips,
      int ordersServed,
      double averageTipPerOrder,
      double hoursWorked,
      double tipsPerHour});
}

/// @nodoc
class __$$TipEmployeeSummaryImplCopyWithImpl<$Res>
    extends _$TipEmployeeSummaryCopyWithImpl<$Res, _$TipEmployeeSummaryImpl>
    implements _$$TipEmployeeSummaryImplCopyWith<$Res> {
  __$$TipEmployeeSummaryImplCopyWithImpl(_$TipEmployeeSummaryImpl _value,
      $Res Function(_$TipEmployeeSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of TipEmployeeSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeUuid = null,
    Object? employeeName = null,
    Object? role = null,
    Object? totalTips = null,
    Object? ordersServed = null,
    Object? averageTipPerOrder = null,
    Object? hoursWorked = null,
    Object? tipsPerHour = null,
  }) {
    return _then(_$TipEmployeeSummaryImpl(
      employeeUuid: null == employeeUuid
          ? _value.employeeUuid
          : employeeUuid // ignore: cast_nullable_to_non_nullable
              as String,
      employeeName: null == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      totalTips: null == totalTips
          ? _value.totalTips
          : totalTips // ignore: cast_nullable_to_non_nullable
              as double,
      ordersServed: null == ordersServed
          ? _value.ordersServed
          : ordersServed // ignore: cast_nullable_to_non_nullable
              as int,
      averageTipPerOrder: null == averageTipPerOrder
          ? _value.averageTipPerOrder
          : averageTipPerOrder // ignore: cast_nullable_to_non_nullable
              as double,
      hoursWorked: null == hoursWorked
          ? _value.hoursWorked
          : hoursWorked // ignore: cast_nullable_to_non_nullable
              as double,
      tipsPerHour: null == tipsPerHour
          ? _value.tipsPerHour
          : tipsPerHour // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TipEmployeeSummaryImpl implements _TipEmployeeSummary {
  const _$TipEmployeeSummaryImpl(
      {required this.employeeUuid,
      required this.employeeName,
      required this.role,
      required this.totalTips,
      required this.ordersServed,
      required this.averageTipPerOrder,
      required this.hoursWorked,
      required this.tipsPerHour});

  factory _$TipEmployeeSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TipEmployeeSummaryImplFromJson(json);

  @override
  final String employeeUuid;
  @override
  final String employeeName;
  @override
  final String role;
  @override
  final double totalTips;
  @override
  final int ordersServed;
  @override
  final double averageTipPerOrder;
  @override
  final double hoursWorked;
  @override
  final double tipsPerHour;

  @override
  String toString() {
    return 'TipEmployeeSummary(employeeUuid: $employeeUuid, employeeName: $employeeName, role: $role, totalTips: $totalTips, ordersServed: $ordersServed, averageTipPerOrder: $averageTipPerOrder, hoursWorked: $hoursWorked, tipsPerHour: $tipsPerHour)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TipEmployeeSummaryImpl &&
            (identical(other.employeeUuid, employeeUuid) ||
                other.employeeUuid == employeeUuid) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.totalTips, totalTips) ||
                other.totalTips == totalTips) &&
            (identical(other.ordersServed, ordersServed) ||
                other.ordersServed == ordersServed) &&
            (identical(other.averageTipPerOrder, averageTipPerOrder) ||
                other.averageTipPerOrder == averageTipPerOrder) &&
            (identical(other.hoursWorked, hoursWorked) ||
                other.hoursWorked == hoursWorked) &&
            (identical(other.tipsPerHour, tipsPerHour) ||
                other.tipsPerHour == tipsPerHour));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, employeeUuid, employeeName, role,
      totalTips, ordersServed, averageTipPerOrder, hoursWorked, tipsPerHour);

  /// Create a copy of TipEmployeeSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TipEmployeeSummaryImplCopyWith<_$TipEmployeeSummaryImpl> get copyWith =>
      __$$TipEmployeeSummaryImplCopyWithImpl<_$TipEmployeeSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TipEmployeeSummaryImplToJson(
      this,
    );
  }
}

abstract class _TipEmployeeSummary implements TipEmployeeSummary {
  const factory _TipEmployeeSummary(
      {required final String employeeUuid,
      required final String employeeName,
      required final String role,
      required final double totalTips,
      required final int ordersServed,
      required final double averageTipPerOrder,
      required final double hoursWorked,
      required final double tipsPerHour}) = _$TipEmployeeSummaryImpl;

  factory _TipEmployeeSummary.fromJson(Map<String, dynamic> json) =
      _$TipEmployeeSummaryImpl.fromJson;

  @override
  String get employeeUuid;
  @override
  String get employeeName;
  @override
  String get role;
  @override
  double get totalTips;
  @override
  int get ordersServed;
  @override
  double get averageTipPerOrder;
  @override
  double get hoursWorked;
  @override
  double get tipsPerHour;

  /// Create a copy of TipEmployeeSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TipEmployeeSummaryImplCopyWith<_$TipEmployeeSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
