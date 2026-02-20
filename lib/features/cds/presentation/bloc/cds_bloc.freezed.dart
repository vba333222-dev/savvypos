// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cds_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CdsEvent {
  Map<String, dynamic> get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> message)
        socketMessageReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> message)? socketMessageReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> message)? socketMessageReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SocketMessageReceived value)
        socketMessageReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SocketMessageReceived value)? socketMessageReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SocketMessageReceived value)? socketMessageReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of CdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CdsEventCopyWith<CdsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CdsEventCopyWith<$Res> {
  factory $CdsEventCopyWith(CdsEvent value, $Res Function(CdsEvent) then) =
      _$CdsEventCopyWithImpl<$Res, CdsEvent>;
  @useResult
  $Res call({Map<String, dynamic> message});
}

/// @nodoc
class _$CdsEventCopyWithImpl<$Res, $Val extends CdsEvent>
    implements $CdsEventCopyWith<$Res> {
  _$CdsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SocketMessageReceivedImplCopyWith<$Res>
    implements $CdsEventCopyWith<$Res> {
  factory _$$SocketMessageReceivedImplCopyWith(
          _$SocketMessageReceivedImpl value,
          $Res Function(_$SocketMessageReceivedImpl) then) =
      __$$SocketMessageReceivedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> message});
}

/// @nodoc
class __$$SocketMessageReceivedImplCopyWithImpl<$Res>
    extends _$CdsEventCopyWithImpl<$Res, _$SocketMessageReceivedImpl>
    implements _$$SocketMessageReceivedImplCopyWith<$Res> {
  __$$SocketMessageReceivedImplCopyWithImpl(_$SocketMessageReceivedImpl _value,
      $Res Function(_$SocketMessageReceivedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SocketMessageReceivedImpl(
      null == message
          ? _value._message
          : message // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$SocketMessageReceivedImpl implements _SocketMessageReceived {
  const _$SocketMessageReceivedImpl(final Map<String, dynamic> message)
      : _message = message;

  final Map<String, dynamic> _message;
  @override
  Map<String, dynamic> get message {
    if (_message is EqualUnmodifiableMapView) return _message;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_message);
  }

  @override
  String toString() {
    return 'CdsEvent.socketMessageReceived(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocketMessageReceivedImpl &&
            const DeepCollectionEquality().equals(other._message, _message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_message));

  /// Create a copy of CdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocketMessageReceivedImplCopyWith<_$SocketMessageReceivedImpl>
      get copyWith => __$$SocketMessageReceivedImplCopyWithImpl<
          _$SocketMessageReceivedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> message)
        socketMessageReceived,
  }) {
    return socketMessageReceived(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> message)? socketMessageReceived,
  }) {
    return socketMessageReceived?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> message)? socketMessageReceived,
    required TResult orElse(),
  }) {
    if (socketMessageReceived != null) {
      return socketMessageReceived(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SocketMessageReceived value)
        socketMessageReceived,
  }) {
    return socketMessageReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SocketMessageReceived value)? socketMessageReceived,
  }) {
    return socketMessageReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SocketMessageReceived value)? socketMessageReceived,
    required TResult orElse(),
  }) {
    if (socketMessageReceived != null) {
      return socketMessageReceived(this);
    }
    return orElse();
  }
}

abstract class _SocketMessageReceived implements CdsEvent {
  const factory _SocketMessageReceived(final Map<String, dynamic> message) =
      _$SocketMessageReceivedImpl;

  @override
  Map<String, dynamic> get message;

  /// Create a copy of CdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocketMessageReceivedImplCopyWith<_$SocketMessageReceivedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CdsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(List<dynamic> items, double total, double tax)
        activeCart,
    required TResult Function(String qrData) paymentRequest,
    required TResult Function(int pointsEarned) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(List<dynamic> items, double total, double tax)?
        activeCart,
    TResult? Function(String qrData)? paymentRequest,
    TResult? Function(int pointsEarned)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(List<dynamic> items, double total, double tax)? activeCart,
    TResult Function(String qrData)? paymentRequest,
    TResult Function(int pointsEarned)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_ActiveCart value) activeCart,
    required TResult Function(_PaymentRequest value) paymentRequest,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_ActiveCart value)? activeCart,
    TResult? Function(_PaymentRequest value)? paymentRequest,
    TResult? Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_ActiveCart value)? activeCart,
    TResult Function(_PaymentRequest value)? paymentRequest,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CdsStateCopyWith<$Res> {
  factory $CdsStateCopyWith(CdsState value, $Res Function(CdsState) then) =
      _$CdsStateCopyWithImpl<$Res, CdsState>;
}

