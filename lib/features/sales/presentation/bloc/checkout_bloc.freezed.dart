// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CheckoutEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orderUuid, double totalAmount) started,
    required TResult Function(
            PaymentMethod method, double amount, double? tendered, String? note)
        processPayment,
    required TResult Function(PaymentPart part) addPaymentPart,
    required TResult Function(int index) removePaymentPart,
    required TResult Function() confirmSplitTenderCheckout,
    required TResult Function(double balance) refreshWithBalance,
    required TResult Function(LoyaltyMember member) attachLoyaltyMember,
    required TResult Function(double amount) initiateEdcPayment,
    required TResult Function(
            double amount, String referenceId, String? approvalCode)
        edcPaymentConfirmed,
    required TResult Function(String reason) edcPaymentFailed,
    required TResult Function() cancelEdcPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orderUuid, double totalAmount)? started,
    TResult? Function(PaymentMethod method, double amount, double? tendered,
            String? note)?
        processPayment,
    TResult? Function(PaymentPart part)? addPaymentPart,
    TResult? Function(int index)? removePaymentPart,
    TResult? Function()? confirmSplitTenderCheckout,
    TResult? Function(double balance)? refreshWithBalance,
    TResult? Function(LoyaltyMember member)? attachLoyaltyMember,
    TResult? Function(double amount)? initiateEdcPayment,
    TResult? Function(double amount, String referenceId, String? approvalCode)?
        edcPaymentConfirmed,
    TResult? Function(String reason)? edcPaymentFailed,
    TResult? Function()? cancelEdcPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderUuid, double totalAmount)? started,
    TResult Function(PaymentMethod method, double amount, double? tendered,
            String? note)?
        processPayment,
    TResult Function(PaymentPart part)? addPaymentPart,
    TResult Function(int index)? removePaymentPart,
    TResult Function()? confirmSplitTenderCheckout,
    TResult Function(double balance)? refreshWithBalance,
    TResult Function(LoyaltyMember member)? attachLoyaltyMember,
    TResult Function(double amount)? initiateEdcPayment,
    TResult Function(double amount, String referenceId, String? approvalCode)?
        edcPaymentConfirmed,
    TResult Function(String reason)? edcPaymentFailed,
    TResult Function()? cancelEdcPayment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_AddPaymentPart value) addPaymentPart,
    required TResult Function(_RemovePaymentPart value) removePaymentPart,
    required TResult Function(_ConfirmSplitTenderCheckout value)
        confirmSplitTenderCheckout,
    required TResult Function(_RefreshWithBalance value) refreshWithBalance,
    required TResult Function(_AttachLoyaltyMember value) attachLoyaltyMember,
    required TResult Function(_InitiateEdcPayment value) initiateEdcPayment,
    required TResult Function(_EdcPaymentConfirmed value) edcPaymentConfirmed,
    required TResult Function(_EdcPaymentFailed value) edcPaymentFailed,
    required TResult Function(_CancelEdcPayment value) cancelEdcPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_AddPaymentPart value)? addPaymentPart,
    TResult? Function(_RemovePaymentPart value)? removePaymentPart,
    TResult? Function(_ConfirmSplitTenderCheckout value)?
        confirmSplitTenderCheckout,
    TResult? Function(_RefreshWithBalance value)? refreshWithBalance,
    TResult? Function(_AttachLoyaltyMember value)? attachLoyaltyMember,
    TResult? Function(_InitiateEdcPayment value)? initiateEdcPayment,
    TResult? Function(_EdcPaymentConfirmed value)? edcPaymentConfirmed,
    TResult? Function(_EdcPaymentFailed value)? edcPaymentFailed,
    TResult? Function(_CancelEdcPayment value)? cancelEdcPayment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_AddPaymentPart value)? addPaymentPart,
    TResult Function(_RemovePaymentPart value)? removePaymentPart,
    TResult Function(_ConfirmSplitTenderCheckout value)?
        confirmSplitTenderCheckout,
    TResult Function(_RefreshWithBalance value)? refreshWithBalance,
    TResult Function(_AttachLoyaltyMember value)? attachLoyaltyMember,
    TResult Function(_InitiateEdcPayment value)? initiateEdcPayment,
    TResult Function(_EdcPaymentConfirmed value)? edcPaymentConfirmed,
    TResult Function(_EdcPaymentFailed value)? edcPaymentFailed,
    TResult Function(_CancelEdcPayment value)? cancelEdcPayment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutEventCopyWith<$Res> {
  factory $CheckoutEventCopyWith(
          CheckoutEvent value, $Res Function(CheckoutEvent) then) =
      _$CheckoutEventCopyWithImpl<$Res, CheckoutEvent>;
}

/// @nodoc
class _$CheckoutEventCopyWithImpl<$Res, $Val extends CheckoutEvent>
    implements $CheckoutEventCopyWith<$Res> {
  _$CheckoutEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderUuid, double totalAmount});
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderUuid = null,
    Object? totalAmount = null,
  }) {
    return _then(_$StartedImpl(
      null == orderUuid
          ? _value.orderUuid
          : orderUuid // ignore: cast_nullable_to_non_nullable
              as String,
      null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl(this.orderUuid, this.totalAmount);

  @override
  final String orderUuid;
  @override
  final double totalAmount;

  @override
  String toString() {
    return 'CheckoutEvent.started(orderUuid: $orderUuid, totalAmount: $totalAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartedImpl &&
            (identical(other.orderUuid, orderUuid) ||
                other.orderUuid == orderUuid) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderUuid, totalAmount);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      __$$StartedImplCopyWithImpl<_$StartedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orderUuid, double totalAmount) started,
    required TResult Function(
            PaymentMethod method, double amount, double? tendered, String? note)
        processPayment,
    required TResult Function(PaymentPart part) addPaymentPart,
    required TResult Function(int index) removePaymentPart,
    required TResult Function() confirmSplitTenderCheckout,
    required TResult Function(double balance) refreshWithBalance,
    required TResult Function(LoyaltyMember member) attachLoyaltyMember,
    required TResult Function(double amount) initiateEdcPayment,
    required TResult Function(
            double amount, String referenceId, String? approvalCode)
        edcPaymentConfirmed,
    required TResult Function(String reason) edcPaymentFailed,
    required TResult Function() cancelEdcPayment,
  }) {
    return started(orderUuid, totalAmount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orderUuid, double totalAmount)? started,
    TResult? Function(PaymentMethod method, double amount, double? tendered,
            String? note)?
        processPayment,
    TResult? Function(PaymentPart part)? addPaymentPart,
    TResult? Function(int index)? removePaymentPart,
    TResult? Function()? confirmSplitTenderCheckout,
    TResult? Function(double balance)? refreshWithBalance,
    TResult? Function(LoyaltyMember member)? attachLoyaltyMember,
    TResult? Function(double amount)? initiateEdcPayment,
    TResult? Function(double amount, String referenceId, String? approvalCode)?
        edcPaymentConfirmed,
    TResult? Function(String reason)? edcPaymentFailed,
    TResult? Function()? cancelEdcPayment,
  }) {
    return started?.call(orderUuid, totalAmount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderUuid, double totalAmount)? started,
    TResult Function(PaymentMethod method, double amount, double? tendered,
            String? note)?
        processPayment,
    TResult Function(PaymentPart part)? addPaymentPart,
    TResult Function(int index)? removePaymentPart,
    TResult Function()? confirmSplitTenderCheckout,
    TResult Function(double balance)? refreshWithBalance,
    TResult Function(LoyaltyMember member)? attachLoyaltyMember,
    TResult Function(double amount)? initiateEdcPayment,
    TResult Function(double amount, String referenceId, String? approvalCode)?
        edcPaymentConfirmed,
    TResult Function(String reason)? edcPaymentFailed,
    TResult Function()? cancelEdcPayment,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(orderUuid, totalAmount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_AddPaymentPart value) addPaymentPart,
    required TResult Function(_RemovePaymentPart value) removePaymentPart,
    required TResult Function(_ConfirmSplitTenderCheckout value)
        confirmSplitTenderCheckout,
    required TResult Function(_RefreshWithBalance value) refreshWithBalance,
    required TResult Function(_AttachLoyaltyMember value) attachLoyaltyMember,
    required TResult Function(_InitiateEdcPayment value) initiateEdcPayment,
    required TResult Function(_EdcPaymentConfirmed value) edcPaymentConfirmed,
    required TResult Function(_EdcPaymentFailed value) edcPaymentFailed,
    required TResult Function(_CancelEdcPayment value) cancelEdcPayment,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_AddPaymentPart value)? addPaymentPart,
    TResult? Function(_RemovePaymentPart value)? removePaymentPart,
    TResult? Function(_ConfirmSplitTenderCheckout value)?
        confirmSplitTenderCheckout,
    TResult? Function(_RefreshWithBalance value)? refreshWithBalance,
    TResult? Function(_AttachLoyaltyMember value)? attachLoyaltyMember,
    TResult? Function(_InitiateEdcPayment value)? initiateEdcPayment,
    TResult? Function(_EdcPaymentConfirmed value)? edcPaymentConfirmed,
    TResult? Function(_EdcPaymentFailed value)? edcPaymentFailed,
    TResult? Function(_CancelEdcPayment value)? cancelEdcPayment,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_AddPaymentPart value)? addPaymentPart,
    TResult Function(_RemovePaymentPart value)? removePaymentPart,
    TResult Function(_ConfirmSplitTenderCheckout value)?
        confirmSplitTenderCheckout,
    TResult Function(_RefreshWithBalance value)? refreshWithBalance,
    TResult Function(_AttachLoyaltyMember value)? attachLoyaltyMember,
    TResult Function(_InitiateEdcPayment value)? initiateEdcPayment,
    TResult Function(_EdcPaymentConfirmed value)? edcPaymentConfirmed,
    TResult Function(_EdcPaymentFailed value)? edcPaymentFailed,
    TResult Function(_CancelEdcPayment value)? cancelEdcPayment,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CheckoutEvent {
  const factory _Started(final String orderUuid, final double totalAmount) =
      _$StartedImpl;

  String get orderUuid;
  double get totalAmount;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProcessPaymentImplCopyWith<$Res> {
  factory _$$ProcessPaymentImplCopyWith(_$ProcessPaymentImpl value,
          $Res Function(_$ProcessPaymentImpl) then) =
      __$$ProcessPaymentImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PaymentMethod method, double amount, double? tendered, String? note});
}

