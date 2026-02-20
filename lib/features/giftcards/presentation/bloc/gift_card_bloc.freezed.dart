// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gift_card_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GiftCardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String query) searchCards,
    required TResult Function(String cardNumber, double amount,
            String? customerName, String? notes)
        issueCard,
    required TResult Function(String cardUuid, double amount) redeemCard,
    required TResult Function(String cardUuid) watchTransactions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String query)? searchCards,
    TResult? Function(String cardNumber, double amount, String? customerName,
            String? notes)?
        issueCard,
    TResult? Function(String cardUuid, double amount)? redeemCard,
    TResult? Function(String cardUuid)? watchTransactions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String query)? searchCards,
    TResult Function(String cardNumber, double amount, String? customerName,
            String? notes)?
        issueCard,
    TResult Function(String cardUuid, double amount)? redeemCard,
    TResult Function(String cardUuid)? watchTransactions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SearchCards value) searchCards,
    required TResult Function(_IssueCard value) issueCard,
    required TResult Function(_RedeemCard value) redeemCard,
    required TResult Function(_WatchTransactions value) watchTransactions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SearchCards value)? searchCards,
    TResult? Function(_IssueCard value)? issueCard,
    TResult? Function(_RedeemCard value)? redeemCard,
    TResult? Function(_WatchTransactions value)? watchTransactions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SearchCards value)? searchCards,
    TResult Function(_IssueCard value)? issueCard,
    TResult Function(_RedeemCard value)? redeemCard,
    TResult Function(_WatchTransactions value)? watchTransactions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiftCardEventCopyWith<$Res> {
  factory $GiftCardEventCopyWith(
          GiftCardEvent value, $Res Function(GiftCardEvent) then) =
      _$GiftCardEventCopyWithImpl<$Res, GiftCardEvent>;
}

/// @nodoc
class _$GiftCardEventCopyWithImpl<$Res, $Val extends GiftCardEvent>
    implements $GiftCardEventCopyWith<$Res> {
  _$GiftCardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GiftCardEvent
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
    extends _$GiftCardEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GiftCardEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'GiftCardEvent.started()';
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
    required TResult Function(String query) searchCards,
    required TResult Function(String cardNumber, double amount,
            String? customerName, String? notes)
        issueCard,
    required TResult Function(String cardUuid, double amount) redeemCard,
    required TResult Function(String cardUuid) watchTransactions,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String query)? searchCards,
    TResult? Function(String cardNumber, double amount, String? customerName,
            String? notes)?
        issueCard,
    TResult? Function(String cardUuid, double amount)? redeemCard,
    TResult? Function(String cardUuid)? watchTransactions,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String query)? searchCards,
    TResult Function(String cardNumber, double amount, String? customerName,
            String? notes)?
        issueCard,
    TResult Function(String cardUuid, double amount)? redeemCard,
    TResult Function(String cardUuid)? watchTransactions,
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
    required TResult Function(_SearchCards value) searchCards,
    required TResult Function(_IssueCard value) issueCard,
    required TResult Function(_RedeemCard value) redeemCard,
    required TResult Function(_WatchTransactions value) watchTransactions,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SearchCards value)? searchCards,
    TResult? Function(_IssueCard value)? issueCard,
    TResult? Function(_RedeemCard value)? redeemCard,
    TResult? Function(_WatchTransactions value)? watchTransactions,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SearchCards value)? searchCards,
    TResult Function(_IssueCard value)? issueCard,
    TResult Function(_RedeemCard value)? redeemCard,
    TResult Function(_WatchTransactions value)? watchTransactions,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements GiftCardEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$SearchCardsImplCopyWith<$Res> {
  factory _$$SearchCardsImplCopyWith(
          _$SearchCardsImpl value, $Res Function(_$SearchCardsImpl) then) =
      __$$SearchCardsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchCardsImplCopyWithImpl<$Res>
    extends _$GiftCardEventCopyWithImpl<$Res, _$SearchCardsImpl>
    implements _$$SearchCardsImplCopyWith<$Res> {
  __$$SearchCardsImplCopyWithImpl(
      _$SearchCardsImpl _value, $Res Function(_$SearchCardsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GiftCardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchCardsImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchCardsImpl implements _SearchCards {
  const _$SearchCardsImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'GiftCardEvent.searchCards(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchCardsImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of GiftCardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchCardsImplCopyWith<_$SearchCardsImpl> get copyWith =>
      __$$SearchCardsImplCopyWithImpl<_$SearchCardsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String query) searchCards,
    required TResult Function(String cardNumber, double amount,
            String? customerName, String? notes)
        issueCard,
    required TResult Function(String cardUuid, double amount) redeemCard,
    required TResult Function(String cardUuid) watchTransactions,
  }) {
    return searchCards(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String query)? searchCards,
    TResult? Function(String cardNumber, double amount, String? customerName,
            String? notes)?
        issueCard,
    TResult? Function(String cardUuid, double amount)? redeemCard,
    TResult? Function(String cardUuid)? watchTransactions,
  }) {
    return searchCards?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String query)? searchCards,
    TResult Function(String cardNumber, double amount, String? customerName,
            String? notes)?
        issueCard,
    TResult Function(String cardUuid, double amount)? redeemCard,
    TResult Function(String cardUuid)? watchTransactions,
    required TResult orElse(),
  }) {
    if (searchCards != null) {
      return searchCards(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SearchCards value) searchCards,
    required TResult Function(_IssueCard value) issueCard,
    required TResult Function(_RedeemCard value) redeemCard,
    required TResult Function(_WatchTransactions value) watchTransactions,
  }) {
    return searchCards(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SearchCards value)? searchCards,
    TResult? Function(_IssueCard value)? issueCard,
    TResult? Function(_RedeemCard value)? redeemCard,
    TResult? Function(_WatchTransactions value)? watchTransactions,
  }) {
    return searchCards?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SearchCards value)? searchCards,
    TResult Function(_IssueCard value)? issueCard,
    TResult Function(_RedeemCard value)? redeemCard,
    TResult Function(_WatchTransactions value)? watchTransactions,
    required TResult orElse(),
  }) {
    if (searchCards != null) {
      return searchCards(this);
    }
    return orElse();
  }
}