/// @nodoc
class _$CdsStateCopyWithImpl<$Res, $Val extends CdsState>
    implements $CdsStateCopyWith<$Res> {
  _$CdsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CdsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$IdleImplCopyWith<$Res> {
  factory _$$IdleImplCopyWith(
          _$IdleImpl value, $Res Function(_$IdleImpl) then) =
      __$$IdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IdleImplCopyWithImpl<$Res>
    extends _$CdsStateCopyWithImpl<$Res, _$IdleImpl>
    implements _$$IdleImplCopyWith<$Res> {
  __$$IdleImplCopyWithImpl(_$IdleImpl _value, $Res Function(_$IdleImpl) _then)
      : super(_value, _then);

  /// Create a copy of CdsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$IdleImpl implements _Idle {
  const _$IdleImpl();

  @override
  String toString() {
    return 'CdsState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(List<dynamic> items, double total, double tax)
        activeCart,
    required TResult Function(String qrData) paymentRequest,
    required TResult Function(int pointsEarned) success,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(List<dynamic> items, double total, double tax)?
        activeCart,
    TResult? Function(String qrData)? paymentRequest,
    TResult? Function(int pointsEarned)? success,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(List<dynamic> items, double total, double tax)? activeCart,
    TResult Function(String qrData)? paymentRequest,
    TResult Function(int pointsEarned)? success,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_ActiveCart value) activeCart,
    required TResult Function(_PaymentRequest value) paymentRequest,
    required TResult Function(_Success value) success,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_ActiveCart value)? activeCart,
    TResult? Function(_PaymentRequest value)? paymentRequest,
    TResult? Function(_Success value)? success,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_ActiveCart value)? activeCart,
    TResult Function(_PaymentRequest value)? paymentRequest,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle implements CdsState {
  const factory _Idle() = _$IdleImpl;
}

/// @nodoc
abstract class _$$ActiveCartImplCopyWith<$Res> {
  factory _$$ActiveCartImplCopyWith(
          _$ActiveCartImpl value, $Res Function(_$ActiveCartImpl) then) =
      __$$ActiveCartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<dynamic> items, double total, double tax});
}

/// @nodoc
class __$$ActiveCartImplCopyWithImpl<$Res>
    extends _$CdsStateCopyWithImpl<$Res, _$ActiveCartImpl>
    implements _$$ActiveCartImplCopyWith<$Res> {
  __$$ActiveCartImplCopyWithImpl(
      _$ActiveCartImpl _value, $Res Function(_$ActiveCartImpl) _then)
      : super(_value, _then);

  /// Create a copy of CdsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? total = null,
    Object? tax = null,
  }) {
    return _then(_$ActiveCartImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ActiveCartImpl implements _ActiveCart {
  const _$ActiveCartImpl(
      {required final List<dynamic> items,
      required this.total,
      required this.tax})
      : _items = items;

  final List<dynamic> _items;
  @override
  List<dynamic> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

// Using dynamic for prototype
  @override
  final double total;
  @override
  final double tax;

  @override
  String toString() {
    return 'CdsState.activeCart(items: $items, total: $total, tax: $tax)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActiveCartImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.tax, tax) || other.tax == tax));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), total, tax);

  /// Create a copy of CdsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActiveCartImplCopyWith<_$ActiveCartImpl> get copyWith =>
      __$$ActiveCartImplCopyWithImpl<_$ActiveCartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(List<dynamic> items, double total, double tax)
        activeCart,
    required TResult Function(String qrData) paymentRequest,
    required TResult Function(int pointsEarned) success,
  }) {
    return activeCart(items, total, tax);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(List<dynamic> items, double total, double tax)?
        activeCart,
    TResult? Function(String qrData)? paymentRequest,
    TResult? Function(int pointsEarned)? success,
  }) {
    return activeCart?.call(items, total, tax);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(List<dynamic> items, double total, double tax)? activeCart,
    TResult Function(String qrData)? paymentRequest,
    TResult Function(int pointsEarned)? success,
    required TResult orElse(),
  }) {
    if (activeCart != null) {
      return activeCart(items, total, tax);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_ActiveCart value) activeCart,
    required TResult Function(_PaymentRequest value) paymentRequest,
    required TResult Function(_Success value) success,
  }) {
    return activeCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_ActiveCart value)? activeCart,
    TResult? Function(_PaymentRequest value)? paymentRequest,
    TResult? Function(_Success value)? success,
  }) {
    return activeCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_ActiveCart value)? activeCart,
    TResult Function(_PaymentRequest value)? paymentRequest,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (activeCart != null) {
      return activeCart(this);
    }
    return orElse();
  }
}

abstract class _ActiveCart implements CdsState {
  const factory _ActiveCart(
      {required final List<dynamic> items,
      required final double total,
      required final double tax}) = _$ActiveCartImpl;