/// @nodoc
class __$$ProcessPaymentImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$ProcessPaymentImpl>
    implements _$$ProcessPaymentImplCopyWith<$Res> {
  __$$ProcessPaymentImplCopyWithImpl(
      _$ProcessPaymentImpl _value, $Res Function(_$ProcessPaymentImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? amount = null,
    Object? tendered = freezed,
    Object? note = freezed,
  }) {
    return _then(_$ProcessPaymentImpl(
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      tendered: freezed == tendered
          ? _value.tendered
          : tendered // ignore: cast_nullable_to_non_nullable
              as double?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ProcessPaymentImpl implements _ProcessPayment {
  const _$ProcessPaymentImpl(
      {required this.method, required this.amount, this.tendered, this.note});

  @override
  final PaymentMethod method;
  @override
  final double amount;
  @override
  final double? tendered;
  @override
  final String? note;

  @override
  String toString() {
    return 'CheckoutEvent.processPayment(method: $method, amount: $amount, tendered: $tendered, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessPaymentImpl &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.tendered, tendered) ||
                other.tendered == tendered) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, method, amount, tendered, note);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessPaymentImplCopyWith<_$ProcessPaymentImpl> get copyWith =>
      __$$ProcessPaymentImplCopyWithImpl<_$ProcessPaymentImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orderUuid, double totalAmount) started,
    required TResult Function(
            PaymentMethod method, double amount, double? tendered, String? note)
        processPayment,
    required TResult Function(PaymentPart part) addPaymentPart,
    required TResult Function(int index) removePaymentPart,
    required TResult Function() confirmSplitTenderCheckout,
    required TResult Function(double balance) refreshWithBalance,
    required TResult Function(LoyaltyMember member) attachLoyaltyMember,
    required TResult Function(double amount) initiateEdcPayment,
    required TResult Function(
            double amount, String referenceId, String? approvalCode)
        edcPaymentConfirmed,
    required TResult Function(String reason) edcPaymentFailed,
    required TResult Function() cancelEdcPayment,
  }) {
    return processPayment(method, amount, tendered, note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orderUuid, double totalAmount)? started,
    TResult? Function(PaymentMethod method, double amount, double? tendered,
            String? note)?
        processPayment,
    TResult? Function(PaymentPart part)? addPaymentPart,
    TResult? Function(int index)? removePaymentPart,
    TResult? Function()? confirmSplitTenderCheckout,
    TResult? Function(double balance)? refreshWithBalance,
    TResult? Function(LoyaltyMember member)? attachLoyaltyMember,
    TResult? Function(double amount)? initiateEdcPayment,
    TResult? Function(double amount, String referenceId, String? approvalCode)?
        edcPaymentConfirmed,
    TResult? Function(String reason)? edcPaymentFailed,
    TResult? Function()? cancelEdcPayment,
  }) {
    return processPayment?.call(method, amount, tendered, note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderUuid, double totalAmount)? started,
    TResult Function(PaymentMethod method, double amount, double? tendered,
            String? note)?
        processPayment,
    TResult Function(PaymentPart part)? addPaymentPart,
    TResult Function(int index)? removePaymentPart,
    TResult Function()? confirmSplitTenderCheckout,
    TResult Function(double balance)? refreshWithBalance,
    TResult Function(LoyaltyMember member)? attachLoyaltyMember,
    TResult Function(double amount)? initiateEdcPayment,
    TResult Function(double amount, String referenceId, String? approvalCode)?
        edcPaymentConfirmed,
    TResult Function(String reason)? edcPaymentFailed,
    TResult Function()? cancelEdcPayment,
    required TResult orElse(),
  }) {
    if (processPayment != null) {
      return processPayment(method, amount, tendered, note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_AddPaymentPart value) addPaymentPart,
    required TResult Function(_RemovePaymentPart value) removePaymentPart,
    required TResult Function(_ConfirmSplitTenderCheckout value)
        confirmSplitTenderCheckout,
    required TResult Function(_RefreshWithBalance value) refreshWithBalance,
    required TResult Function(_AttachLoyaltyMember value) attachLoyaltyMember,
    required TResult Function(_InitiateEdcPayment value) initiateEdcPayment,
    required TResult Function(_EdcPaymentConfirmed value) edcPaymentConfirmed,
    required TResult Function(_EdcPaymentFailed value) edcPaymentFailed,
    required TResult Function(_CancelEdcPayment value) cancelEdcPayment,
  }) {
    return processPayment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_AddPaymentPart value)? addPaymentPart,
    TResult? Function(_RemovePaymentPart value)? removePaymentPart,
    TResult? Function(_ConfirmSplitTenderCheckout value)?
        confirmSplitTenderCheckout,
    TResult? Function(_RefreshWithBalance value)? refreshWithBalance,
    TResult? Function(_AttachLoyaltyMember value)? attachLoyaltyMember,
    TResult? Function(_InitiateEdcPayment value)? initiateEdcPayment,
    TResult? Function(_EdcPaymentConfirmed value)? edcPaymentConfirmed,
    TResult? Function(_EdcPaymentFailed value)? edcPaymentFailed,
    TResult? Function(_CancelEdcPayment value)? cancelEdcPayment,
  }) {
    return processPayment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_AddPaymentPart value)? addPaymentPart,
    TResult Function(_RemovePaymentPart value)? removePaymentPart,
    TResult Function(_ConfirmSplitTenderCheckout value)?
        confirmSplitTenderCheckout,
    TResult Function(_RefreshWithBalance value)? refreshWithBalance,
    TResult Function(_AttachLoyaltyMember value)? attachLoyaltyMember,
    TResult Function(_InitiateEdcPayment value)? initiateEdcPayment,
    TResult Function(_EdcPaymentConfirmed value)? edcPaymentConfirmed,
    TResult Function(_EdcPaymentFailed value)? edcPaymentFailed,
    TResult Function(_CancelEdcPayment value)? cancelEdcPayment,
    required TResult orElse(),
  }) {
    if (processPayment != null) {
      return processPayment(this);
    }
    return orElse();
  }
}

abstract class _ProcessPayment implements CheckoutEvent {
  const factory _ProcessPayment(
      {required final PaymentMethod method,
      required final double amount,
      final double? tendered,
      final String? note}) = _$ProcessPaymentImpl;

  PaymentMethod get method;
  double get amount;
  double? get tendered;
  String? get note;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProcessPaymentImplCopyWith<_$ProcessPaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddPaymentPartImplCopyWith<$Res> {
  factory _$$AddPaymentPartImplCopyWith(_$AddPaymentPartImpl value,
          $Res Function(_$AddPaymentPartImpl) then) =
      __$$AddPaymentPartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentPart part});
}

/// @nodoc
class __$$AddPaymentPartImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$AddPaymentPartImpl>
    implements _$$AddPaymentPartImplCopyWith<$Res> {
  __$$AddPaymentPartImplCopyWithImpl(
      _$AddPaymentPartImpl _value, $Res Function(_$AddPaymentPartImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? part = null,
  }) {
    return _then(_$AddPaymentPartImpl(
      null == part
          ? _value.part
          : part // ignore: cast_nullable_to_non_nullable
              as PaymentPart,
    ));
  }
}

/// @nodoc

class _$AddPaymentPartImpl implements _AddPaymentPart {
  const _$AddPaymentPartImpl(this.part);

  @override
  final PaymentPart part;

  @override
  String toString() {
    return 'CheckoutEvent.addPaymentPart(part: $part)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPaymentPartImpl &&
            (identical(other.part, part) || other.part == part));
  }

  @override
  int get hashCode => Object.hash(runtimeType, part);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPaymentPartImplCopyWith<_$AddPaymentPartImpl> get copyWith =>
      __$$AddPaymentPartImplCopyWithImpl<_$AddPaymentPartImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orderUuid, double totalAmount) started,
    required TResult Function(
            PaymentMethod method, double amount, double? tendered, String? note)
        processPayment,
    required TResult Function(PaymentPart part) addPaymentPart,
    required TResult Function(int index) removePaymentPart,
    required TResult Function() confirmSplitTenderCheckout,
    required TResult Function(double balance) refreshWithBalance,
    required TResult Function(LoyaltyMember member) attachLoyaltyMember,
    required TResult Function(double amount) initiateEdcPayment,
    required TResult Function(
            double amount, String referenceId, String? approvalCode)
        edcPaymentConfirmed,
    required TResult Function(String reason) edcPaymentFailed,
    required TResult Function() cancelEdcPayment,
  }) {
    return addPaymentPart(part);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orderUuid, double totalAmount)? started,
    TResult? Function(PaymentMethod method, double amount, double? tendered,
            String? note)?
        processPayment,
    TResult? Function(PaymentPart part)? addPaymentPart,
    TResult? Function(int index)? removePaymentPart,
    TResult? Function()? confirmSplitTenderCheckout,
    TResult? Function(double balance)? refreshWithBalance,
    TResult? Function(LoyaltyMember member)? attachLoyaltyMember,
    TResult? Function(double amount)? initiateEdcPayment,
    TResult? Function(double amount, String referenceId, String? approvalCode)?
        edcPaymentConfirmed,
    TResult? Function(String reason)? edcPaymentFailed,
    TResult? Function()? cancelEdcPayment,
  }) {
    return addPaymentPart?.call(part);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderUuid, double totalAmount)? started,
    TResult Function(PaymentMethod method, double amount, double? tendered,
            String? note)?
        processPayment,
    TResult Function(PaymentPart part)? addPaymentPart,
    TResult Function(int index)? removePaymentPart,
    TResult Function()? confirmSplitTenderCheckout,
    TResult Function(double balance)? refreshWithBalance,
    TResult Function(LoyaltyMember member)? attachLoyaltyMember,
    TResult Function(double amount)? initiateEdcPayment,
    TResult Function(double amount, String referenceId, String? approvalCode)?
        edcPaymentConfirmed,
    TResult Function(String reason)? edcPaymentFailed,
    TResult Function()? cancelEdcPayment,
    required TResult orElse(),
  }) {
    if (addPaymentPart != null) {
      return addPaymentPart(part);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_AddPaymentPart value) addPaymentPart,
    required TResult Function(_RemovePaymentPart value) removePaymentPart,
    required TResult Function(_ConfirmSplitTenderCheckout value)
        confirmSplitTenderCheckout,
    required TResult Function(_RefreshWithBalance value) refreshWithBalance,
    required TResult Function(_AttachLoyaltyMember value) attachLoyaltyMember,
    required TResult Function(_InitiateEdcPayment value) initiateEdcPayment,
    required TResult Function(_EdcPaymentConfirmed value) edcPaymentConfirmed,
    required TResult Function(_EdcPaymentFailed value) edcPaymentFailed,
    required TResult Function(_CancelEdcPayment value) cancelEdcPayment,
  }) {
    return addPaymentPart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_AddPaymentPart value)? addPaymentPart,
    TResult? Function(_RemovePaymentPart value)? removePaymentPart,
    TResult? Function(_ConfirmSplitTenderCheckout value)?
        confirmSplitTenderCheckout,
    TResult? Function(_RefreshWithBalance value)? refreshWithBalance,
    TResult? Function(_AttachLoyaltyMember value)? attachLoyaltyMember,
    TResult? Function(_InitiateEdcPayment value)? initiateEdcPayment,
    TResult? Function(_EdcPaymentConfirmed value)? edcPaymentConfirmed,
    TResult? Function(_EdcPaymentFailed value)? edcPaymentFailed,
    TResult? Function(_CancelEdcPayment value)? cancelEdcPayment,
  }) {
    return addPaymentPart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_AddPaymentPart value)? addPaymentPart,
    TResult Function(_RemovePaymentPart value)? removePaymentPart,
    TResult Function(_ConfirmSplitTenderCheckout value)?
        confirmSplitTenderCheckout,
    TResult Function(_RefreshWithBalance value)? refreshWithBalance,
    TResult Function(_AttachLoyaltyMember value)? attachLoyaltyMember,
    TResult Function(_InitiateEdcPayment value)? initiateEdcPayment,
    TResult Function(_EdcPaymentConfirmed value)? edcPaymentConfirmed,
    TResult Function(_EdcPaymentFailed value)? edcPaymentFailed,
    TResult Function(_CancelEdcPayment value)? cancelEdcPayment,
    required TResult orElse(),
  }) {
    if (addPaymentPart != null) {
      return addPaymentPart(this);
    }
    return orElse();
  }
}

