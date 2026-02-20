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
    required TResult Function(DateTime? date) loadData,
    required TResult Function() refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? date)? loadData,
    TResult? Function()? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? date)? loadData,
    TResult Function()? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadData value) loadData,
    required TResult Function(_Refresh value) refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadData value)? loadData,
    TResult? Function(_Refresh value)? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadData value)? loadData,
    TResult Function(_Refresh value)? refresh,
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
  @useResult
  $Res call({DateTime? date});
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
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
  }) {
    return _then(_$LoadDataImpl(
      freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$LoadDataImpl implements _LoadData {
  const _$LoadDataImpl([this.date]);

  @override
  final DateTime? date;

  @override
  String toString() {
    return 'DashboardEvent.loadData(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadDataImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadDataImplCopyWith<_$LoadDataImpl> get copyWith =>
      __$$LoadDataImplCopyWithImpl<_$LoadDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? date) loadData,
    required TResult Function() refresh,
  }) {
    return loadData(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? date)? loadData,
    TResult? Function()? refresh,
  }) {
    return loadData?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? date)? loadData,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (loadData != null) {
      return loadData(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadData value) loadData,
    required TResult Function(_Refresh value) refresh,
  }) {
    return loadData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadData value)? loadData,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return loadData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadData value)? loadData,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (loadData != null) {
      return loadData(this);
    }
    return orElse();
  }
}

abstract class _LoadData implements DashboardEvent {
  const factory _LoadData([final DateTime? date]) = _$LoadDataImpl;

  DateTime? get date;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadDataImplCopyWith<_$LoadDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshImplCopyWith<$Res> {
  factory _$$RefreshImplCopyWith(
          _$RefreshImpl value, $Res Function(_$RefreshImpl) then) =
      __$$RefreshImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$RefreshImpl>
    implements _$$RefreshImplCopyWith<$Res> {
  __$$RefreshImplCopyWithImpl(
      _$RefreshImpl _value, $Res Function(_$RefreshImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshImpl implements _Refresh {
  const _$RefreshImpl();

  @override
  String toString() {
    return 'DashboardEvent.refresh()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? date) loadData,
    required TResult Function() refresh,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? date)? loadData,
    TResult? Function()? refresh,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? date)? loadData,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadData value) loadData,
    required TResult Function(_Refresh value) refresh,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadData value)? loadData,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadData value)? loadData,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements DashboardEvent {
  const factory _Refresh() = _$RefreshImpl;
}

/// @nodoc
mixin _$DashboardState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            DashboardStats stats,
            List<HourlySalesData> hourlySales,
            List<TopProductData> topProducts,
            DateTime selectedDate,
            List<DailySalesData> last7DaysSales,
            int pendingSyncCount)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            DashboardStats stats,
            List<HourlySalesData> hourlySales,
            List<TopProductData> topProducts,
            DateTime selectedDate,
            List<DailySalesData> last7DaysSales,
            int pendingSyncCount)?
        loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            DashboardStats stats,
            List<HourlySalesData> hourlySales,
            List<TopProductData> topProducts,
            DateTime selectedDate,
            List<DailySalesData> last7DaysSales,
            int pendingSyncCount)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DashboardInitial value) initial,
    required TResult Function(DashboardLoading value) loading,
    required TResult Function(DashboardLoaded value) loaded,
    required TResult Function(DashboardError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DashboardInitial value)? initial,
    TResult? Function(DashboardLoading value)? loading,
    TResult? Function(DashboardLoaded value)? loaded,
    TResult? Function(DashboardError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardInitial value)? initial,
    TResult Function(DashboardLoading value)? loading,
    TResult Function(DashboardLoaded value)? loaded,
    TResult Function(DashboardError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res, DashboardState>;
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
}