abstract class _SearchCards implements GiftCardEvent {
  const factory _SearchCards(final String query) = _$SearchCardsImpl;

  String get query;

  /// Create a copy of GiftCardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchCardsImplCopyWith<_$SearchCardsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IssueCardImplCopyWith<$Res> {
  factory _$$IssueCardImplCopyWith(
          _$IssueCardImpl value, $Res Function(_$IssueCardImpl) then) =
      __$$IssueCardImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String cardNumber, double amount, String? customerName, String? notes});
}

/// @nodoc
class __$$IssueCardImplCopyWithImpl<$Res>
    extends _$GiftCardEventCopyWithImpl<$Res, _$IssueCardImpl>
    implements _$$IssueCardImplCopyWith<$Res> {
  __$$IssueCardImplCopyWithImpl(
      _$IssueCardImpl _value, $Res Function(_$IssueCardImpl) _then)
      : super(_value, _then);

  /// Create a copy of GiftCardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardNumber = null,
    Object? amount = null,
    Object? customerName = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$IssueCardImpl(
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$IssueCardImpl implements _IssueCard {
  const _$IssueCardImpl(
      {required this.cardNumber,
      required this.amount,
      this.customerName,
      this.notes});

  @override
  final String cardNumber;
  @override
  final double amount;
  @override
  final String? customerName;
  @override
  final String? notes;

  @override
  String toString() {
    return 'GiftCardEvent.issueCard(cardNumber: $cardNumber, amount: $amount, customerName: $customerName, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IssueCardImpl &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, cardNumber, amount, customerName, notes);

  /// Create a copy of GiftCardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IssueCardImplCopyWith<_$IssueCardImpl> get copyWith =>
      __$$IssueCardImplCopyWithImpl<_$IssueCardImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String query) searchCards,
    required TResult Function(String cardNumber, double amount,
            String? customerName, String? notes)
        issueCard,
    required TResult Function(String cardUuid, double amount) redeemCard,
    required TResult Function(String cardUuid) watchTransactions,
  }) {
    return issueCard(cardNumber, amount, customerName, notes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String query)? searchCards,
    TResult? Function(String cardNumber, double amount, String? customerName,
            String? notes)?
        issueCard,
    TResult? Function(String cardUuid, double amount)? redeemCard,
    TResult? Function(String cardUuid)? watchTransactions,
  }) {
    return issueCard?.call(cardNumber, amount, customerName, notes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String query)? searchCards,
    TResult Function(String cardNumber, double amount, String? customerName,
            String? notes)?
        issueCard,
    TResult Function(String cardUuid, double amount)? redeemCard,
    TResult Function(String cardUuid)? watchTransactions,
    required TResult orElse(),
  }) {
    if (issueCard != null) {
      return issueCard(cardNumber, amount, customerName, notes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SearchCards value) searchCards,
    required TResult Function(_IssueCard value) issueCard,
    required TResult Function(_RedeemCard value) redeemCard,
    required TResult Function(_WatchTransactions value) watchTransactions,
  }) {
    return issueCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SearchCards value)? searchCards,
    TResult? Function(_IssueCard value)? issueCard,
    TResult? Function(_RedeemCard value)? redeemCard,
    TResult? Function(_WatchTransactions value)? watchTransactions,
  }) {
    return issueCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SearchCards value)? searchCards,
    TResult Function(_IssueCard value)? issueCard,
    TResult Function(_RedeemCard value)? redeemCard,
    TResult Function(_WatchTransactions value)? watchTransactions,
    required TResult orElse(),
  }) {
    if (issueCard != null) {
      return issueCard(this);
    }
    return orElse();
  }
}