abstract class _AddPaymentPart implements CheckoutEvent {
  const factory _AddPaymentPart(final PaymentPart part) = _$AddPaymentPartImpl;

  PaymentPart get part;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddPaymentPartImplCopyWith<_$AddPaymentPartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemovePaymentPartImplCopyWith<$Res> {
  factory _$$RemovePaymentPartImplCopyWith(_$RemovePaymentPartImpl value,
          $Res Function(_$RemovePaymentPartImpl) then) =
      __$$RemovePaymentPartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$RemovePaymentPartImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$RemovePaymentPartImpl>
    implements _$$RemovePaymentPartImplCopyWith<$Res> {
  __$$RemovePaymentPartImplCopyWithImpl(_$RemovePaymentPartImpl _value,
      $Res Function(_$RemovePaymentPartImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$RemovePaymentPartImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RemovePaymentPartImpl implements _RemovePaymentPart {
  const _$RemovePaymentPartImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'CheckoutEvent.removePaymentPart(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemovePaymentPartImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemovePaymentPartImplCopyWith<_$RemovePaymentPartImpl> get copyWith =>
      __$$RemovePaymentPartImplCopyWithImpl<_$RemovePaymentPartImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orderUuid, double totalAmount) started,
    required TResult Function(
            PaymentMethod method, double amount, double? tendered, String? note)
        processPayment,
    required TResult Function(PaymentPart part) addPaymentPart,
    required TResult Function(int index) removePaymentPart,
    required TResult Function() confirmSplitTenderCheckout,
    required TResult Function(double balance) refreshWithBalance,
    required TResult Function(LoyaltyMember member) attachLoyaltyMember,
    required TResult Function(double amount) initiateEdcPayment,
    required TResult Function(
            double amount, String referenceId, String? approvalCode)
        edcPaymentConfirmed,
    required TResult Function(String reason) edcPaymentFailed,
    required TResult Function() cancelEdcPayment,
  }) {
    return removePaymentPart(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orderUuid, double totalAmount)? started,
    TResult? Function(PaymentMethod method, double amount, double? tendered,
            String? note)?
        processPayment,
    TResult? Function(PaymentPart part)? addPaymentPart,
    TResult? Function(int index)? removePaymentPart,
    TResult? Function()? confirmSplitTenderCheckout,
    TResult? Function(double balance)? refreshWithBalance,
    TResult? Function(LoyaltyMember member)? attachLoyaltyMember,
    TResult? Function(double amount)? initiateEdcPayment,
    TResult? Function(double amount, String referenceId, String? approvalCode)?
        edcPaymentConfirmed,
    TResult? Function(String reason)? edcPaymentFailed,
    TResult? Function()? cancelEdcPayment,
  }) {
    return removePaymentPart?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderUuid, double totalAmount)? started,
    TResult Function(PaymentMethod method, double amount, double? tendered,
            String? note)?
        processPayment,
    TResult Function(PaymentPart part)? addPaymentPart,
    TResult Function(int index)? removePaymentPart,
    TResult Function()? confirmSplitTenderCheckout,
    TResult Function(double balance)? refreshWithBalance,
    TResult Function(LoyaltyMember member)? attachLoyaltyMember,
    TResult Function(double amount)? initiateEdcPayment,
    TResult Function(double amount, String referenceId, String? approvalCode)?
        edcPaymentConfirmed,
    TResult Function(String reason)? edcPaymentFailed,
    TResult Function()? cancelEdcPayment,
    required TResult orElse(),
  }) {
    if (removePaymentPart != null) {
      return removePaymentPart(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_AddPaymentPart value) addPaymentPart,
    required TResult Function(_RemovePaymentPart value) removePaymentPart,
    required TResult Function(_ConfirmSplitTenderCheckout value)
        confirmSplitTenderCheckout,
    required TResult Function(_RefreshWithBalance value) refreshWithBalance,
    required TResult Function(_AttachLoyaltyMember value) attachLoyaltyMember,
    required TResult Function(_InitiateEdcPayment value) initiateEdcPayment,
    required TResult Function(_EdcPaymentConfirmed value) edcPaymentConfirmed,
    required TResult Function(_EdcPaymentFailed value) edcPaymentFailed,
    required TResult Function(_CancelEdcPayment value) cancelEdcPayment,
  }) {
    return removePaymentPart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_AddPaymentPart value)? addPaymentPart,
    TResult? Function(_RemovePaymentPart value)? removePaymentPart,
    TResult? Function(_ConfirmSplitTenderCheckout value)?
        confirmSplitTenderCheckout,
    TResult? Function(_RefreshWithBalance value)? refreshWithBalance,
    TResult? Function(_AttachLoyaltyMember value)? attachLoyaltyMember,
    TResult? Function(_InitiateEdcPayment value)? initiateEdcPayment,
    TResult? Function(_EdcPaymentConfirmed value)? edcPaymentConfirmed,
    TResult? Function(_EdcPaymentFailed value)? edcPaymentFailed,
    TResult? Function(_CancelEdcPayment value)? cancelEdcPayment,
  }) {
    return removePaymentPart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_AddPaymentPart value)? addPaymentPart,
    TResult Function(_RemovePaymentPart value)? removePaymentPart,
    TResult Function(_ConfirmSplitTenderCheckout value)?
        confirmSplitTenderCheckout,
    TResult Function(_RefreshWithBalance value)? refreshWithBalance,
    TResult Function(_AttachLoyaltyMember value)? attachLoyaltyMember,
    TResult Function(_InitiateEdcPayment value)? initiateEdcPayment,
    TResult Function(_EdcPaymentConfirmed value)? edcPaymentConfirmed,
    TResult Function(_EdcPaymentFailed value)? edcPaymentFailed,
    TResult Function(_CancelEdcPayment value)? cancelEdcPayment,
    required TResult orElse(),
  }) {
    if (removePaymentPart != null) {
      return removePaymentPart(this);
    }
    return orElse();
  }
}

abstract class _RemovePaymentPart implements CheckoutEvent {
  const factory _RemovePaymentPart(final int index) = _$RemovePaymentPartImpl;

