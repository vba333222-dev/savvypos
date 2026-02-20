// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReportEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime start, DateTime end) loadSalesReport,
    required TResult Function(String productUuid) loadStockLedger,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime start, DateTime end)? loadSalesReport,
    TResult? Function(String productUuid)? loadStockLedger,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime start, DateTime end)? loadSalesReport,
    TResult Function(String productUuid)? loadStockLedger,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadSalesReport value) loadSalesReport,
    required TResult Function(_LoadStockLedger value) loadStockLedger,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadSalesReport value)? loadSalesReport,
    TResult? Function(_LoadStockLedger value)? loadStockLedger,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadSalesReport value)? loadSalesReport,
    TResult Function(_LoadStockLedger value)? loadStockLedger,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportEventCopyWith<$Res> {
  factory $ReportEventCopyWith(
          ReportEvent value, $Res Function(ReportEvent) then) =
      _$ReportEventCopyWithImpl<$Res, ReportEvent>;
}

/// @nodoc
class _$ReportEventCopyWithImpl<$Res, $Val extends ReportEvent>
    implements $ReportEventCopyWith<$Res> {
  _$ReportEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadSalesReportImplCopyWith<$Res> {
  factory _$$LoadSalesReportImplCopyWith(_$LoadSalesReportImpl value,
          $Res Function(_$LoadSalesReportImpl) then) =
      __$$LoadSalesReportImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime start, DateTime end});
}

/// @nodoc
class __$$LoadSalesReportImplCopyWithImpl<$Res>
    extends _$ReportEventCopyWithImpl<$Res, _$LoadSalesReportImpl>
    implements _$$LoadSalesReportImplCopyWith<$Res> {
  __$$LoadSalesReportImplCopyWithImpl(
      _$LoadSalesReportImpl _value, $Res Function(_$LoadSalesReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_$LoadSalesReportImpl(
      null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$LoadSalesReportImpl implements _LoadSalesReport {
  const _$LoadSalesReportImpl(this.start, this.end);

  @override
  final DateTime start;
  @override
  final DateTime end;

  @override
  String toString() {
    return 'ReportEvent.loadSalesReport(start: $start, end: $end)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSalesReportImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  /// Create a copy of ReportEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSalesReportImplCopyWith<_$LoadSalesReportImpl> get copyWith =>
      __$$LoadSalesReportImplCopyWithImpl<_$LoadSalesReportImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime start, DateTime end) loadSalesReport,
    required TResult Function(String productUuid) loadStockLedger,
  }) {
    return loadSalesReport(start, end);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime start, DateTime end)? loadSalesReport,
    TResult? Function(String productUuid)? loadStockLedger,
  }) {
    return loadSalesReport?.call(start, end);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime start, DateTime end)? loadSalesReport,
    TResult Function(String productUuid)? loadStockLedger,
    required TResult orElse(),
  }) {
    if (loadSalesReport != null) {
      return loadSalesReport(start, end);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadSalesReport value) loadSalesReport,
    required TResult Function(_LoadStockLedger value) loadStockLedger,
  }) {
    return loadSalesReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadSalesReport value)? loadSalesReport,
    TResult? Function(_LoadStockLedger value)? loadStockLedger,
  }) {
    return loadSalesReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadSalesReport value)? loadSalesReport,
    TResult Function(_LoadStockLedger value)? loadStockLedger,
    required TResult orElse(),
  }) {
    if (loadSalesReport != null) {
      return loadSalesReport(this);
    }
    return orElse();
  }
}

abstract class _LoadSalesReport implements ReportEvent {
  const factory _LoadSalesReport(final DateTime start, final DateTime end) =
      _$LoadSalesReportImpl;

  DateTime get start;
  DateTime get end;

  /// Create a copy of ReportEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadSalesReportImplCopyWith<_$LoadSalesReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadStockLedgerImplCopyWith<$Res> {
  factory _$$LoadStockLedgerImplCopyWith(_$LoadStockLedgerImpl value,
          $Res Function(_$LoadStockLedgerImpl) then) =
      __$$LoadStockLedgerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String productUuid});
}