abstract class _IssueCard implements GiftCardEvent {
  const factory _IssueCard(
      {required final String cardNumber,
      required final double amount,
      final String? customerName,
      final String? notes}) = _$IssueCardImpl;

  String get cardNumber;
  double get amount;
  String? get customerName;
  String? get notes;

  /// Create a copy of GiftCardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IssueCardImplCopyWith<_$IssueCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RedeemCardImplCopyWith<$Res> {
  factory _$$RedeemCardImplCopyWith(
          _$RedeemCardImpl value, $Res Function(_$RedeemCardImpl) then) =
      __$$RedeemCardImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cardUuid, double amount});
}

/// @nodoc
class __$$RedeemCardImplCopyWithImpl<$Res>
    extends _$GiftCardEventCopyWithImpl<$Res, _$RedeemCardImpl>
    implements _$$RedeemCardImplCopyWith<$Res> {
  __$$RedeemCardImplCopyWithImpl(
      _$RedeemCardImpl _value, $Res Function(_$RedeemCardImpl) _then)
      : super(_value, _then);

  /// Create a copy of GiftCardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardUuid = null,
    Object? amount = null,
  }) {
    return _then(_$RedeemCardImpl(
      cardUuid: null == cardUuid
          ? _value.cardUuid
          : cardUuid // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$RedeemCardImpl implements _RedeemCard {
  const _$RedeemCardImpl({required this.cardUuid, required this.amount});

  @override
  final String cardUuid;
  @override
  final double amount;

  @override
  String toString() {
    return 'GiftCardEvent.redeemCard(cardUuid: $cardUuid, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RedeemCardImpl &&
            (identical(other.cardUuid, cardUuid) ||
                other.cardUuid == cardUuid) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cardUuid, amount);

  /// Create a copy of GiftCardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RedeemCardImplCopyWith<_$RedeemCardImpl> get copyWith =>
      __$$RedeemCardImplCopyWithImpl<_$RedeemCardImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String query) searchCards,
    required TResult Function(String cardNumber, double amount,
            String? customerName, String? notes)
        issueCard,
    required TResult Function(String cardUuid, double amount) redeemCard,
    required TResult Function(String cardUuid) watchTransactions,
  }) {
    return redeemCard(cardUuid, amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String query)? searchCards,
    TResult? Function(String cardNumber, double amount, String? customerName,
            String? notes)?
        issueCard,
    TResult? Function(String cardUuid, double amount)? redeemCard,
    TResult? Function(String cardUuid)? watchTransactions,
  }) {
    return redeemCard?.call(cardUuid, amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String query)? searchCards,
    TResult Function(String cardNumber, double amount, String? customerName,
            String? notes)?
        issueCard,
    TResult Function(String cardUuid, double amount)? redeemCard,
    TResult Function(String cardUuid)? watchTransactions,
    required TResult orElse(),
  }) {
    if (redeemCard != null) {
      return redeemCard(cardUuid, amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SearchCards value) searchCards,
    required TResult Function(_IssueCard value) issueCard,
    required TResult Function(_RedeemCard value) redeemCard,
    required TResult Function(_WatchTransactions value) watchTransactions,
  }) {
    return redeemCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SearchCards value)? searchCards,
    TResult? Function(_IssueCard value)? issueCard,
    TResult? Function(_RedeemCard value)? redeemCard,
    TResult? Function(_WatchTransactions value)? watchTransactions,
  }) {
    return redeemCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SearchCards value)? searchCards,
    TResult Function(_IssueCard value)? issueCard,
    TResult Function(_RedeemCard value)? redeemCard,
    TResult Function(_WatchTransactions value)? watchTransactions,
    required TResult orElse(),
  }) {
    if (redeemCard != null) {
      return redeemCard(this);
    }
    return orElse();
  }
}