  int get index;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemovePaymentPartImplCopyWith<_$RemovePaymentPartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfirmSplitTenderCheckoutImplCopyWith<$Res> {
  factory _$$ConfirmSplitTenderCheckoutImplCopyWith(
          _$ConfirmSplitTenderCheckoutImpl value,
          $Res Function(_$ConfirmSplitTenderCheckoutImpl) then) =
      __$$ConfirmSplitTenderCheckoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConfirmSplitTenderCheckoutImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$ConfirmSplitTenderCheckoutImpl>
    implements _$$ConfirmSplitTenderCheckoutImplCopyWith<$Res> {
  __$$ConfirmSplitTenderCheckoutImplCopyWithImpl(
      _$ConfirmSplitTenderCheckoutImpl _value,
      $Res Function(_$ConfirmSplitTenderCheckoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ConfirmSplitTenderCheckoutImpl implements _ConfirmSplitTenderCheckout {
  const _$ConfirmSplitTenderCheckoutImpl();

  @override
  String toString() {
    return 'CheckoutEvent.confirmSplitTenderCheckout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmSplitTenderCheckoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orderUuid, double totalAmount) started,
    required TResult Function(
            PaymentMethod method, double amount, double? tendered, String? note)
        processPayment,
    required TResult Function(PaymentPart part) addPaymentPart,
    required TResult Function(int index) removePaymentPart,
    required TResult Function() confirmSplitTenderCheckout,
    required TResult Function(double balance) refreshWithBalance,
    required TResult Function(LoyaltyMember member) attachLoyaltyMember,
    required TResult Function(double amount) initiateEdcPayment,
    required TResult Function(
            double amount, String referenceId, String? approvalCode)
        edcPaymentConfirmed,
    required TResult Function(String reason) edcPaymentFailed,
    required TResult Function() cancelEdcPayment,
  }) {
    return confirmSplitTenderCheckout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orderUuid, double totalAmount)? started,
    TResult? Function(PaymentMethod method, double amount, double? tendered,
            String? note)?
        processPayment,
    TResult? Function(PaymentPart part)? addPaymentPart,
    TResult? Function(int index)? removePaymentPart,
    TResult? Function()? confirmSplitTenderCheckout,
    TResult? Function(double balance)? refreshWithBalance,
    TResult? Function(LoyaltyMember member)? attachLoyaltyMember,
    TResult? Function(double amount)? initiateEdcPayment,
    TResult? Function(double amount, String referenceId, String? approvalCode)?
        edcPaymentConfirmed,
    TResult? Function(String reason)? edcPaymentFailed,
    TResult? Function()? cancelEdcPayment,
  }) {
    return confirmSplitTenderCheckout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderUuid, double totalAmount)? started,
    TResult Function(PaymentMethod method, double amount, double? tendered,
            String? note)?
        processPayment,
    TResult Function(PaymentPart part)? addPaymentPart,
    TResult Function(int index)? removePaymentPart,
    TResult Function()? confirmSplitTenderCheckout,
    TResult Function(double balance)? refreshWithBalance,
    TResult Function(LoyaltyMember member)? attachLoyaltyMember,
    TResult Function(double amount)? initiateEdcPayment,
    TResult Function(double amount, String referenceId, String? approvalCode)?
        edcPaymentConfirmed,
    TResult Function(String reason)? edcPaymentFailed,
    TResult Function()? cancelEdcPayment,
    required TResult orElse(),
  }) {
    if (confirmSplitTenderCheckout != null) {
      return confirmSplitTenderCheckout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_AddPaymentPart value) addPaymentPart,
    required TResult Function(_RemovePaymentPart value) removePaymentPart,
    required TResult Function(_ConfirmSplitTenderCheckout value)
        confirmSplitTenderCheckout,
    required TResult Function(_RefreshWithBalance value) refreshWithBalance,
    required TResult Function(_AttachLoyaltyMember value) attachLoyaltyMember,
    required TResult Function(_InitiateEdcPayment value) initiateEdcPayment,
    required TResult Function(_EdcPaymentConfirmed value) edcPaymentConfirmed,
    required TResult Function(_EdcPaymentFailed value) edcPaymentFailed,
    required TResult Function(_CancelEdcPayment value) cancelEdcPayment,
  }) {
    return confirmSplitTenderCheckout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_AddPaymentPart value)? addPaymentPart,
    TResult? Function(_RemovePaymentPart value)? removePaymentPart,
    TResult? Function(_ConfirmSplitTenderCheckout value)?
        confirmSplitTenderCheckout,
    TResult? Function(_RefreshWithBalance value)? refreshWithBalance,
    TResult? Function(_AttachLoyaltyMember value)? attachLoyaltyMember,
    TResult? Function(_InitiateEdcPayment value)? initiateEdcPayment,
    TResult? Function(_EdcPaymentConfirmed value)? edcPaymentConfirmed,
    TResult? Function(_EdcPaymentFailed value)? edcPaymentFailed,
    TResult? Function(_CancelEdcPayment value)? cancelEdcPayment,
  }) {
    return confirmSplitTenderCheckout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_AddPaymentPart value)? addPaymentPart,
    TResult Function(_RemovePaymentPart value)? removePaymentPart,
    TResult Function(_ConfirmSplitTenderCheckout value)?
        confirmSplitTenderCheckout,
    TResult Function(_RefreshWithBalance value)? refreshWithBalance,
    TResult Function(_AttachLoyaltyMember value)? attachLoyaltyMember,
    TResult Function(_InitiateEdcPayment value)? initiateEdcPayment,
    TResult Function(_EdcPaymentConfirmed value)? edcPaymentConfirmed,
    TResult Function(_EdcPaymentFailed value)? edcPaymentFailed,
    TResult Function(_CancelEdcPayment value)? cancelEdcPayment,
    required TResult orElse(),
  }) {
    if (confirmSplitTenderCheckout != null) {
      return confirmSplitTenderCheckout(this);
    }
    return orElse();
  }
}

abstract class _ConfirmSplitTenderCheckout implements CheckoutEvent {
  const factory _ConfirmSplitTenderCheckout() =
      _$ConfirmSplitTenderCheckoutImpl;
}

/// @nodoc
abstract class _$$RefreshWithBalanceImplCopyWith<$Res> {
  factory _$$RefreshWithBalanceImplCopyWith(_$RefreshWithBalanceImpl value,
          $Res Function(_$RefreshWithBalanceImpl) then) =
      __$$RefreshWithBalanceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double balance});
}

/// @nodoc
class __$$RefreshWithBalanceImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$RefreshWithBalanceImpl>
    implements _$$RefreshWithBalanceImplCopyWith<$Res> {
  __$$RefreshWithBalanceImplCopyWithImpl(_$RefreshWithBalanceImpl _value,
      $Res Function(_$RefreshWithBalanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
  }) {
    return _then(_$RefreshWithBalanceImpl(
      null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$RefreshWithBalanceImpl implements _RefreshWithBalance {
  const _$RefreshWithBalanceImpl(this.balance);

  @override
  final double balance;

  @override
  String toString() {
    return 'CheckoutEvent.refreshWithBalance(balance: $balance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshWithBalanceImpl &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @override
  int get hashCode => Object.hash(runtimeType, balance);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshWithBalanceImplCopyWith<_$RefreshWithBalanceImpl> get copyWith =>
      __$$RefreshWithBalanceImplCopyWithImpl<_$RefreshWithBalanceImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orderUuid, double totalAmount) started,
    required TResult Function(
            PaymentMethod method, double amount, double? tendered, String? note)
        processPayment,
    required TResult Function(PaymentPart part) addPaymentPart,
    required TResult Function(int index) removePaymentPart,
    required TResult Function() confirmSplitTenderCheckout,
    required TResult Function(double balance) refreshWithBalance,
    required TResult Function(LoyaltyMember member) attachLoyaltyMember,
    required TResult Function(double amount) initiateEdcPayment,
    required TResult Function(
            double amount, String referenceId, String? approvalCode)
        edcPaymentConfirmed,
    required TResult Function(String reason) edcPaymentFailed,
    required TResult Function() cancelEdcPayment,
  }) {
    return refreshWithBalance(balance);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orderUuid, double totalAmount)? started,
    TResult? Function(PaymentMethod method, double amount, double? tendered,
            String? note)?
        processPayment,
    TResult? Function(PaymentPart part)? addPaymentPart,
    TResult? Function(int index)? removePaymentPart,
    TResult? Function()? confirmSplitTenderCheckout,
    TResult? Function(double balance)? refreshWithBalance,
    TResult? Function(LoyaltyMember member)? attachLoyaltyMember,
    TResult? Function(double amount)? initiateEdcPayment,
    TResult? Function(double amount, String referenceId, String? approvalCode)?
        edcPaymentConfirmed,
    TResult? Function(String reason)? edcPaymentFailed,
    TResult? Function()? cancelEdcPayment,
  }) {
    return refreshWithBalance?.call(balance);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderUuid, double totalAmount)? started,
    TResult Function(PaymentMethod method, double amount, double? tendered,
            String? note)?
        processPayment,
    TResult Function(PaymentPart part)? addPaymentPart,
    TResult Function(int index)? removePaymentPart,
    TResult Function()? confirmSplitTenderCheckout,
    TResult Function(double balance)? refreshWithBalance,
    TResult Function(LoyaltyMember member)? attachLoyaltyMember,
    TResult Function(double amount)? initiateEdcPayment,
    TResult Function(double amount, String referenceId, String? approvalCode)?
        edcPaymentConfirmed,
    TResult Function(String reason)? edcPaymentFailed,
    TResult Function()? cancelEdcPayment,
    required TResult orElse(),
  }) {
    if (refreshWithBalance != null) {
      return refreshWithBalance(balance);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_AddPaymentPart value) addPaymentPart,
    required TResult Function(_RemovePaymentPart value) removePaymentPart,
    required TResult Function(_ConfirmSplitTenderCheckout value)
        confirmSplitTenderCheckout,
    required TResult Function(_RefreshWithBalance value) refreshWithBalance,
    required TResult Function(_AttachLoyaltyMember value) attachLoyaltyMember,
    required TResult Function(_InitiateEdcPayment value) initiateEdcPayment,
    required TResult Function(_EdcPaymentConfirmed value) edcPaymentConfirmed,
    required TResult Function(_EdcPaymentFailed value) edcPaymentFailed,
    required TResult Function(_CancelEdcPayment value) cancelEdcPayment,
  }) {
    return refreshWithBalance(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_AddPaymentPart value)? addPaymentPart,
    TResult? Function(_RemovePaymentPart value)? removePaymentPart,
    TResult? Function(_ConfirmSplitTenderCheckout value)?
        confirmSplitTenderCheckout,
    TResult? Function(_RefreshWithBalance value)? refreshWithBalance,
    TResult? Function(_AttachLoyaltyMember value)? attachLoyaltyMember,
    TResult? Function(_InitiateEdcPayment value)? initiateEdcPayment,
    TResult? Function(_EdcPaymentConfirmed value)? edcPaymentConfirmed,
    TResult? Function(_EdcPaymentFailed value)? edcPaymentFailed,
    TResult? Function(_CancelEdcPayment value)? cancelEdcPayment,
  }) {
    return refreshWithBalance?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_AddPaymentPart value)? addPaymentPart,
    TResult Function(_RemovePaymentPart value)? removePaymentPart,
    TResult Function(_ConfirmSplitTenderCheckout value)?
        confirmSplitTenderCheckout,
    TResult Function(_RefreshWithBalance value)? refreshWithBalance,
    TResult Function(_AttachLoyaltyMember value)? attachLoyaltyMember,
    TResult Function(_InitiateEdcPayment value)? initiateEdcPayment,
    TResult Function(_EdcPaymentConfirmed value)? edcPaymentConfirmed,
    TResult Function(_EdcPaymentFailed value)? edcPaymentFailed,
    TResult Function(_CancelEdcPayment value)? cancelEdcPayment,
    required TResult orElse(),
  }) {
    if (refreshWithBalance != null) {
      return refreshWithBalance(this);
    }
    return orElse();
  }
}

abstract class _RefreshWithBalance implements CheckoutEvent {
  const factory _RefreshWithBalance(final double balance) =
      _$RefreshWithBalanceImpl;

  double get balance;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshWithBalanceImplCopyWith<_$RefreshWithBalanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AttachLoyaltyMemberImplCopyWith<$Res> {
  factory _$$AttachLoyaltyMemberImplCopyWith(_$AttachLoyaltyMemberImpl value,
          $Res Function(_$AttachLoyaltyMemberImpl) then) =
      __$$AttachLoyaltyMemberImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoyaltyMember member});

  $LoyaltyMemberCopyWith<$Res> get member;
}

/// @nodoc
class __$$AttachLoyaltyMemberImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$AttachLoyaltyMemberImpl>
    implements _$$AttachLoyaltyMemberImplCopyWith<$Res> {
  __$$AttachLoyaltyMemberImplCopyWithImpl(_$AttachLoyaltyMemberImpl _value,
      $Res Function(_$AttachLoyaltyMemberImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? member = null,
  }) {
    return _then(_$AttachLoyaltyMemberImpl(
      null == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as LoyaltyMember,
    ));
  }

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoyaltyMemberCopyWith<$Res> get member {
    return $LoyaltyMemberCopyWith<$Res>(_value.member, (value) {
      return _then(_value.copyWith(member: value));
    });
  }
}