/// @nodoc
class __$$LoadStockLedgerImplCopyWithImpl<$Res>
    extends _$ReportEventCopyWithImpl<$Res, _$LoadStockLedgerImpl>
    implements _$$LoadStockLedgerImplCopyWith<$Res> {
  __$$LoadStockLedgerImplCopyWithImpl(
      _$LoadStockLedgerImpl _value, $Res Function(_$LoadStockLedgerImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productUuid = null,
  }) {
    return _then(_$LoadStockLedgerImpl(
      null == productUuid
          ? _value.productUuid
          : productUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadStockLedgerImpl implements _LoadStockLedger {
  const _$LoadStockLedgerImpl(this.productUuid);

  @override
  final String productUuid;

  @override
  String toString() {
    return 'ReportEvent.loadStockLedger(productUuid: $productUuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadStockLedgerImpl &&
            (identical(other.productUuid, productUuid) ||
                other.productUuid == productUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productUuid);

  /// Create a copy of ReportEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadStockLedgerImplCopyWith<_$LoadStockLedgerImpl> get copyWith =>
      __$$LoadStockLedgerImplCopyWithImpl<_$LoadStockLedgerImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime start, DateTime end) loadSalesReport,
    required TResult Function(String productUuid) loadStockLedger,
  }) {
    return loadStockLedger(productUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime start, DateTime end)? loadSalesReport,
    TResult? Function(String productUuid)? loadStockLedger,
  }) {
    return loadStockLedger?.call(productUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime start, DateTime end)? loadSalesReport,
    TResult Function(String productUuid)? loadStockLedger,
    required TResult orElse(),
  }) {
    if (loadStockLedger != null) {
      return loadStockLedger(productUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadSalesReport value) loadSalesReport,
    required TResult Function(_LoadStockLedger value) loadStockLedger,
  }) {
    return loadStockLedger(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadSalesReport value)? loadSalesReport,
    TResult? Function(_LoadStockLedger value)? loadStockLedger,
  }) {
    return loadStockLedger?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadSalesReport value)? loadSalesReport,
    TResult Function(_LoadStockLedger value)? loadStockLedger,
    required TResult orElse(),
  }) {
    if (loadStockLedger != null) {
      return loadStockLedger(this);
    }
    return orElse();
  }
}

abstract class _LoadStockLedger implements ReportEvent {
  const factory _LoadStockLedger(final String productUuid) =
      _$LoadStockLedgerImpl;

  String get productUuid;

  /// Create a copy of ReportEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadStockLedgerImplCopyWith<_$LoadStockLedgerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReportState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SalesReportItem> report) salesLoaded,
    required TResult Function(List<StockLedgerItem> ledger) stockLoaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SalesReportItem> report)? salesLoaded,
    TResult? Function(List<StockLedgerItem> ledger)? stockLoaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SalesReportItem> report)? salesLoaded,
    TResult Function(List<StockLedgerItem> ledger)? stockLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SalesLoaded value) salesLoaded,
    required TResult Function(_StockLoaded value) stockLoaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SalesLoaded value)? salesLoaded,
    TResult? Function(_StockLoaded value)? stockLoaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SalesLoaded value)? salesLoaded,
    TResult Function(_StockLoaded value)? stockLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportStateCopyWith<$Res> {
  factory $ReportStateCopyWith(
          ReportState value, $Res Function(ReportState) then) =
      _$ReportStateCopyWithImpl<$Res, ReportState>;
}

