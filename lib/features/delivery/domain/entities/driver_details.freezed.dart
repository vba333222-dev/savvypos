// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DriverDetails _$DriverDetailsFromJson(Map<String, dynamic> json) {
  return _DriverDetails.fromJson(json);
}

/// @nodoc
mixin _$DriverDetails {
  String get name => throw _privateConstructorUsedError;
  String get licensePlate => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  DateTime? get eta => throw _privateConstructorUsedError;

  /// Serializes this DriverDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DriverDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DriverDetailsCopyWith<DriverDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverDetailsCopyWith<$Res> {
  factory $DriverDetailsCopyWith(
          DriverDetails value, $Res Function(DriverDetails) then) =
      _$DriverDetailsCopyWithImpl<$Res, DriverDetails>;
  @useResult
  $Res call({String name, String licensePlate, String phone, DateTime? eta});
}

/// @nodoc
class _$DriverDetailsCopyWithImpl<$Res, $Val extends DriverDetails>
    implements $DriverDetailsCopyWith<$Res> {
  _$DriverDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DriverDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? licensePlate = null,
    Object? phone = null,
    Object? eta = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      licensePlate: null == licensePlate
          ? _value.licensePlate
          : licensePlate // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      eta: freezed == eta
          ? _value.eta
          : eta // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DriverDetailsImplCopyWith<$Res>
    implements $DriverDetailsCopyWith<$Res> {
  factory _$$DriverDetailsImplCopyWith(
          _$DriverDetailsImpl value, $Res Function(_$DriverDetailsImpl) then) =
      __$$DriverDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String licensePlate, String phone, DateTime? eta});
}

/// @nodoc
class __$$DriverDetailsImplCopyWithImpl<$Res>
    extends _$DriverDetailsCopyWithImpl<$Res, _$DriverDetailsImpl>
    implements _$$DriverDetailsImplCopyWith<$Res> {
  __$$DriverDetailsImplCopyWithImpl(
      _$DriverDetailsImpl _value, $Res Function(_$DriverDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of DriverDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? licensePlate = null,
    Object? phone = null,
    Object? eta = freezed,
  }) {
    return _then(_$DriverDetailsImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      licensePlate: null == licensePlate
          ? _value.licensePlate
          : licensePlate // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      eta: freezed == eta
          ? _value.eta
          : eta // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DriverDetailsImpl implements _DriverDetails {
  const _$DriverDetailsImpl(
      {required this.name,
      required this.licensePlate,
      required this.phone,
      this.eta});

  factory _$DriverDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverDetailsImplFromJson(json);

  @override
  final String name;
  @override
  final String licensePlate;
  @override
  final String phone;
  @override
  final DateTime? eta;

  @override
  String toString() {
    return 'DriverDetails(name: $name, licensePlate: $licensePlate, phone: $phone, eta: $eta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverDetailsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.licensePlate, licensePlate) ||
                other.licensePlate == licensePlate) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.eta, eta) || other.eta == eta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, licensePlate, phone, eta);

  /// Create a copy of DriverDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverDetailsImplCopyWith<_$DriverDetailsImpl> get copyWith =>
      __$$DriverDetailsImplCopyWithImpl<_$DriverDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverDetailsImplToJson(
      this,
    );
  }
}

abstract class _DriverDetails implements DriverDetails {
  const factory _DriverDetails(
      {required final String name,
      required final String licensePlate,
      required final String phone,
      final DateTime? eta}) = _$DriverDetailsImpl;

  factory _DriverDetails.fromJson(Map<String, dynamic> json) =
      _$DriverDetailsImpl.fromJson;

  @override
  String get name;
  @override
  String get licensePlate;
  @override
  String get phone;
  @override
  DateTime? get eta;

  /// Create a copy of DriverDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DriverDetailsImplCopyWith<_$DriverDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