/// @nodoc

class _$AttachLoyaltyMemberImpl implements _AttachLoyaltyMember {
  const _$AttachLoyaltyMemberImpl(this.member);

  @override
  final LoyaltyMember member;

  @override
  String toString() {
    return 'CheckoutEvent.attachLoyaltyMember(member: $member)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttachLoyaltyMemberImpl &&
            (identical(other.member, member) || other.member == member));
  }

  @override
  int get hashCode => Object.hash(runtimeType, member);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttachLoyaltyMemberImplCopyWith<_$AttachLoyaltyMemberImpl> get copyWith =>
      __$$AttachLoyaltyMemberImplCopyWithImpl<_$AttachLoyaltyMemberImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orderUuid, double totalAmount) started,
    required TResult Function(
            PaymentMethod method, double amount, double? tendered, String? note)
        processPayment,
    required TResult Function(PaymentPart part) addPaymentPart,
    required TResult Function(int index) removePaymentPart,
    required TResult Function() confirmSplitTenderCheckout,
    required TResult Function(double balance) refreshWithBalance,
    required TResult Function(LoyaltyMember member) attachLoyaltyMember,
    required TResult Function(double amount) initiateEdcPayment,
    required TResult Function(
            double amount, String referenceId, String? approvalCode)
        edcPaymentConfirmed,
    required TResult Function(String reason) edcPaymentFailed,
    required TResult Function() cancelEdcPayment,
  }) {
    return attachLoyaltyMember(member);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orderUuid, double totalAmount)? started,
    TResult? Function(PaymentMethod method, double amount, double? tendered,
            String? note)?
        processPayment,
    TResult? Function(PaymentPart part)? addPaymentPart,
    TResult? Function(int index)? removePaymentPart,
    TResult? Function()? confirmSplitTenderCheckout,
    TResult? Function(double balance)? refreshWithBalance,
    TResult? Function(LoyaltyMember member)? attachLoyaltyMember,
    TResult? Function(double amount)? initiateEdcPayment,
    TResult? Function(double amount, String referenceId, String? approvalCode)?
        edcPaymentConfirmed,
    TResult? Function(String reason)? edcPaymentFailed,
    TResult? Function()? cancelEdcPayment,
  }) {
    return attachLoyaltyMember?.call(member);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderUuid, double totalAmount)? started,
    TResult Function(PaymentMethod method, double amount, double? tendered,
            String? note)?
        processPayment,
    TResult Function(PaymentPart part)? addPaymentPart,
    TResult Function(int index)? removePaymentPart,
    TResult Function()? confirmSplitTenderCheckout,
    TResult Function(double balance)? refreshWithBalance,
    TResult Function(LoyaltyMember member)? attachLoyaltyMember,
    TResult Function(double amount)? initiateEdcPayment,
    TResult Function(double amount, String referenceId, String? approvalCode)?
        edcPaymentConfirmed,
    TResult Function(String reason)? edcPaymentFailed,
    TResult Function()? cancelEdcPayment,
    required TResult orElse(),
  }) {
    if (attachLoyaltyMember != null) {
      return attachLoyaltyMember(member);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_AddPaymentPart value) addPaymentPart,
    required TResult Function(_RemovePaymentPart value) removePaymentPart,
    required TResult Function(_ConfirmSplitTenderCheckout value)
        confirmSplitTenderCheckout,
    required TResult Function(_RefreshWithBalance value) refreshWithBalance,
    required TResult Function(_AttachLoyaltyMember value) attachLoyaltyMember,
    required TResult Function(_InitiateEdcPayment value) initiateEdcPayment,
    required TResult Function(_EdcPaymentConfirmed value) edcPaymentConfirmed,
    required TResult Function(_EdcPaymentFailed value) edcPaymentFailed,
    required TResult Function(_CancelEdcPayment value) cancelEdcPayment,
  }) {
    return attachLoyaltyMember(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_AddPaymentPart value)? addPaymentPart,
    TResult? Function(_RemovePaymentPart value)? removePaymentPart,
    TResult? Function(_ConfirmSplitTenderCheckout value)?
        confirmSplitTenderCheckout,
    TResult? Function(_RefreshWithBalance value)? refreshWithBalance,
    TResult? Function(_AttachLoyaltyMember value)? attachLoyaltyMember,
    TResult? Function(_InitiateEdcPayment value)? initiateEdcPayment,
    TResult? Function(_EdcPaymentConfirmed value)? edcPaymentConfirmed,
    TResult? Function(_EdcPaymentFailed value)? edcPaymentFailed,
    TResult? Function(_CancelEdcPayment value)? cancelEdcPayment,
  }) {
    return attachLoyaltyMember?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_AddPaymentPart value)? addPaymentPart,
    TResult Function(_RemovePaymentPart value)? removePaymentPart,
    TResult Function(_ConfirmSplitTenderCheckout value)?
        confirmSplitTenderCheckout,
    TResult Function(_RefreshWithBalance value)? refreshWithBalance,
    TResult Function(_AttachLoyaltyMember value)? attachLoyaltyMember,
    TResult Function(_InitiateEdcPayment value)? initiateEdcPayment,
    TResult Function(_EdcPaymentConfirmed value)? edcPaymentConfirmed,
    TResult Function(_EdcPaymentFailed value)? edcPaymentFailed,
    TResult Function(_CancelEdcPayment value)? cancelEdcPayment,
    required TResult orElse(),
  }) {
    if (attachLoyaltyMember != null) {
      return attachLoyaltyMember(this);
    }
    return orElse();
  }
}

abstract class _AttachLoyaltyMember implements CheckoutEvent {
  const factory _AttachLoyaltyMember(final LoyaltyMember member) =
      _$AttachLoyaltyMemberImpl;

  LoyaltyMember get member;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttachLoyaltyMemberImplCopyWith<_$AttachLoyaltyMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitiateEdcPaymentImplCopyWith<$Res> {
  factory _$$InitiateEdcPaymentImplCopyWith(_$InitiateEdcPaymentImpl value,
          $Res Function(_$InitiateEdcPaymentImpl) then) =
      __$$InitiateEdcPaymentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double amount});
}

/// @nodoc
class __$$InitiateEdcPaymentImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$InitiateEdcPaymentImpl>
    implements _$$InitiateEdcPaymentImplCopyWith<$Res> {
  __$$InitiateEdcPaymentImplCopyWithImpl(_$InitiateEdcPaymentImpl _value,
      $Res Function(_$InitiateEdcPaymentImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_$InitiateEdcPaymentImpl(
      null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$InitiateEdcPaymentImpl implements _InitiateEdcPayment {
  const _$InitiateEdcPaymentImpl(this.amount);

  @override
  final double amount;

  @override
  String toString() {
    return 'CheckoutEvent.initiateEdcPayment(amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitiateEdcPaymentImpl &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitiateEdcPaymentImplCopyWith<_$InitiateEdcPaymentImpl> get copyWith =>
      __$$InitiateEdcPaymentImplCopyWithImpl<_$InitiateEdcPaymentImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orderUuid, double totalAmount) started,
    required TResult Function(
            PaymentMethod method, double amount, double? tendered, String? note)
        processPayment,
    required TResult Function(PaymentPart part) addPaymentPart,
    required TResult Function(int index) removePaymentPart,
    required TResult Function() confirmSplitTenderCheckout,
    required TResult Function(double balance) refreshWithBalance,
    required TResult Function(LoyaltyMember member) attachLoyaltyMember,
    required TResult Function(double amount) initiateEdcPayment,
    required TResult Function(
            double amount, String referenceId, String? approvalCode)
        edcPaymentConfirmed,
    required TResult Function(String reason) edcPaymentFailed,
    required TResult Function() cancelEdcPayment,
  }) {
    return initiateEdcPayment(amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orderUuid, double totalAmount)? started,
    TResult? Function(PaymentMethod method, double amount, double? tendered,
            String? note)?
        processPayment,
    TResult? Function(PaymentPart part)? addPaymentPart,
    TResult? Function(int index)? removePaymentPart,
    TResult? Function()? confirmSplitTenderCheckout,
    TResult? Function(double balance)? refreshWithBalance,
    TResult? Function(LoyaltyMember member)? attachLoyaltyMember,
    TResult? Function(double amount)? initiateEdcPayment,
    TResult? Function(double amount, String referenceId, String? approvalCode)?
        edcPaymentConfirmed,
    TResult? Function(String reason)? edcPaymentFailed,
    TResult? Function()? cancelEdcPayment,
  }) {
    return initiateEdcPayment?.call(amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderUuid, double totalAmount)? started,
    TResult Function(PaymentMethod method, double amount, double? tendered,
            String? note)?
        processPayment,
    TResult Function(PaymentPart part)? addPaymentPart,
    TResult Function(int index)? removePaymentPart,
    TResult Function()? confirmSplitTenderCheckout,
    TResult Function(double balance)? refreshWithBalance,
    TResult Function(LoyaltyMember member)? attachLoyaltyMember,
    TResult Function(double amount)? initiateEdcPayment,
    TResult Function(double amount, String referenceId, String? approvalCode)?
        edcPaymentConfirmed,
    TResult Function(String reason)? edcPaymentFailed,
    TResult Function()? cancelEdcPayment,
    required TResult orElse(),
  }) {
    if (initiateEdcPayment != null) {
      return initiateEdcPayment(amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_AddPaymentPart value) addPaymentPart,
    required TResult Function(_RemovePaymentPart value) removePaymentPart,
    required TResult Function(_ConfirmSplitTenderCheckout value)
        confirmSplitTenderCheckout,
    required TResult Function(_RefreshWithBalance value) refreshWithBalance,
    required TResult Function(_AttachLoyaltyMember value) attachLoyaltyMember,
    required TResult Function(_InitiateEdcPayment value) initiateEdcPayment,
    required TResult Function(_EdcPaymentConfirmed value) edcPaymentConfirmed,
    required TResult Function(_EdcPaymentFailed value) edcPaymentFailed,
    required TResult Function(_CancelEdcPayment value) cancelEdcPayment,
  }) {
    return initiateEdcPayment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_AddPaymentPart value)? addPaymentPart,
    TResult? Function(_RemovePaymentPart value)? removePaymentPart,
    TResult? Function(_ConfirmSplitTenderCheckout value)?
        confirmSplitTenderCheckout,
    TResult? Function(_RefreshWithBalance value)? refreshWithBalance,
    TResult? Function(_AttachLoyaltyMember value)? attachLoyaltyMember,
    TResult? Function(_InitiateEdcPayment value)? initiateEdcPayment,
    TResult? Function(_EdcPaymentConfirmed value)? edcPaymentConfirmed,
    TResult? Function(_EdcPaymentFailed value)? edcPaymentFailed,
    TResult? Function(_CancelEdcPayment value)? cancelEdcPayment,
  }) {
    return initiateEdcPayment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_AddPaymentPart value)? addPaymentPart,
    TResult Function(_RemovePaymentPart value)? removePaymentPart,
    TResult Function(_ConfirmSplitTenderCheckout value)?
        confirmSplitTenderCheckout,
    TResult Function(_RefreshWithBalance value)? refreshWithBalance,
    TResult Function(_AttachLoyaltyMember value)? attachLoyaltyMember,
    TResult Function(_InitiateEdcPayment value)? initiateEdcPayment,
    TResult Function(_EdcPaymentConfirmed value)? edcPaymentConfirmed,
    TResult Function(_EdcPaymentFailed value)? edcPaymentFailed,
    TResult Function(_CancelEdcPayment value)? cancelEdcPayment,
    required TResult orElse(),
  }) {
    if (initiateEdcPayment != null) {
      return initiateEdcPayment(this);
    }
    return orElse();
  }
}