/// @nodoc
class _$ReportStateCopyWithImpl<$Res, $Val extends ReportState>
    implements $ReportStateCopyWith<$Res> {
  _$ReportStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportState
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
    extends _$ReportStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ReportState.initial()';
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
    required TResult Function(List<SalesReportItem> report) salesLoaded,
    required TResult Function(List<StockLedgerItem> ledger) stockLoaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SalesReportItem> report)? salesLoaded,
    TResult? Function(List<StockLedgerItem> ledger)? stockLoaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SalesReportItem> report)? salesLoaded,
    TResult Function(List<StockLedgerItem> ledger)? stockLoaded,
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
    required TResult Function(_SalesLoaded value) salesLoaded,
    required TResult Function(_StockLoaded value) stockLoaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SalesLoaded value)? salesLoaded,
    TResult? Function(_StockLoaded value)? stockLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SalesLoaded value)? salesLoaded,
    TResult Function(_StockLoaded value)? stockLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ReportState {
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
    extends _$ReportStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ReportState.loading()';
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
    required TResult Function(List<SalesReportItem> report) salesLoaded,
    required TResult Function(List<StockLedgerItem> ledger) stockLoaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SalesReportItem> report)? salesLoaded,
    TResult? Function(List<StockLedgerItem> ledger)? stockLoaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SalesReportItem> report)? salesLoaded,
    TResult Function(List<StockLedgerItem> ledger)? stockLoaded,
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
    required TResult Function(_SalesLoaded value) salesLoaded,
    required TResult Function(_StockLoaded value) stockLoaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SalesLoaded value)? salesLoaded,
    TResult? Function(_StockLoaded value)? stockLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SalesLoaded value)? salesLoaded,
    TResult Function(_StockLoaded value)? stockLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ReportState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SalesLoadedImplCopyWith<$Res> {
  factory _$$SalesLoadedImplCopyWith(
          _$SalesLoadedImpl value, $Res Function(_$SalesLoadedImpl) then) =
      __$$SalesLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SalesReportItem> report});
}

/// @nodoc
class __$$SalesLoadedImplCopyWithImpl<$Res>
    extends _$ReportStateCopyWithImpl<$Res, _$SalesLoadedImpl>
    implements _$$SalesLoadedImplCopyWith<$Res> {
  __$$SalesLoadedImplCopyWithImpl(
      _$SalesLoadedImpl _value, $Res Function(_$SalesLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? report = null,
  }) {
    return _then(_$SalesLoadedImpl(
      null == report
          ? _value._report
          : report // ignore: cast_nullable_to_non_nullable
              as List<SalesReportItem>,
    ));
  }
}

/// @nodoc

class _$SalesLoadedImpl implements _SalesLoaded {
  const _$SalesLoadedImpl(final List<SalesReportItem> report)
      : _report = report;

  final List<SalesReportItem> _report;
  @override
  List<SalesReportItem> get report {
    if (_report is EqualUnmodifiableListView) return _report;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_report);
  }

  @override
  String toString() {
    return 'ReportState.salesLoaded(report: $report)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesLoadedImpl &&
            const DeepCollectionEquality().equals(other._report, _report));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_report));

  /// Create a copy of ReportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesLoadedImplCopyWith<_$SalesLoadedImpl> get copyWith =>
      __$$SalesLoadedImplCopyWithImpl<_$SalesLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SalesReportItem> report) salesLoaded,
    required TResult Function(List<StockLedgerItem> ledger) stockLoaded,
    required TResult Function(String message) error,
  }) {
    return salesLoaded(report);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SalesReportItem> report)? salesLoaded,
    TResult? Function(List<StockLedgerItem> ledger)? stockLoaded,
    TResult? Function(String message)? error,
  }) {
    return salesLoaded?.call(report);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SalesReportItem> report)? salesLoaded,
    TResult Function(List<StockLedgerItem> ledger)? stockLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (salesLoaded != null) {
      return salesLoaded(report);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SalesLoaded value) salesLoaded,
    required TResult Function(_StockLoaded value) stockLoaded,
    required TResult Function(_Error value) error,
  }) {
    return salesLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SalesLoaded value)? salesLoaded,
    TResult? Function(_StockLoaded value)? stockLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return salesLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SalesLoaded value)? salesLoaded,
    TResult Function(_StockLoaded value)? stockLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (salesLoaded != null) {
      return salesLoaded(this);
    }
    return orElse();
  }
}

abstract class _SalesLoaded implements ReportState {
  const factory _SalesLoaded(final List<SalesReportItem> report) =
      _$SalesLoadedImpl;