abstract class _RedeemCard implements GiftCardEvent {
  const factory _RedeemCard(
      {required final String cardUuid,
      required final double amount}) = _$RedeemCardImpl;

  String get cardUuid;
  double get amount;

  /// Create a copy of GiftCardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RedeemCardImplCopyWith<_$RedeemCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WatchTransactionsImplCopyWith<$Res> {
  factory _$$WatchTransactionsImplCopyWith(_$WatchTransactionsImpl value,
          $Res Function(_$WatchTransactionsImpl) then) =
      __$$WatchTransactionsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cardUuid});
}

/// @nodoc
class __$$WatchTransactionsImplCopyWithImpl<$Res>
    extends _$GiftCardEventCopyWithImpl<$Res, _$WatchTransactionsImpl>
    implements _$$WatchTransactionsImplCopyWith<$Res> {
  __$$WatchTransactionsImplCopyWithImpl(_$WatchTransactionsImpl _value,
      $Res Function(_$WatchTransactionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GiftCardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardUuid = null,
  }) {
    return _then(_$WatchTransactionsImpl(
      null == cardUuid
          ? _value.cardUuid
          : cardUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WatchTransactionsImpl implements _WatchTransactions {
  const _$WatchTransactionsImpl(this.cardUuid);

  @override
  final String cardUuid;

  @override
  String toString() {
    return 'GiftCardEvent.watchTransactions(cardUuid: $cardUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchTransactionsImpl &&
            (identical(other.cardUuid, cardUuid) ||
                other.cardUuid == cardUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cardUuid);

  /// Create a copy of GiftCardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchTransactionsImplCopyWith<_$WatchTransactionsImpl> get copyWith =>
      __$$WatchTransactionsImplCopyWithImpl<_$WatchTransactionsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String query) searchCards,
    required TResult Function(String cardNumber, double amount,
            String? customerName, String? notes)
        issueCard,
    required TResult Function(String cardUuid, double amount) redeemCard,
    required TResult Function(String cardUuid) watchTransactions,
  }) {
    return watchTransactions(cardUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String query)? searchCards,
    TResult? Function(String cardNumber, double amount, String? customerName,
            String? notes)?
        issueCard,
    TResult? Function(String cardUuid, double amount)? redeemCard,
    TResult? Function(String cardUuid)? watchTransactions,
  }) {
    return watchTransactions?.call(cardUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String query)? searchCards,
    TResult Function(String cardNumber, double amount, String? customerName,
            String? notes)?
        issueCard,
    TResult Function(String cardUuid, double amount)? redeemCard,
    TResult Function(String cardUuid)? watchTransactions,
    required TResult orElse(),
  }) {
    if (watchTransactions != null) {
      return watchTransactions(cardUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SearchCards value) searchCards,
    required TResult Function(_IssueCard value) issueCard,
    required TResult Function(_RedeemCard value) redeemCard,
    required TResult Function(_WatchTransactions value) watchTransactions,
  }) {
    return watchTransactions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SearchCards value)? searchCards,
    TResult? Function(_IssueCard value)? issueCard,
    TResult? Function(_RedeemCard value)? redeemCard,
    TResult? Function(_WatchTransactions value)? watchTransactions,
  }) {
    return watchTransactions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SearchCards value)? searchCards,
    TResult Function(_IssueCard value)? issueCard,
    TResult Function(_RedeemCard value)? redeemCard,
    TResult Function(_WatchTransactions value)? watchTransactions,
    required TResult orElse(),
  }) {
    if (watchTransactions != null) {
      return watchTransactions(this);
    }
    return orElse();
  }
}