abstract class _InitiateEdcPayment implements CheckoutEvent {
  const factory _InitiateEdcPayment(final double amount) =
      _$InitiateEdcPaymentImpl;

  double get amount;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitiateEdcPaymentImplCopyWith<_$InitiateEdcPaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EdcPaymentConfirmedImplCopyWith<$Res> {
  factory _$$EdcPaymentConfirmedImplCopyWith(_$EdcPaymentConfirmedImpl value,
          $Res Function(_$EdcPaymentConfirmedImpl) then) =
      __$$EdcPaymentConfirmedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double amount, String referenceId, String? approvalCode});
}

/// @nodoc
class __$$EdcPaymentConfirmedImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$EdcPaymentConfirmedImpl>
    implements _$$EdcPaymentConfirmedImplCopyWith<$Res> {
  __$$EdcPaymentConfirmedImplCopyWithImpl(_$EdcPaymentConfirmedImpl _value,
      $Res Function(_$EdcPaymentConfirmedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? referenceId = null,
    Object? approvalCode = freezed,
  }) {
    return _then(_$EdcPaymentConfirmedImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      referenceId: null == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String,
      approvalCode: freezed == approvalCode
          ? _value.approvalCode
          : approvalCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$EdcPaymentConfirmedImpl implements _EdcPaymentConfirmed {
  const _$EdcPaymentConfirmedImpl(
      {required this.amount, required this.referenceId, this.approvalCode});

  @override
  final double amount;
  @override
  final String referenceId;
  @override
  final String? approvalCode;

  @override
  String toString() {
    return 'CheckoutEvent.edcPaymentConfirmed(amount: $amount, referenceId: $referenceId, approvalCode: $approvalCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EdcPaymentConfirmedImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.referenceId, referenceId) ||
                other.referenceId == referenceId) &&
            (identical(other.approvalCode, approvalCode) ||
                other.approvalCode == approvalCode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, amount, referenceId, approvalCode);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EdcPaymentConfirmedImplCopyWith<_$EdcPaymentConfirmedImpl> get copyWith =>
      __$$EdcPaymentConfirmedImplCopyWithImpl<_$EdcPaymentConfirmedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orderUuid, double totalAmount) started,
    required TResult Function(
            PaymentMethod method, double amount, double? tendered, String? note)
        processPayment,
    required TResult Function(PaymentPart part) addPaymentPart,
    required TResult Function(int index) removePaymentPart,
    required TResult Function() confirmSplitTenderCheckout,
    required TResult Function(double balance) refreshWithBalance,
    required TResult Function(LoyaltyMember member) attachLoyaltyMember,
    required TResult Function(double amount) initiateEdcPayment,
    required TResult Function(
            double amount, String referenceId, String? approvalCode)
        edcPaymentConfirmed,
    required TResult Function(String reason) edcPaymentFailed,
    required TResult Function() cancelEdcPayment,
  }) {
    return edcPaymentConfirmed(amount, referenceId, approvalCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orderUuid, double totalAmount)? started,
    TResult? Function(PaymentMethod method, double amount, double? tendered,
            String? note)?
        processPayment,
    TResult? Function(PaymentPart part)? addPaymentPart,
    TResult? Function(int index)? removePaymentPart,
    TResult? Function()? confirmSplitTenderCheckout,
    TResult? Function(double balance)? refreshWithBalance,
    TResult? Function(LoyaltyMember member)? attachLoyaltyMember,
    TResult? Function(double amount)? initiateEdcPayment,
    TResult? Function(double amount, String referenceId, String? approvalCode)?
        edcPaymentConfirmed,
    TResult? Function(String reason)? edcPaymentFailed,
    TResult? Function()? cancelEdcPayment,
  }) {
    return edcPaymentConfirmed?.call(amount, referenceId, approvalCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderUuid, double totalAmount)? started,
    TResult Function(PaymentMethod method, double amount, double? tendered,
            String? note)?
        processPayment,
    TResult Function(PaymentPart part)? addPaymentPart,
    TResult Function(int index)? removePaymentPart,
    TResult Function()? confirmSplitTenderCheckout,
    TResult Function(double balance)? refreshWithBalance,
    TResult Function(LoyaltyMember member)? attachLoyaltyMember,
    TResult Function(double amount)? initiateEdcPayment,
    TResult Function(double amount, String referenceId, String? approvalCode)?
        edcPaymentConfirmed,
    TResult Function(String reason)? edcPaymentFailed,
    TResult Function()? cancelEdcPayment,
    required TResult orElse(),
  }) {
    if (edcPaymentConfirmed != null) {
      return edcPaymentConfirmed(amount, referenceId, approvalCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_AddPaymentPart value) addPaymentPart,
    required TResult Function(_RemovePaymentPart value) removePaymentPart,
    required TResult Function(_ConfirmSplitTenderCheckout value)
        confirmSplitTenderCheckout,
    required TResult Function(_RefreshWithBalance value) refreshWithBalance,
    required TResult Function(_AttachLoyaltyMember value) attachLoyaltyMember,
    required TResult Function(_InitiateEdcPayment value) initiateEdcPayment,
    required TResult Function(_EdcPaymentConfirmed value) edcPaymentConfirmed,
    required TResult Function(_EdcPaymentFailed value) edcPaymentFailed,
    required TResult Function(_CancelEdcPayment value) cancelEdcPayment,
  }) {
    return edcPaymentConfirmed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_AddPaymentPart value)? addPaymentPart,
    TResult? Function(_RemovePaymentPart value)? removePaymentPart,
    TResult? Function(_ConfirmSplitTenderCheckout value)?
        confirmSplitTenderCheckout,
    TResult? Function(_RefreshWithBalance value)? refreshWithBalance,
    TResult? Function(_AttachLoyaltyMember value)? attachLoyaltyMember,
    TResult? Function(_InitiateEdcPayment value)? initiateEdcPayment,
    TResult? Function(_EdcPaymentConfirmed value)? edcPaymentConfirmed,
    TResult? Function(_EdcPaymentFailed value)? edcPaymentFailed,
    TResult? Function(_CancelEdcPayment value)? cancelEdcPayment,
  }) {
    return edcPaymentConfirmed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_AddPaymentPart value)? addPaymentPart,
    TResult Function(_RemovePaymentPart value)? removePaymentPart,
    TResult Function(_ConfirmSplitTenderCheckout value)?
        confirmSplitTenderCheckout,
    TResult Function(_RefreshWithBalance value)? refreshWithBalance,
    TResult Function(_AttachLoyaltyMember value)? attachLoyaltyMember,
    TResult Function(_InitiateEdcPayment value)? initiateEdcPayment,
    TResult Function(_EdcPaymentConfirmed value)? edcPaymentConfirmed,
    TResult Function(_EdcPaymentFailed value)? edcPaymentFailed,
    TResult Function(_CancelEdcPayment value)? cancelEdcPayment,
    required TResult orElse(),
  }) {
    if (edcPaymentConfirmed != null) {
      return edcPaymentConfirmed(this);
    }
    return orElse();
  }
}

abstract class _EdcPaymentConfirmed implements CheckoutEvent {
  const factory _EdcPaymentConfirmed(
      {required final double amount,
      required final String referenceId,
      final String? approvalCode}) = _$EdcPaymentConfirmedImpl;

  double get amount;
  String get referenceId;
  String? get approvalCode;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EdcPaymentConfirmedImplCopyWith<_$EdcPaymentConfirmedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EdcPaymentFailedImplCopyWith<$Res> {
  factory _$$EdcPaymentFailedImplCopyWith(_$EdcPaymentFailedImpl value,
          $Res Function(_$EdcPaymentFailedImpl) then) =
      __$$EdcPaymentFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String reason});
}