  List<SalesReportItem> get report;

  /// Create a copy of ReportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesLoadedImplCopyWith<_$SalesLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StockLoadedImplCopyWith<$Res> {
  factory _$$StockLoadedImplCopyWith(
          _$StockLoadedImpl value, $Res Function(_$StockLoadedImpl) then) =
      __$$StockLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<StockLedgerItem> ledger});
}

/// @nodoc
class __$$StockLoadedImplCopyWithImpl<$Res>
    extends _$ReportStateCopyWithImpl<$Res, _$StockLoadedImpl>
    implements _$$StockLoadedImplCopyWith<$Res> {
  __$$StockLoadedImplCopyWithImpl(
      _$StockLoadedImpl _value, $Res Function(_$StockLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ledger = null,
  }) {
    return _then(_$StockLoadedImpl(
      null == ledger
          ? _value._ledger
          : ledger // ignore: cast_nullable_to_non_nullable
              as List<StockLedgerItem>,
    ));
  }
}

/// @nodoc

class _$StockLoadedImpl implements _StockLoaded {
  const _$StockLoadedImpl(final List<StockLedgerItem> ledger)
      : _ledger = ledger;

  final List<StockLedgerItem> _ledger;
  @override
  List<StockLedgerItem> get ledger {
    if (_ledger is EqualUnmodifiableListView) return _ledger;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ledger);
  }

  @override
  String toString() {
    return 'ReportState.stockLoaded(ledger: $ledger)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockLoadedImpl &&
            const DeepCollectionEquality().equals(other._ledger, _ledger));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_ledger));

  /// Create a copy of ReportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockLoadedImplCopyWith<_$StockLoadedImpl> get copyWith =>
      __$$StockLoadedImplCopyWithImpl<_$StockLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SalesReportItem> report) salesLoaded,
    required TResult Function(List<StockLedgerItem> ledger) stockLoaded,
    required TResult Function(String message) error,
  }) {
    return stockLoaded(ledger);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SalesReportItem> report)? salesLoaded,
    TResult? Function(List<StockLedgerItem> ledger)? stockLoaded,
    TResult? Function(String message)? error,
  }) {
    return stockLoaded?.call(ledger);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SalesReportItem> report)? salesLoaded,
    TResult Function(List<StockLedgerItem> ledger)? stockLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (stockLoaded != null) {
      return stockLoaded(ledger);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SalesLoaded value) salesLoaded,
    required TResult Function(_StockLoaded value) stockLoaded,
    required TResult Function(_Error value) error,
  }) {
    return stockLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SalesLoaded value)? salesLoaded,
    TResult? Function(_StockLoaded value)? stockLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return stockLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SalesLoaded value)? salesLoaded,
    TResult Function(_StockLoaded value)? stockLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (stockLoaded != null) {
      return stockLoaded(this);
    }
    return orElse();
  }
}

abstract class _StockLoaded implements ReportState {
  const factory _StockLoaded(final List<StockLedgerItem> ledger) =
      _$StockLoadedImpl;

  List<StockLedgerItem> get ledger;

  /// Create a copy of ReportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockLoadedImplCopyWith<_$StockLoadedImpl> get copyWith =>
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
    extends _$ReportStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportState
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
    return 'ReportState.error(message: $message)';
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

  /// Create a copy of ReportState
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
    required TResult Function(List<SalesReportItem> report) salesLoaded,
    required TResult Function(List<StockLedgerItem> ledger) stockLoaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SalesReportItem> report)? salesLoaded,
    TResult? Function(List<StockLedgerItem> ledger)? stockLoaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SalesReportItem> report)? salesLoaded,
    TResult Function(List<StockLedgerItem> ledger)? stockLoaded,
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
    required TResult Function(_SalesLoaded value) salesLoaded,
    required TResult Function(_StockLoaded value) stockLoaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SalesLoaded value)? salesLoaded,
    TResult? Function(_StockLoaded value)? stockLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SalesLoaded value)? salesLoaded,
    TResult Function(_StockLoaded value)? stockLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ReportState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of ReportState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