abstract class _WatchTransactions implements GiftCardEvent {
  const factory _WatchTransactions(final String cardUuid) =
      _$WatchTransactionsImpl;

  String get cardUuid;

  /// Create a copy of GiftCardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WatchTransactionsImplCopyWith<_$WatchTransactionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GiftCardState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<GiftCard> cards, GiftCardSummary summary)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<GiftCard> cards, GiftCardSummary summary)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GiftCard> cards, GiftCardSummary summary)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiftCardStateCopyWith<$Res> {
  factory $GiftCardStateCopyWith(
          GiftCardState value, $Res Function(GiftCardState) then) =
      _$GiftCardStateCopyWithImpl<$Res, GiftCardState>;
}

/// @nodoc
class _$GiftCardStateCopyWithImpl<$Res, $Val extends GiftCardState>
    implements $GiftCardStateCopyWith<$Res> {
  _$GiftCardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GiftCardState
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
    extends _$GiftCardStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of GiftCardState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'GiftCardState.initial()';
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
    required TResult Function(List<GiftCard> cards, GiftCardSummary summary)
        loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<GiftCard> cards, GiftCardSummary summary)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GiftCard> cards, GiftCardSummary summary)? loaded,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GiftCardState {
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
    extends _$GiftCardStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of GiftCardState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'GiftCardState.loading()';
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
    required TResult Function(List<GiftCard> cards, GiftCardSummary summary)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<GiftCard> cards, GiftCardSummary summary)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GiftCard> cards, GiftCardSummary summary)? loaded,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements GiftCardState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<GiftCard> cards, GiftCardSummary summary});

  $GiftCardSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$GiftCardStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GiftCardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
    Object? summary = null,
  }) {
    return _then(_$LoadedImpl(
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<GiftCard>,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as GiftCardSummary,
    ));
  }

  /// Create a copy of GiftCardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GiftCardSummaryCopyWith<$Res> get summary {
    return $GiftCardSummaryCopyWith<$Res>(_value.summary, (value) {
      return _then(_value.copyWith(summary: value));
    });
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
      {required final List<GiftCard> cards, required this.summary})
      : _cards = cards;

  final List<GiftCard> _cards;
  @override
  List<GiftCard> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  final GiftCardSummary summary;

  @override
  String toString() {
    return 'GiftCardState.loaded(cards: $cards, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_cards), summary);

  /// Create a copy of GiftCardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<GiftCard> cards, GiftCardSummary summary)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(cards, summary);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<GiftCard> cards, GiftCardSummary summary)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(cards, summary);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GiftCard> cards, GiftCardSummary summary)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(cards, summary);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements GiftCardState {
  const factory _Loaded(
      {required final List<GiftCard> cards,
      required final GiftCardSummary summary}) = _$LoadedImpl;

  List<GiftCard> get cards;
  GiftCardSummary get summary;

  /// Create a copy of GiftCardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$GiftCardStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of GiftCardState
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
    return 'GiftCardState.error(message: $message)';
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

  /// Create a copy of GiftCardState
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
    required TResult Function(List<GiftCard> cards, GiftCardSummary summary)
        loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<GiftCard> cards, GiftCardSummary summary)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<GiftCard> cards, GiftCardSummary summary)? loaded,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements GiftCardState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of GiftCardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