/// @nodoc
class __$$EdcPaymentFailedImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$EdcPaymentFailedImpl>
    implements _$$EdcPaymentFailedImplCopyWith<$Res> {
  __$$EdcPaymentFailedImplCopyWithImpl(_$EdcPaymentFailedImpl _value,
      $Res Function(_$EdcPaymentFailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
  }) {
    return _then(_$EdcPaymentFailedImpl(
      null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EdcPaymentFailedImpl implements _EdcPaymentFailed {
  const _$EdcPaymentFailedImpl(this.reason);

  @override
  final String reason;

  @override
  String toString() {
    return 'CheckoutEvent.edcPaymentFailed(reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EdcPaymentFailedImpl &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EdcPaymentFailedImplCopyWith<_$EdcPaymentFailedImpl> get copyWith =>
      __$$EdcPaymentFailedImplCopyWithImpl<_$EdcPaymentFailedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orderUuid, double totalAmount) started,
    required TResult Function(
            PaymentMethod method, double amount, double? tendered, String? note)
        processPayment,
    required TResult Function(PaymentPart part) addPaymentPart,
    required TResult Function(int index) removePaymentPart,
    required TResult Function() confirmSplitTenderCheckout,
    required TResult Function(double balance) refreshWithBalance,
    required TResult Function(LoyaltyMember member) attachLoyaltyMember,
    required TResult Function(double amount) initiateEdcPayment,
    required TResult Function(
            double amount, String referenceId, String? approvalCode)
        edcPaymentConfirmed,
    required TResult Function(String reason) edcPaymentFailed,
    required TResult Function() cancelEdcPayment,
  }) {
    return edcPaymentFailed(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orderUuid, double totalAmount)? started,
    TResult? Function(PaymentMethod method, double amount, double? tendered,
            String? note)?
        processPayment,
    TResult? Function(PaymentPart part)? addPaymentPart,
    TResult? Function(int index)? removePaymentPart,
    TResult? Function()? confirmSplitTenderCheckout,
    TResult? Function(double balance)? refreshWithBalance,
    TResult? Function(LoyaltyMember member)? attachLoyaltyMember,
    TResult? Function(double amount)? initiateEdcPayment,
    TResult? Function(double amount, String referenceId, String? approvalCode)?
        edcPaymentConfirmed,
    TResult? Function(String reason)? edcPaymentFailed,
    TResult? Function()? cancelEdcPayment,
  }) {
    return edcPaymentFailed?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderUuid, double totalAmount)? started,
    TResult Function(PaymentMethod method, double amount, double? tendered,
            String? note)?
        processPayment,
    TResult Function(PaymentPart part)? addPaymentPart,
    TResult Function(int index)? removePaymentPart,
    TResult Function()? confirmSplitTenderCheckout,
    TResult Function(double balance)? refreshWithBalance,
    TResult Function(LoyaltyMember member)? attachLoyaltyMember,
    TResult Function(double amount)? initiateEdcPayment,
    TResult Function(double amount, String referenceId, String? approvalCode)?
        edcPaymentConfirmed,
    TResult Function(String reason)? edcPaymentFailed,
    TResult Function()? cancelEdcPayment,
    required TResult orElse(),
  }) {
    if (edcPaymentFailed != null) {
      return edcPaymentFailed(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_AddPaymentPart value) addPaymentPart,
    required TResult Function(_RemovePaymentPart value) removePaymentPart,
    required TResult Function(_ConfirmSplitTenderCheckout value)
        confirmSplitTenderCheckout,
    required TResult Function(_RefreshWithBalance value) refreshWithBalance,
    required TResult Function(_AttachLoyaltyMember value) attachLoyaltyMember,
    required TResult Function(_InitiateEdcPayment value) initiateEdcPayment,
    required TResult Function(_EdcPaymentConfirmed value) edcPaymentConfirmed,
    required TResult Function(_EdcPaymentFailed value) edcPaymentFailed,
    required TResult Function(_CancelEdcPayment value) cancelEdcPayment,
  }) {
    return edcPaymentFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_AddPaymentPart value)? addPaymentPart,
    TResult? Function(_RemovePaymentPart value)? removePaymentPart,
    TResult? Function(_ConfirmSplitTenderCheckout value)?
        confirmSplitTenderCheckout,
    TResult? Function(_RefreshWithBalance value)? refreshWithBalance,
    TResult? Function(_AttachLoyaltyMember value)? attachLoyaltyMember,
    TResult? Function(_InitiateEdcPayment value)? initiateEdcPayment,
    TResult? Function(_EdcPaymentConfirmed value)? edcPaymentConfirmed,
    TResult? Function(_EdcPaymentFailed value)? edcPaymentFailed,
    TResult? Function(_CancelEdcPayment value)? cancelEdcPayment,
  }) {
    return edcPaymentFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_AddPaymentPart value)? addPaymentPart,
    TResult Function(_RemovePaymentPart value)? removePaymentPart,
    TResult Function(_ConfirmSplitTenderCheckout value)?
        confirmSplitTenderCheckout,
    TResult Function(_RefreshWithBalance value)? refreshWithBalance,
    TResult Function(_AttachLoyaltyMember value)? attachLoyaltyMember,
    TResult Function(_InitiateEdcPayment value)? initiateEdcPayment,
    TResult Function(_EdcPaymentConfirmed value)? edcPaymentConfirmed,
    TResult Function(_EdcPaymentFailed value)? edcPaymentFailed,
    TResult Function(_CancelEdcPayment value)? cancelEdcPayment,
    required TResult orElse(),
  }) {
    if (edcPaymentFailed != null) {
      return edcPaymentFailed(this);
    }
    return orElse();
  }
}

abstract class _EdcPaymentFailed implements CheckoutEvent {
  const factory _EdcPaymentFailed(final String reason) = _$EdcPaymentFailedImpl;

  String get reason;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EdcPaymentFailedImplCopyWith<_$EdcPaymentFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelEdcPaymentImplCopyWith<$Res> {
  factory _$$CancelEdcPaymentImplCopyWith(_$CancelEdcPaymentImpl value,
          $Res Function(_$CancelEdcPaymentImpl) then) =
      __$$CancelEdcPaymentImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CancelEdcPaymentImplCopyWithImpl<$Res>
    extends _$CheckoutEventCopyWithImpl<$Res, _$CancelEdcPaymentImpl>
    implements _$$CancelEdcPaymentImplCopyWith<$Res> {
  __$$CancelEdcPaymentImplCopyWithImpl(_$CancelEdcPaymentImpl _value,
      $Res Function(_$CancelEdcPaymentImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CancelEdcPaymentImpl implements _CancelEdcPayment {
  const _$CancelEdcPaymentImpl();

  @override
  String toString() {
    return 'CheckoutEvent.cancelEdcPayment()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CancelEdcPaymentImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orderUuid, double totalAmount) started,
    required TResult Function(
            PaymentMethod method, double amount, double? tendered, String? note)
        processPayment,
    required TResult Function(PaymentPart part) addPaymentPart,
    required TResult Function(int index) removePaymentPart,
    required TResult Function() confirmSplitTenderCheckout,
    required TResult Function(double balance) refreshWithBalance,
    required TResult Function(LoyaltyMember member) attachLoyaltyMember,
    required TResult Function(double amount) initiateEdcPayment,
    required TResult Function(
            double amount, String referenceId, String? approvalCode)
        edcPaymentConfirmed,
    required TResult Function(String reason) edcPaymentFailed,
    required TResult Function() cancelEdcPayment,
  }) {
    return cancelEdcPayment();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String orderUuid, double totalAmount)? started,
    TResult? Function(PaymentMethod method, double amount, double? tendered,
            String? note)?
        processPayment,
    TResult? Function(PaymentPart part)? addPaymentPart,
    TResult? Function(int index)? removePaymentPart,
    TResult? Function()? confirmSplitTenderCheckout,
    TResult? Function(double balance)? refreshWithBalance,
    TResult? Function(LoyaltyMember member)? attachLoyaltyMember,
    TResult? Function(double amount)? initiateEdcPayment,
    TResult? Function(double amount, String referenceId, String? approvalCode)?
        edcPaymentConfirmed,
    TResult? Function(String reason)? edcPaymentFailed,
    TResult? Function()? cancelEdcPayment,
  }) {
    return cancelEdcPayment?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderUuid, double totalAmount)? started,
    TResult Function(PaymentMethod method, double amount, double? tendered,
            String? note)?
        processPayment,
    TResult Function(PaymentPart part)? addPaymentPart,
    TResult Function(int index)? removePaymentPart,
    TResult Function()? confirmSplitTenderCheckout,
    TResult Function(double balance)? refreshWithBalance,
    TResult Function(LoyaltyMember member)? attachLoyaltyMember,
    TResult Function(double amount)? initiateEdcPayment,
    TResult Function(double amount, String referenceId, String? approvalCode)?
        edcPaymentConfirmed,
    TResult Function(String reason)? edcPaymentFailed,
    TResult Function()? cancelEdcPayment,
    required TResult orElse(),
  }) {
    if (cancelEdcPayment != null) {
      return cancelEdcPayment();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ProcessPayment value) processPayment,
    required TResult Function(_AddPaymentPart value) addPaymentPart,
    required TResult Function(_RemovePaymentPart value) removePaymentPart,
    required TResult Function(_ConfirmSplitTenderCheckout value)
        confirmSplitTenderCheckout,
    required TResult Function(_RefreshWithBalance value) refreshWithBalance,
    required TResult Function(_AttachLoyaltyMember value) attachLoyaltyMember,
    required TResult Function(_InitiateEdcPayment value) initiateEdcPayment,
    required TResult Function(_EdcPaymentConfirmed value) edcPaymentConfirmed,
    required TResult Function(_EdcPaymentFailed value) edcPaymentFailed,
    required TResult Function(_CancelEdcPayment value) cancelEdcPayment,
  }) {
    return cancelEdcPayment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ProcessPayment value)? processPayment,
    TResult? Function(_AddPaymentPart value)? addPaymentPart,
    TResult? Function(_RemovePaymentPart value)? removePaymentPart,
    TResult? Function(_ConfirmSplitTenderCheckout value)?
        confirmSplitTenderCheckout,
    TResult? Function(_RefreshWithBalance value)? refreshWithBalance,
    TResult? Function(_AttachLoyaltyMember value)? attachLoyaltyMember,
    TResult? Function(_InitiateEdcPayment value)? initiateEdcPayment,
    TResult? Function(_EdcPaymentConfirmed value)? edcPaymentConfirmed,
    TResult? Function(_EdcPaymentFailed value)? edcPaymentFailed,
    TResult? Function(_CancelEdcPayment value)? cancelEdcPayment,
  }) {
    return cancelEdcPayment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ProcessPayment value)? processPayment,
    TResult Function(_AddPaymentPart value)? addPaymentPart,
    TResult Function(_RemovePaymentPart value)? removePaymentPart,
    TResult Function(_ConfirmSplitTenderCheckout value)?
        confirmSplitTenderCheckout,
    TResult Function(_RefreshWithBalance value)? refreshWithBalance,
    TResult Function(_AttachLoyaltyMember value)? attachLoyaltyMember,
    TResult Function(_InitiateEdcPayment value)? initiateEdcPayment,
    TResult Function(_EdcPaymentConfirmed value)? edcPaymentConfirmed,
    TResult Function(_EdcPaymentFailed value)? edcPaymentFailed,
    TResult Function(_CancelEdcPayment value)? cancelEdcPayment,
    required TResult orElse(),
  }) {
    if (cancelEdcPayment != null) {
      return cancelEdcPayment(this);
    }
    return orElse();
  }
}

abstract class _CancelEdcPayment implements CheckoutEvent {
  const factory _CancelEdcPayment() = _$CancelEdcPaymentImpl;
}

