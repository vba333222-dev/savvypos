// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DashboardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadData value) loadData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadData value)? loadData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadData value)? loadData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardEventCopyWith<$Res> {
  factory $DashboardEventCopyWith(
          DashboardEvent value, $Res Function(DashboardEvent) then) =
      _$DashboardEventCopyWithImpl<$Res, DashboardEvent>;
}

/// @nodoc
class _$DashboardEventCopyWithImpl<$Res, $Val extends DashboardEvent>
    implements $DashboardEventCopyWith<$Res> {
  _$DashboardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadDataImplCopyWith<$Res> {
  factory _$$LoadDataImplCopyWith(
          _$LoadDataImpl value, $Res Function(_$LoadDataImpl) then) =
      __$$LoadDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadDataImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$LoadDataImpl>
    implements _$$LoadDataImplCopyWith<$Res> {
  __$$LoadDataImplCopyWithImpl(
      _$LoadDataImpl _value, $Res Function(_$LoadDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadDataImpl implements _LoadData {
  const _$LoadDataImpl();

  @override
  String toString() {
    return 'DashboardEvent.loadData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
  }) {
    return loadData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
  }) {
    return loadData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    required TResult orElse(),
  }) {
    if (loadData != null) {
      return loadData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadData value) loadData,
  }) {
    return loadData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadData value)? loadData,
  }) {
    return loadData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadData value)? loadData,
    required TResult orElse(),
  }) {
    if (loadData != null) {
      return loadData(this);
    }
    return orElse();
  }
}

abstract class _LoadData implements DashboardEvent {
  const factory _LoadData() = _$LoadDataImpl;
}

/// @nodoc
mixin _$DashboardState {
  List<DailySalesData> get recentSales => throw _privateConstructorUsedError;
  List<TopSellingItem> get topProducts => throw _privateConstructorUsedError;
  double get todaySales => throw _privateConstructorUsedError;
  int get pendingSyncCount => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardStateCopyWith<DashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res, DashboardState>;
  @useResult
  $Res call(
      {List<DailySalesData> recentSales,
      List<TopSellingItem> topProducts,
      double todaySales,
      int pendingSyncCount,
      bool isLoading,
      String? error});
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res, $Val extends DashboardState>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recentSales = null,
    Object? topProducts = null,
    Object? todaySales = null,
    Object? pendingSyncCount = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      recentSales: null == recentSales
          ? _value.recentSales
          : recentSales // ignore: cast_nullable_to_non_nullable
              as List<DailySalesData>,
      topProducts: null == topProducts
          ? _value.topProducts
          : topProducts // ignore: cast_nullable_to_non_nullable
              as List<TopSellingItem>,
      todaySales: null == todaySales
          ? _value.todaySales
          : todaySales // ignore: cast_nullable_to_non_nullable
              as double,
      pendingSyncCount: null == pendingSyncCount
          ? _value.pendingSyncCount
          : pendingSyncCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardStateImplCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$$DashboardStateImplCopyWith(_$DashboardStateImpl value,
          $Res Function(_$DashboardStateImpl) then) =
      __$$DashboardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DailySalesData> recentSales,
      List<TopSellingItem> topProducts,
      double todaySales,
      int pendingSyncCount,
      bool isLoading,
      String? error});
}

/// @nodoc
class __$$DashboardStateImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$DashboardStateImpl>
    implements _$$DashboardStateImplCopyWith<$Res> {
  __$$DashboardStateImplCopyWithImpl(
      _$DashboardStateImpl _value, $Res Function(_$DashboardStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recentSales = null,
    Object? topProducts = null,
    Object? todaySales = null,
    Object? pendingSyncCount = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$DashboardStateImpl(
      recentSales: null == recentSales
          ? _value._recentSales
          : recentSales // ignore: cast_nullable_to_non_nullable
              as List<DailySalesData>,
      topProducts: null == topProducts
          ? _value._topProducts
          : topProducts // ignore: cast_nullable_to_non_nullable
              as List<TopSellingItem>,
      todaySales: null == todaySales
          ? _value.todaySales
          : todaySales // ignore: cast_nullable_to_non_nullable
              as double,
      pendingSyncCount: null == pendingSyncCount
          ? _value.pendingSyncCount
          : pendingSyncCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DashboardStateImpl implements _DashboardState {
  const _$DashboardStateImpl(
      {final List<DailySalesData> recentSales = const [],
      final List<TopSellingItem> topProducts = const [],
      this.todaySales = 0.0,
      this.pendingSyncCount = 0,
      this.isLoading = true,
      this.error})
      : _recentSales = recentSales,
        _topProducts = topProducts;

  final List<DailySalesData> _recentSales;
  @override
  @JsonKey()
  List<DailySalesData> get recentSales {
    if (_recentSales is EqualUnmodifiableListView) return _recentSales;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentSales);
  }

  final List<TopSellingItem> _topProducts;
  @override
  @JsonKey()
  List<TopSellingItem> get topProducts {
    if (_topProducts is EqualUnmodifiableListView) return _topProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topProducts);
  }

  @override
  @JsonKey()
  final double todaySales;
  @override
  @JsonKey()
  final int pendingSyncCount;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'DashboardState(recentSales: $recentSales, topProducts: $topProducts, todaySales: $todaySales, pendingSyncCount: $pendingSyncCount, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardStateImpl &&
            const DeepCollectionEquality()
                .equals(other._recentSales, _recentSales) &&
            const DeepCollectionEquality()
                .equals(other._topProducts, _topProducts) &&
            (identical(other.todaySales, todaySales) ||
                other.todaySales == todaySales) &&
            (identical(other.pendingSyncCount, pendingSyncCount) ||
                other.pendingSyncCount == pendingSyncCount) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_recentSales),
      const DeepCollectionEquality().hash(_topProducts),
      todaySales,
      pendingSyncCount,
      isLoading,
      error);

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardStateImplCopyWith<_$DashboardStateImpl> get copyWith =>
      __$$DashboardStateImplCopyWithImpl<_$DashboardStateImpl>(
          this, _$identity);
}

abstract class _DashboardState implements DashboardState {
  const factory _DashboardState(
      {final List<DailySalesData> recentSales,
      final List<TopSellingItem> topProducts,
      final double todaySales,
      final int pendingSyncCount,
      final bool isLoading,
      final String? error}) = _$DashboardStateImpl;

  @override
  List<DailySalesData> get recentSales;
  @override
  List<TopSellingItem> get topProducts;
  @override
  double get todaySales;
  @override
  int get pendingSyncCount;
  @override
  bool get isLoading;
  @override
  String? get error;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardStateImplCopyWith<_$DashboardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
