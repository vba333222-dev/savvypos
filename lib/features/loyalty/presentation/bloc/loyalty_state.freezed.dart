// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loyalty_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoyaltyState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  LoyaltyMember? get member => throw _privateConstructorUsedError;
  List<LoyaltyReward> get availableRewards =>
      throw _privateConstructorUsedError;
  List<LoyaltyTransaction> get history => throw _privateConstructorUsedError;
  LoyaltyConfig? get config => throw _privateConstructorUsedError;
  bool get isEnrolled => throw _privateConstructorUsedError;

  /// Create a copy of LoyaltyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoyaltyStateCopyWith<LoyaltyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyStateCopyWith<$Res> {
  factory $LoyaltyStateCopyWith(
          LoyaltyState value, $Res Function(LoyaltyState) then) =
      _$LoyaltyStateCopyWithImpl<$Res, LoyaltyState>;
  @useResult
  $Res call(
      {bool isLoading,
      String? error,
      LoyaltyMember? member,
      List<LoyaltyReward> availableRewards,
      List<LoyaltyTransaction> history,
      LoyaltyConfig? config,
      bool isEnrolled});

  $LoyaltyMemberCopyWith<$Res>? get member;
  $LoyaltyConfigCopyWith<$Res>? get config;
}

/// @nodoc
class _$LoyaltyStateCopyWithImpl<$Res, $Val extends LoyaltyState>
    implements $LoyaltyStateCopyWith<$Res> {
  _$LoyaltyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoyaltyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? member = freezed,
    Object? availableRewards = null,
    Object? history = null,
    Object? config = freezed,
    Object? isEnrolled = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      member: freezed == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as LoyaltyMember?,
      availableRewards: null == availableRewards
          ? _value.availableRewards
          : availableRewards // ignore: cast_nullable_to_non_nullable
              as List<LoyaltyReward>,
      history: null == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<LoyaltyTransaction>,
      config: freezed == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as LoyaltyConfig?,
      isEnrolled: null == isEnrolled
          ? _value.isEnrolled
          : isEnrolled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of LoyaltyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoyaltyMemberCopyWith<$Res>? get member {
    if (_value.member == null) {
      return null;
    }

    return $LoyaltyMemberCopyWith<$Res>(_value.member!, (value) {
      return _then(_value.copyWith(member: value) as $Val);
    });
  }

  /// Create a copy of LoyaltyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoyaltyConfigCopyWith<$Res>? get config {
    if (_value.config == null) {
      return null;
    }

    return $LoyaltyConfigCopyWith<$Res>(_value.config!, (value) {
      return _then(_value.copyWith(config: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoyaltyStateImplCopyWith<$Res>
    implements $LoyaltyStateCopyWith<$Res> {
  factory _$$LoyaltyStateImplCopyWith(
          _$LoyaltyStateImpl value, $Res Function(_$LoyaltyStateImpl) then) =
      __$$LoyaltyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String? error,
      LoyaltyMember? member,
      List<LoyaltyReward> availableRewards,
      List<LoyaltyTransaction> history,
      LoyaltyConfig? config,
      bool isEnrolled});

  @override
  $LoyaltyMemberCopyWith<$Res>? get member;
  @override
  $LoyaltyConfigCopyWith<$Res>? get config;
}

/// @nodoc
class __$$LoyaltyStateImplCopyWithImpl<$Res>
    extends _$LoyaltyStateCopyWithImpl<$Res, _$LoyaltyStateImpl>
    implements _$$LoyaltyStateImplCopyWith<$Res> {
  __$$LoyaltyStateImplCopyWithImpl(
      _$LoyaltyStateImpl _value, $Res Function(_$LoyaltyStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoyaltyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? member = freezed,
    Object? availableRewards = null,
    Object? history = null,
    Object? config = freezed,
    Object? isEnrolled = null,
  }) {
    return _then(_$LoyaltyStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      member: freezed == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as LoyaltyMember?,
      availableRewards: null == availableRewards
          ? _value._availableRewards
          : availableRewards // ignore: cast_nullable_to_non_nullable
              as List<LoyaltyReward>,
      history: null == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<LoyaltyTransaction>,
      config: freezed == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as LoyaltyConfig?,
      isEnrolled: null == isEnrolled
          ? _value.isEnrolled
          : isEnrolled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoyaltyStateImpl implements _LoyaltyState {
  const _$LoyaltyStateImpl(
      {this.isLoading = false,
      this.error,
      this.member,
      final List<LoyaltyReward> availableRewards = const [],
      final List<LoyaltyTransaction> history = const [],
      this.config = null,
      this.isEnrolled = false})
      : _availableRewards = availableRewards,
        _history = history;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;
  @override
  final LoyaltyMember? member;
  final List<LoyaltyReward> _availableRewards;
  @override
  @JsonKey()
  List<LoyaltyReward> get availableRewards {
    if (_availableRewards is EqualUnmodifiableListView)
      return _availableRewards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableRewards);
  }

  final List<LoyaltyTransaction> _history;
  @override
  @JsonKey()
  List<LoyaltyTransaction> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  @override
  @JsonKey()
  final LoyaltyConfig? config;
  @override
  @JsonKey()
  final bool isEnrolled;

  @override
  String toString() {
    return 'LoyaltyState(isLoading: $isLoading, error: $error, member: $member, availableRewards: $availableRewards, history: $history, config: $config, isEnrolled: $isEnrolled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoyaltyStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.member, member) || other.member == member) &&
            const DeepCollectionEquality()
                .equals(other._availableRewards, _availableRewards) &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.isEnrolled, isEnrolled) ||
                other.isEnrolled == isEnrolled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      error,
      member,
      const DeepCollectionEquality().hash(_availableRewards),
      const DeepCollectionEquality().hash(_history),
      config,
      isEnrolled);

  /// Create a copy of LoyaltyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoyaltyStateImplCopyWith<_$LoyaltyStateImpl> get copyWith =>
      __$$LoyaltyStateImplCopyWithImpl<_$LoyaltyStateImpl>(this, _$identity);
}

abstract class _LoyaltyState implements LoyaltyState {
  const factory _LoyaltyState(
      {final bool isLoading,
      final String? error,
      final LoyaltyMember? member,
      final List<LoyaltyReward> availableRewards,
      final List<LoyaltyTransaction> history,
      final LoyaltyConfig? config,
      final bool isEnrolled}) = _$LoyaltyStateImpl;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  LoyaltyMember? get member;
  @override
  List<LoyaltyReward> get availableRewards;
  @override
  List<LoyaltyTransaction> get history;
  @override
  LoyaltyConfig? get config;
  @override
  bool get isEnrolled;

  /// Create a copy of LoyaltyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoyaltyStateImplCopyWith<_$LoyaltyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