/// @nodoc
mixin _$CheckoutState {
  String get orderUuid => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  double get remainingBalance => throw _privateConstructorUsedError;
  double get amountPaid => throw _privateConstructorUsedError;
  List<PaymentPart> get paymentParts => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isComplete => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  LoyaltyMember? get attachedMember => throw _privateConstructorUsedError;
  List<OrderItemTableData> get items =>
      throw _privateConstructorUsedError; // EDC State Fields
  bool get isAwaitingEdc => throw _privateConstructorUsedError;
  EdcTerminalStatus get edcTerminalStatus => throw _privateConstructorUsedError;
  String? get lastApprovalCode => throw _privateConstructorUsedError;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckoutStateCopyWith<CheckoutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutStateCopyWith<$Res> {
  factory $CheckoutStateCopyWith(
          CheckoutState value, $Res Function(CheckoutState) then) =
      _$CheckoutStateCopyWithImpl<$Res, CheckoutState>;
  @useResult
  $Res call(
      {String orderUuid,
      double totalAmount,
      double remainingBalance,
      double amountPaid,
      List<PaymentPart> paymentParts,
      bool isLoading,
      bool isComplete,
      String? errorMessage,
      LoyaltyMember? attachedMember,
      List<OrderItemTableData> items,
      bool isAwaitingEdc,
      EdcTerminalStatus edcTerminalStatus,
      String? lastApprovalCode});

  $LoyaltyMemberCopyWith<$Res>? get attachedMember;
}

/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res, $Val extends CheckoutState>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderUuid = null,
    Object? totalAmount = null,
    Object? remainingBalance = null,
    Object? amountPaid = null,
    Object? paymentParts = null,
    Object? isLoading = null,
    Object? isComplete = null,
    Object? errorMessage = freezed,
    Object? attachedMember = freezed,
    Object? items = null,
    Object? isAwaitingEdc = null,
    Object? edcTerminalStatus = null,
    Object? lastApprovalCode = freezed,
  }) {
    return _then(_value.copyWith(
      orderUuid: null == orderUuid
          ? _value.orderUuid
          : orderUuid // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      remainingBalance: null == remainingBalance
          ? _value.remainingBalance
          : remainingBalance // ignore: cast_nullable_to_non_nullable
              as double,
      amountPaid: null == amountPaid
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as double,
      paymentParts: null == paymentParts
          ? _value.paymentParts
          : paymentParts // ignore: cast_nullable_to_non_nullable
              as List<PaymentPart>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isComplete: null == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      attachedMember: freezed == attachedMember
          ? _value.attachedMember
          : attachedMember // ignore: cast_nullable_to_non_nullable
              as LoyaltyMember?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemTableData>,
      isAwaitingEdc: null == isAwaitingEdc
          ? _value.isAwaitingEdc
          : isAwaitingEdc // ignore: cast_nullable_to_non_nullable
              as bool,
      edcTerminalStatus: null == edcTerminalStatus
          ? _value.edcTerminalStatus
          : edcTerminalStatus // ignore: cast_nullable_to_non_nullable
              as EdcTerminalStatus,
      lastApprovalCode: freezed == lastApprovalCode
          ? _value.lastApprovalCode
          : lastApprovalCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoyaltyMemberCopyWith<$Res>? get attachedMember {
    if (_value.attachedMember == null) {
      return null;
    }

    return $LoyaltyMemberCopyWith<$Res>(_value.attachedMember!, (value) {
      return _then(_value.copyWith(attachedMember: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CheckoutStateImplCopyWith<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  factory _$$CheckoutStateImplCopyWith(
          _$CheckoutStateImpl value, $Res Function(_$CheckoutStateImpl) then) =
      __$$CheckoutStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String orderUuid,
      double totalAmount,
      double remainingBalance,
      double amountPaid,
      List<PaymentPart> paymentParts,
      bool isLoading,
      bool isComplete,
      String? errorMessage,
      LoyaltyMember? attachedMember,
      List<OrderItemTableData> items,
      bool isAwaitingEdc,
      EdcTerminalStatus edcTerminalStatus,
      String? lastApprovalCode});

  @override
  $LoyaltyMemberCopyWith<$Res>? get attachedMember;
}

/// @nodoc
class __$$CheckoutStateImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$CheckoutStateImpl>
    implements _$$CheckoutStateImplCopyWith<$Res> {
  __$$CheckoutStateImplCopyWithImpl(
      _$CheckoutStateImpl _value, $Res Function(_$CheckoutStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderUuid = null,
    Object? totalAmount = null,
    Object? remainingBalance = null,
    Object? amountPaid = null,
    Object? paymentParts = null,
    Object? isLoading = null,
    Object? isComplete = null,
    Object? errorMessage = freezed,
    Object? attachedMember = freezed,
    Object? items = null,
    Object? isAwaitingEdc = null,
    Object? edcTerminalStatus = null,
    Object? lastApprovalCode = freezed,
  }) {
    return _then(_$CheckoutStateImpl(
      orderUuid: null == orderUuid
          ? _value.orderUuid
          : orderUuid // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      remainingBalance: null == remainingBalance
          ? _value.remainingBalance
          : remainingBalance // ignore: cast_nullable_to_non_nullable
              as double,
      amountPaid: null == amountPaid
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as double,
      paymentParts: null == paymentParts
          ? _value._paymentParts
          : paymentParts // ignore: cast_nullable_to_non_nullable
              as List<PaymentPart>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isComplete: null == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      attachedMember: freezed == attachedMember
          ? _value.attachedMember
          : attachedMember // ignore: cast_nullable_to_non_nullable
              as LoyaltyMember?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemTableData>,
      isAwaitingEdc: null == isAwaitingEdc
          ? _value.isAwaitingEdc
          : isAwaitingEdc // ignore: cast_nullable_to_non_nullable
              as bool,
      edcTerminalStatus: null == edcTerminalStatus
          ? _value.edcTerminalStatus
          : edcTerminalStatus // ignore: cast_nullable_to_non_nullable
              as EdcTerminalStatus,
      lastApprovalCode: freezed == lastApprovalCode
          ? _value.lastApprovalCode
          : lastApprovalCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CheckoutStateImpl implements _CheckoutState {
  const _$CheckoutStateImpl(
      {required this.orderUuid,
      required this.totalAmount,
      required this.remainingBalance,
      this.amountPaid = 0.0,
      final List<PaymentPart> paymentParts = const [],
      this.isLoading = false,
      this.isComplete = false,
      this.errorMessage,
      this.attachedMember,
      final List<OrderItemTableData> items = const [],
      this.isAwaitingEdc = false,
      this.edcTerminalStatus = EdcTerminalStatus.idle,
      this.lastApprovalCode})
      : _paymentParts = paymentParts,
        _items = items;

  @override
  final String orderUuid;
  @override
  final double totalAmount;
  @override
  final double remainingBalance;
  @override
  @JsonKey()
  final double amountPaid;
  final List<PaymentPart> _paymentParts;
  @override
  @JsonKey()
  List<PaymentPart> get paymentParts {
    if (_paymentParts is EqualUnmodifiableListView) return _paymentParts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentParts);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isComplete;
  @override
  final String? errorMessage;
  @override
  final LoyaltyMember? attachedMember;
  final List<OrderItemTableData> _items;
  @override
  @JsonKey()
  List<OrderItemTableData> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

// EDC State Fields
  @override
  @JsonKey()
  final bool isAwaitingEdc;
  @override
  @JsonKey()
  final EdcTerminalStatus edcTerminalStatus;
  @override
  final String? lastApprovalCode;

  @override
  String toString() {
    return 'CheckoutState(orderUuid: $orderUuid, totalAmount: $totalAmount, remainingBalance: $remainingBalance, amountPaid: $amountPaid, paymentParts: $paymentParts, isLoading: $isLoading, isComplete: $isComplete, errorMessage: $errorMessage, attachedMember: $attachedMember, items: $items, isAwaitingEdc: $isAwaitingEdc, edcTerminalStatus: $edcTerminalStatus, lastApprovalCode: $lastApprovalCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutStateImpl &&
            (identical(other.orderUuid, orderUuid) ||
                other.orderUuid == orderUuid) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.remainingBalance, remainingBalance) ||
                other.remainingBalance == remainingBalance) &&
            (identical(other.amountPaid, amountPaid) ||
                other.amountPaid == amountPaid) &&
            const DeepCollectionEquality()
                .equals(other._paymentParts, _paymentParts) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.attachedMember, attachedMember) ||
                other.attachedMember == attachedMember) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.isAwaitingEdc, isAwaitingEdc) ||
                other.isAwaitingEdc == isAwaitingEdc) &&
            (identical(other.edcTerminalStatus, edcTerminalStatus) ||
                other.edcTerminalStatus == edcTerminalStatus) &&
            (identical(other.lastApprovalCode, lastApprovalCode) ||
                other.lastApprovalCode == lastApprovalCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderUuid,
      totalAmount,
      remainingBalance,
      amountPaid,
      const DeepCollectionEquality().hash(_paymentParts),
      isLoading,
      isComplete,
      errorMessage,
      attachedMember,
      const DeepCollectionEquality().hash(_items),
      isAwaitingEdc,
      edcTerminalStatus,
      lastApprovalCode);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutStateImplCopyWith<_$CheckoutStateImpl> get copyWith =>
      __$$CheckoutStateImplCopyWithImpl<_$CheckoutStateImpl>(this, _$identity);
}

abstract class _CheckoutState implements CheckoutState {
  const factory _CheckoutState(
      {required final String orderUuid,
      required final double totalAmount,
      required final double remainingBalance,
      final double amountPaid,
      final List<PaymentPart> paymentParts,
      final bool isLoading,
      final bool isComplete,
      final String? errorMessage,
      final LoyaltyMember? attachedMember,
      final List<OrderItemTableData> items,
      final bool isAwaitingEdc,
      final EdcTerminalStatus edcTerminalStatus,
      final String? lastApprovalCode}) = _$CheckoutStateImpl;

  @override
  String get orderUuid;
  @override
  double get totalAmount;
  @override
  double get remainingBalance;
  @override
  double get amountPaid;
  @override
  List<PaymentPart> get paymentParts;
  @override
  bool get isLoading;
  @override
  bool get isComplete;
  @override
  String? get errorMessage;
  @override
  LoyaltyMember? get attachedMember;
  @override
  List<OrderItemTableData> get items; // EDC State Fields
  @override
  bool get isAwaitingEdc;
  @override
  EdcTerminalStatus get edcTerminalStatus;
  @override
  String? get lastApprovalCode;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutStateImplCopyWith<_$CheckoutStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