  List<dynamic> get items; // Using dynamic for prototype
  double get total;
  double get tax;

  /// Create a copy of CdsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActiveCartImplCopyWith<_$ActiveCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PaymentRequestImplCopyWith<$Res> {
  factory _$$PaymentRequestImplCopyWith(_$PaymentRequestImpl value,
          $Res Function(_$PaymentRequestImpl) then) =
      __$$PaymentRequestImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String qrData});
}

/// @nodoc
class __$$PaymentRequestImplCopyWithImpl<$Res>
    extends _$CdsStateCopyWithImpl<$Res, _$PaymentRequestImpl>
    implements _$$PaymentRequestImplCopyWith<$Res> {
  __$$PaymentRequestImplCopyWithImpl(
      _$PaymentRequestImpl _value, $Res Function(_$PaymentRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CdsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrData = null,
  }) {
    return _then(_$PaymentRequestImpl(
      qrData: null == qrData
          ? _value.qrData
          : qrData // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PaymentRequestImpl implements _PaymentRequest {
  const _$PaymentRequestImpl({required this.qrData});

  @override
  final String qrData;

  @override
  String toString() {
    return 'CdsState.paymentRequest(qrData: $qrData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentRequestImpl &&
            (identical(other.qrData, qrData) || other.qrData == qrData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, qrData);

  /// Create a copy of CdsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentRequestImplCopyWith<_$PaymentRequestImpl> get copyWith =>
      __$$PaymentRequestImplCopyWithImpl<_$PaymentRequestImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(List<dynamic> items, double total, double tax)
        activeCart,
    required TResult Function(String qrData) paymentRequest,
    required TResult Function(int pointsEarned) success,
  }) {
    return paymentRequest(qrData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(List<dynamic> items, double total, double tax)?
        activeCart,
    TResult? Function(String qrData)? paymentRequest,
    TResult? Function(int pointsEarned)? success,
  }) {
    return paymentRequest?.call(qrData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(List<dynamic> items, double total, double tax)? activeCart,
    TResult Function(String qrData)? paymentRequest,
    TResult Function(int pointsEarned)? success,
    required TResult orElse(),
  }) {
    if (paymentRequest != null) {
      return paymentRequest(qrData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_ActiveCart value) activeCart,
    required TResult Function(_PaymentRequest value) paymentRequest,
    required TResult Function(_Success value) success,
  }) {
    return paymentRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_ActiveCart value)? activeCart,
    TResult? Function(_PaymentRequest value)? paymentRequest,
    TResult? Function(_Success value)? success,
  }) {
    return paymentRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_ActiveCart value)? activeCart,
    TResult Function(_PaymentRequest value)? paymentRequest,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (paymentRequest != null) {
      return paymentRequest(this);
    }
    return orElse();
  }
}

abstract class _PaymentRequest implements CdsState {
  const factory _PaymentRequest({required final String qrData}) =
      _$PaymentRequestImpl;

  String get qrData;

  /// Create a copy of CdsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentRequestImplCopyWith<_$PaymentRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int pointsEarned});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$CdsStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of CdsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pointsEarned = null,
  }) {
    return _then(_$SuccessImpl(
      pointsEarned: null == pointsEarned
          ? _value.pointsEarned
          : pointsEarned // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl({required this.pointsEarned});

  @override
  final int pointsEarned;

  @override
  String toString() {
    return 'CdsState.success(pointsEarned: $pointsEarned)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.pointsEarned, pointsEarned) ||
                other.pointsEarned == pointsEarned));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pointsEarned);

  /// Create a copy of CdsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(List<dynamic> items, double total, double tax)
        activeCart,
    required TResult Function(String qrData) paymentRequest,
    required TResult Function(int pointsEarned) success,
  }) {
    return success(pointsEarned);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(List<dynamic> items, double total, double tax)?
        activeCart,
    TResult? Function(String qrData)? paymentRequest,
    TResult? Function(int pointsEarned)? success,
  }) {
    return success?.call(pointsEarned);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(List<dynamic> items, double total, double tax)? activeCart,
    TResult Function(String qrData)? paymentRequest,
    TResult Function(int pointsEarned)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(pointsEarned);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_ActiveCart value) activeCart,
    required TResult Function(_PaymentRequest value) paymentRequest,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_ActiveCart value)? activeCart,
    TResult? Function(_PaymentRequest value)? paymentRequest,
    TResult? Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_ActiveCart value)? activeCart,
    TResult Function(_PaymentRequest value)? paymentRequest,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements CdsState {
  const factory _Success({required final int pointsEarned}) = _$SuccessImpl;

  int get pointsEarned;

  /// Create a copy of CdsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