/// @nodoc
abstract class _$$DashboardInitialImplCopyWith<$Res> {
  factory _$$DashboardInitialImplCopyWith(_$DashboardInitialImpl value,
          $Res Function(_$DashboardInitialImpl) then) =
      __$$DashboardInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DashboardInitialImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$DashboardInitialImpl>
    implements _$$DashboardInitialImplCopyWith<$Res> {
  __$$DashboardInitialImplCopyWithImpl(_$DashboardInitialImpl _value,
      $Res Function(_$DashboardInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DashboardInitialImpl implements DashboardInitial {
  const _$DashboardInitialImpl();

  @override
  String toString() {
    return 'DashboardState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DashboardInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            DashboardStats stats,
            List<HourlySalesData> hourlySales,
            List<TopProductData> topProducts,
            DateTime selectedDate,
            List<DailySalesData> last7DaysSales,
            int pendingSyncCount)
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
    TResult? Function(
            DashboardStats stats,
            List<HourlySalesData> hourlySales,
            List<TopProductData> topProducts,
            DateTime selectedDate,
            List<DailySalesData> last7DaysSales,
            int pendingSyncCount)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            DashboardStats stats,
            List<HourlySalesData> hourlySales,
            List<TopProductData> topProducts,
            DateTime selectedDate,
            List<DailySalesData> last7DaysSales,
            int pendingSyncCount)?
        loaded,
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
    required TResult Function(DashboardInitial value) initial,
    required TResult Function(DashboardLoading value) loading,
    required TResult Function(DashboardLoaded value) loaded,
    required TResult Function(DashboardError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DashboardInitial value)? initial,
    TResult? Function(DashboardLoading value)? loading,
    TResult? Function(DashboardLoaded value)? loaded,
    TResult? Function(DashboardError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardInitial value)? initial,
    TResult Function(DashboardLoading value)? loading,
    TResult Function(DashboardLoaded value)? loaded,
    TResult Function(DashboardError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class DashboardInitial implements DashboardState {
  const factory DashboardInitial() = _$DashboardInitialImpl;
}

/// @nodoc
abstract class _$$DashboardLoadingImplCopyWith<$Res> {
  factory _$$DashboardLoadingImplCopyWith(_$DashboardLoadingImpl value,
          $Res Function(_$DashboardLoadingImpl) then) =
      __$$DashboardLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DashboardLoadingImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$DashboardLoadingImpl>
    implements _$$DashboardLoadingImplCopyWith<$Res> {
  __$$DashboardLoadingImplCopyWithImpl(_$DashboardLoadingImpl _value,
      $Res Function(_$DashboardLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DashboardLoadingImpl implements DashboardLoading {
  const _$DashboardLoadingImpl();

  @override
  String toString() {
    return 'DashboardState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DashboardLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            DashboardStats stats,
            List<HourlySalesData> hourlySales,
            List<TopProductData> topProducts,
            DateTime selectedDate,
            List<DailySalesData> last7DaysSales,
            int pendingSyncCount)
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
    TResult? Function(
            DashboardStats stats,
            List<HourlySalesData> hourlySales,
            List<TopProductData> topProducts,
            DateTime selectedDate,
            List<DailySalesData> last7DaysSales,
            int pendingSyncCount)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            DashboardStats stats,
            List<HourlySalesData> hourlySales,
            List<TopProductData> topProducts,
            DateTime selectedDate,
            List<DailySalesData> last7DaysSales,
            int pendingSyncCount)?
        loaded,
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
    required TResult Function(DashboardInitial value) initial,
    required TResult Function(DashboardLoading value) loading,
    required TResult Function(DashboardLoaded value) loaded,
    required TResult Function(DashboardError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DashboardInitial value)? initial,
    TResult? Function(DashboardLoading value)? loading,
    TResult? Function(DashboardLoaded value)? loaded,
    TResult? Function(DashboardError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardInitial value)? initial,
    TResult Function(DashboardLoading value)? loading,
    TResult Function(DashboardLoaded value)? loaded,
    TResult Function(DashboardError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DashboardLoading implements DashboardState {
  const factory DashboardLoading() = _$DashboardLoadingImpl;
}

/// @nodoc
abstract class _$$DashboardLoadedImplCopyWith<$Res> {
  factory _$$DashboardLoadedImplCopyWith(_$DashboardLoadedImpl value,
          $Res Function(_$DashboardLoadedImpl) then) =
      __$$DashboardLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {DashboardStats stats,
      List<HourlySalesData> hourlySales,
      List<TopProductData> topProducts,
      DateTime selectedDate,
      List<DailySalesData> last7DaysSales,
      int pendingSyncCount});
}

/// @nodoc
class __$$DashboardLoadedImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$DashboardLoadedImpl>
    implements _$$DashboardLoadedImplCopyWith<$Res> {
  __$$DashboardLoadedImplCopyWithImpl(
      _$DashboardLoadedImpl _value, $Res Function(_$DashboardLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stats = null,
    Object? hourlySales = null,
    Object? topProducts = null,
    Object? selectedDate = null,
    Object? last7DaysSales = null,
    Object? pendingSyncCount = null,
  }) {
    return _then(_$DashboardLoadedImpl(
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as DashboardStats,
      hourlySales: null == hourlySales
          ? _value._hourlySales
          : hourlySales // ignore: cast_nullable_to_non_nullable
              as List<HourlySalesData>,
      topProducts: null == topProducts
          ? _value._topProducts
          : topProducts // ignore: cast_nullable_to_non_nullable
              as List<TopProductData>,
      selectedDate: null == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      last7DaysSales: null == last7DaysSales
          ? _value._last7DaysSales
          : last7DaysSales // ignore: cast_nullable_to_non_nullable
              as List<DailySalesData>,
      pendingSyncCount: null == pendingSyncCount
          ? _value.pendingSyncCount
          : pendingSyncCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DashboardLoadedImpl implements DashboardLoaded {
  const _$DashboardLoadedImpl(
      {required this.stats,
      required final List<HourlySalesData> hourlySales,
      required final List<TopProductData> topProducts,
      required this.selectedDate,
      required final List<DailySalesData> last7DaysSales,
      required this.pendingSyncCount})
      : _hourlySales = hourlySales,
        _topProducts = topProducts,
        _last7DaysSales = last7DaysSales;

  @override
  final DashboardStats stats;
  final List<HourlySalesData> _hourlySales;
  @override
  List<HourlySalesData> get hourlySales {
    if (_hourlySales is EqualUnmodifiableListView) return _hourlySales;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourlySales);
  }

  final List<TopProductData> _topProducts;
  @override
  List<TopProductData> get topProducts {
    if (_topProducts is EqualUnmodifiableListView) return _topProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topProducts);
  }

  @override
  final DateTime selectedDate;
  final List<DailySalesData> _last7DaysSales;
  @override
  List<DailySalesData> get last7DaysSales {
    if (_last7DaysSales is EqualUnmodifiableListView) return _last7DaysSales;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_last7DaysSales);
  }

  @override
  final int pendingSyncCount;

  @override
  String toString() {
    return 'DashboardState.loaded(stats: $stats, hourlySales: $hourlySales, topProducts: $topProducts, selectedDate: $selectedDate, last7DaysSales: $last7DaysSales, pendingSyncCount: $pendingSyncCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardLoadedImpl &&
            (identical(other.stats, stats) || other.stats == stats) &&
            const DeepCollectionEquality()
                .equals(other._hourlySales, _hourlySales) &&
            const DeepCollectionEquality()
                .equals(other._topProducts, _topProducts) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            const DeepCollectionEquality()
                .equals(other._last7DaysSales, _last7DaysSales) &&
            (identical(other.pendingSyncCount, pendingSyncCount) ||
                other.pendingSyncCount == pendingSyncCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      stats,
      const DeepCollectionEquality().hash(_hourlySales),
      const DeepCollectionEquality().hash(_topProducts),
      selectedDate,
      const DeepCollectionEquality().hash(_last7DaysSales),
      pendingSyncCount);

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardLoadedImplCopyWith<_$DashboardLoadedImpl> get copyWith =>
      __$$DashboardLoadedImplCopyWithImpl<_$DashboardLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            DashboardStats stats,
            List<HourlySalesData> hourlySales,
            List<TopProductData> topProducts,
            DateTime selectedDate,
            List<DailySalesData> last7DaysSales,
            int pendingSyncCount)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(stats, hourlySales, topProducts, selectedDate, last7DaysSales,
        pendingSyncCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            DashboardStats stats,
            List<HourlySalesData> hourlySales,
            List<TopProductData> topProducts,
            DateTime selectedDate,
            List<DailySalesData> last7DaysSales,
            int pendingSyncCount)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(stats, hourlySales, topProducts, selectedDate,
        last7DaysSales, pendingSyncCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            DashboardStats stats,
            List<HourlySalesData> hourlySales,
            List<TopProductData> topProducts,
            DateTime selectedDate,
            List<DailySalesData> last7DaysSales,
            int pendingSyncCount)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(stats, hourlySales, topProducts, selectedDate,
          last7DaysSales, pendingSyncCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DashboardInitial value) initial,
    required TResult Function(DashboardLoading value) loading,
    required TResult Function(DashboardLoaded value) loaded,
    required TResult Function(DashboardError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DashboardInitial value)? initial,
    TResult? Function(DashboardLoading value)? loading,
    TResult? Function(DashboardLoaded value)? loaded,
    TResult? Function(DashboardError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardInitial value)? initial,
    TResult Function(DashboardLoading value)? loading,
    TResult Function(DashboardLoaded value)? loaded,
    TResult Function(DashboardError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class DashboardLoaded implements DashboardState {
  const factory DashboardLoaded(
      {required final DashboardStats stats,
      required final List<HourlySalesData> hourlySales,
      required final List<TopProductData> topProducts,
      required final DateTime selectedDate,
      required final List<DailySalesData> last7DaysSales,
      required final int pendingSyncCount}) = _$DashboardLoadedImpl;

  DashboardStats get stats;
  List<HourlySalesData> get hourlySales;
  List<TopProductData> get topProducts;
  DateTime get selectedDate;
  List<DailySalesData> get last7DaysSales;
  int get pendingSyncCount;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardLoadedImplCopyWith<_$DashboardLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DashboardErrorImplCopyWith<$Res> {
  factory _$$DashboardErrorImplCopyWith(_$DashboardErrorImpl value,
          $Res Function(_$DashboardErrorImpl) then) =
      __$$DashboardErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$DashboardErrorImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$DashboardErrorImpl>
    implements _$$DashboardErrorImplCopyWith<$Res> {
  __$$DashboardErrorImplCopyWithImpl(
      _$DashboardErrorImpl _value, $Res Function(_$DashboardErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$DashboardErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DashboardErrorImpl implements DashboardError {
  const _$DashboardErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'DashboardState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardErrorImplCopyWith<_$DashboardErrorImpl> get copyWith =>
      __$$DashboardErrorImplCopyWithImpl<_$DashboardErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            DashboardStats stats,
            List<HourlySalesData> hourlySales,
            List<TopProductData> topProducts,
            DateTime selectedDate,
            List<DailySalesData> last7DaysSales,
            int pendingSyncCount)
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
    TResult? Function(
            DashboardStats stats,
            List<HourlySalesData> hourlySales,
            List<TopProductData> topProducts,
            DateTime selectedDate,
            List<DailySalesData> last7DaysSales,
            int pendingSyncCount)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            DashboardStats stats,
            List<HourlySalesData> hourlySales,
            List<TopProductData> topProducts,
            DateTime selectedDate,
            List<DailySalesData> last7DaysSales,
            int pendingSyncCount)?
        loaded,
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
    required TResult Function(DashboardInitial value) initial,
    required TResult Function(DashboardLoading value) loading,
    required TResult Function(DashboardLoaded value) loaded,
    required TResult Function(DashboardError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DashboardInitial value)? initial,
    TResult? Function(DashboardLoading value)? loading,
    TResult? Function(DashboardLoaded value)? loaded,
    TResult? Function(DashboardError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardInitial value)? initial,
    TResult Function(DashboardLoading value)? loading,
    TResult Function(DashboardLoaded value)? loaded,
    TResult Function(DashboardError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DashboardError implements DashboardState {
  const factory DashboardError(final String message) = _$DashboardErrorImpl;

  String get message;

  /// Create a copy of DashboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardErrorImplCopyWith<_$DashboardErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
