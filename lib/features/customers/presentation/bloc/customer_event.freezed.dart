// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) search,
    required TResult Function(CustomerSegment? segment) filterBySegment,
    required TResult Function(String uuid) selectCustomer,
    required TResult Function(
            String customerUuid, String content, bool isCritical)
        addNote,
    required TResult Function() refresh,
    required TResult Function(String name, String phone, String email)
        addCustomer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? search,
    TResult? Function(CustomerSegment? segment)? filterBySegment,
    TResult? Function(String uuid)? selectCustomer,
    TResult? Function(String customerUuid, String content, bool isCritical)?
        addNote,
    TResult? Function()? refresh,
    TResult? Function(String name, String phone, String email)? addCustomer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? search,
    TResult Function(CustomerSegment? segment)? filterBySegment,
    TResult Function(String uuid)? selectCustomer,
    TResult Function(String customerUuid, String content, bool isCritical)?
        addNote,
    TResult Function()? refresh,
    TResult Function(String name, String phone, String email)? addCustomer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchCustomers value) search,
    required TResult Function(FilterBySegment value) filterBySegment,
    required TResult Function(SelectCustomer value) selectCustomer,
    required TResult Function(AddNote value) addNote,
    required TResult Function(RefreshCustomers value) refresh,
    required TResult Function(AddCustomer value) addCustomer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchCustomers value)? search,
    TResult? Function(FilterBySegment value)? filterBySegment,
    TResult? Function(SelectCustomer value)? selectCustomer,
    TResult? Function(AddNote value)? addNote,
    TResult? Function(RefreshCustomers value)? refresh,
    TResult? Function(AddCustomer value)? addCustomer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchCustomers value)? search,
    TResult Function(FilterBySegment value)? filterBySegment,
    TResult Function(SelectCustomer value)? selectCustomer,
    TResult Function(AddNote value)? addNote,
    TResult Function(RefreshCustomers value)? refresh,
    TResult Function(AddCustomer value)? addCustomer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerEventCopyWith<$Res> {
  factory $CustomerEventCopyWith(
          CustomerEvent value, $Res Function(CustomerEvent) then) =
      _$CustomerEventCopyWithImpl<$Res, CustomerEvent>;
}

/// @nodoc
class _$CustomerEventCopyWithImpl<$Res, $Val extends CustomerEvent>
    implements $CustomerEventCopyWith<$Res> {
  _$CustomerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SearchCustomersImplCopyWith<$Res> {
  factory _$$SearchCustomersImplCopyWith(_$SearchCustomersImpl value,
          $Res Function(_$SearchCustomersImpl) then) =
      __$$SearchCustomersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchCustomersImplCopyWithImpl<$Res>
    extends _$CustomerEventCopyWithImpl<$Res, _$SearchCustomersImpl>
    implements _$$SearchCustomersImplCopyWith<$Res> {
  __$$SearchCustomersImplCopyWithImpl(
      _$SearchCustomersImpl _value, $Res Function(_$SearchCustomersImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchCustomersImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchCustomersImpl implements SearchCustomers {
  const _$SearchCustomersImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'CustomerEvent.search(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchCustomersImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchCustomersImplCopyWith<_$SearchCustomersImpl> get copyWith =>
      __$$SearchCustomersImplCopyWithImpl<_$SearchCustomersImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) search,
    required TResult Function(CustomerSegment? segment) filterBySegment,
    required TResult Function(String uuid) selectCustomer,
    required TResult Function(
            String customerUuid, String content, bool isCritical)
        addNote,
    required TResult Function() refresh,
    required TResult Function(String name, String phone, String email)
        addCustomer,
  }) {
    return search(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? search,
    TResult? Function(CustomerSegment? segment)? filterBySegment,
    TResult? Function(String uuid)? selectCustomer,
    TResult? Function(String customerUuid, String content, bool isCritical)?
        addNote,
    TResult? Function()? refresh,
    TResult? Function(String name, String phone, String email)? addCustomer,
  }) {
    return search?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? search,
    TResult Function(CustomerSegment? segment)? filterBySegment,
    TResult Function(String uuid)? selectCustomer,
    TResult Function(String customerUuid, String content, bool isCritical)?
        addNote,
    TResult Function()? refresh,
    TResult Function(String name, String phone, String email)? addCustomer,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchCustomers value) search,
    required TResult Function(FilterBySegment value) filterBySegment,
    required TResult Function(SelectCustomer value) selectCustomer,
    required TResult Function(AddNote value) addNote,
    required TResult Function(RefreshCustomers value) refresh,
    required TResult Function(AddCustomer value) addCustomer,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchCustomers value)? search,
    TResult? Function(FilterBySegment value)? filterBySegment,
    TResult? Function(SelectCustomer value)? selectCustomer,
    TResult? Function(AddNote value)? addNote,
    TResult? Function(RefreshCustomers value)? refresh,
    TResult? Function(AddCustomer value)? addCustomer,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchCustomers value)? search,
    TResult Function(FilterBySegment value)? filterBySegment,
    TResult Function(SelectCustomer value)? selectCustomer,
    TResult Function(AddNote value)? addNote,
    TResult Function(RefreshCustomers value)? refresh,
    TResult Function(AddCustomer value)? addCustomer,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class SearchCustomers implements CustomerEvent {
  const factory SearchCustomers(final String query) = _$SearchCustomersImpl;

  String get query;

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchCustomersImplCopyWith<_$SearchCustomersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterBySegmentImplCopyWith<$Res> {
  factory _$$FilterBySegmentImplCopyWith(_$FilterBySegmentImpl value,
          $Res Function(_$FilterBySegmentImpl) then) =
      __$$FilterBySegmentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CustomerSegment? segment});
}

/// @nodoc
class __$$FilterBySegmentImplCopyWithImpl<$Res>
    extends _$CustomerEventCopyWithImpl<$Res, _$FilterBySegmentImpl>
    implements _$$FilterBySegmentImplCopyWith<$Res> {
  __$$FilterBySegmentImplCopyWithImpl(
      _$FilterBySegmentImpl _value, $Res Function(_$FilterBySegmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? segment = freezed,
  }) {
    return _then(_$FilterBySegmentImpl(
      freezed == segment
          ? _value.segment
          : segment // ignore: cast_nullable_to_non_nullable
              as CustomerSegment?,
    ));
  }
}

/// @nodoc

class _$FilterBySegmentImpl implements FilterBySegment {
  const _$FilterBySegmentImpl(this.segment);

  @override
  final CustomerSegment? segment;

  @override
  String toString() {
    return 'CustomerEvent.filterBySegment(segment: $segment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterBySegmentImpl &&
            (identical(other.segment, segment) || other.segment == segment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, segment);

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterBySegmentImplCopyWith<_$FilterBySegmentImpl> get copyWith =>
      __$$FilterBySegmentImplCopyWithImpl<_$FilterBySegmentImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) search,
    required TResult Function(CustomerSegment? segment) filterBySegment,
    required TResult Function(String uuid) selectCustomer,
    required TResult Function(
            String customerUuid, String content, bool isCritical)
        addNote,
    required TResult Function() refresh,
    required TResult Function(String name, String phone, String email)
        addCustomer,
  }) {
    return filterBySegment(segment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? search,
    TResult? Function(CustomerSegment? segment)? filterBySegment,
    TResult? Function(String uuid)? selectCustomer,
    TResult? Function(String customerUuid, String content, bool isCritical)?
        addNote,
    TResult? Function()? refresh,
    TResult? Function(String name, String phone, String email)? addCustomer,
  }) {
    return filterBySegment?.call(segment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? search,
    TResult Function(CustomerSegment? segment)? filterBySegment,
    TResult Function(String uuid)? selectCustomer,
    TResult Function(String customerUuid, String content, bool isCritical)?
        addNote,
    TResult Function()? refresh,
    TResult Function(String name, String phone, String email)? addCustomer,
    required TResult orElse(),
  }) {
    if (filterBySegment != null) {
      return filterBySegment(segment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchCustomers value) search,
    required TResult Function(FilterBySegment value) filterBySegment,
    required TResult Function(SelectCustomer value) selectCustomer,
    required TResult Function(AddNote value) addNote,
    required TResult Function(RefreshCustomers value) refresh,
    required TResult Function(AddCustomer value) addCustomer,
  }) {
    return filterBySegment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchCustomers value)? search,
    TResult? Function(FilterBySegment value)? filterBySegment,
    TResult? Function(SelectCustomer value)? selectCustomer,
    TResult? Function(AddNote value)? addNote,
    TResult? Function(RefreshCustomers value)? refresh,
    TResult? Function(AddCustomer value)? addCustomer,
  }) {
    return filterBySegment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchCustomers value)? search,
    TResult Function(FilterBySegment value)? filterBySegment,
    TResult Function(SelectCustomer value)? selectCustomer,
    TResult Function(AddNote value)? addNote,
    TResult Function(RefreshCustomers value)? refresh,
    TResult Function(AddCustomer value)? addCustomer,
    required TResult orElse(),
  }) {
    if (filterBySegment != null) {
      return filterBySegment(this);
    }
    return orElse();
  }
}

abstract class FilterBySegment implements CustomerEvent {
  const factory FilterBySegment(final CustomerSegment? segment) =
      _$FilterBySegmentImpl;

  CustomerSegment? get segment;

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterBySegmentImplCopyWith<_$FilterBySegmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectCustomerImplCopyWith<$Res> {
  factory _$$SelectCustomerImplCopyWith(_$SelectCustomerImpl value,
          $Res Function(_$SelectCustomerImpl) then) =
      __$$SelectCustomerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uuid});
}

/// @nodoc
class __$$SelectCustomerImplCopyWithImpl<$Res>
    extends _$CustomerEventCopyWithImpl<$Res, _$SelectCustomerImpl>
    implements _$$SelectCustomerImplCopyWith<$Res> {
  __$$SelectCustomerImplCopyWithImpl(
      _$SelectCustomerImpl _value, $Res Function(_$SelectCustomerImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
  }) {
    return _then(_$SelectCustomerImpl(
      null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectCustomerImpl implements SelectCustomer {
  const _$SelectCustomerImpl(this.uuid);

  @override
  final String uuid;

  @override
  String toString() {
    return 'CustomerEvent.selectCustomer(uuid: $uuid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectCustomerImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid);

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectCustomerImplCopyWith<_$SelectCustomerImpl> get copyWith =>
      __$$SelectCustomerImplCopyWithImpl<_$SelectCustomerImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) search,
    required TResult Function(CustomerSegment? segment) filterBySegment,
    required TResult Function(String uuid) selectCustomer,
    required TResult Function(
            String customerUuid, String content, bool isCritical)
        addNote,
    required TResult Function() refresh,
    required TResult Function(String name, String phone, String email)
        addCustomer,
  }) {
    return selectCustomer(uuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? search,
    TResult? Function(CustomerSegment? segment)? filterBySegment,
    TResult? Function(String uuid)? selectCustomer,
    TResult? Function(String customerUuid, String content, bool isCritical)?
        addNote,
    TResult? Function()? refresh,
    TResult? Function(String name, String phone, String email)? addCustomer,
  }) {
    return selectCustomer?.call(uuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? search,
    TResult Function(CustomerSegment? segment)? filterBySegment,
    TResult Function(String uuid)? selectCustomer,
    TResult Function(String customerUuid, String content, bool isCritical)?
        addNote,
    TResult Function()? refresh,
    TResult Function(String name, String phone, String email)? addCustomer,
    required TResult orElse(),
  }) {
    if (selectCustomer != null) {
      return selectCustomer(uuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchCustomers value) search,
    required TResult Function(FilterBySegment value) filterBySegment,
    required TResult Function(SelectCustomer value) selectCustomer,
    required TResult Function(AddNote value) addNote,
    required TResult Function(RefreshCustomers value) refresh,
    required TResult Function(AddCustomer value) addCustomer,
  }) {
    return selectCustomer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchCustomers value)? search,
    TResult? Function(FilterBySegment value)? filterBySegment,
    TResult? Function(SelectCustomer value)? selectCustomer,
    TResult? Function(AddNote value)? addNote,
    TResult? Function(RefreshCustomers value)? refresh,
    TResult? Function(AddCustomer value)? addCustomer,
  }) {
    return selectCustomer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchCustomers value)? search,
    TResult Function(FilterBySegment value)? filterBySegment,
    TResult Function(SelectCustomer value)? selectCustomer,
    TResult Function(AddNote value)? addNote,
    TResult Function(RefreshCustomers value)? refresh,
    TResult Function(AddCustomer value)? addCustomer,
    required TResult orElse(),
  }) {
    if (selectCustomer != null) {
      return selectCustomer(this);
    }
    return orElse();
  }
}

abstract class SelectCustomer implements CustomerEvent {
  const factory SelectCustomer(final String uuid) = _$SelectCustomerImpl;

  String get uuid;

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectCustomerImplCopyWith<_$SelectCustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddNoteImplCopyWith<$Res> {
  factory _$$AddNoteImplCopyWith(
          _$AddNoteImpl value, $Res Function(_$AddNoteImpl) then) =
      __$$AddNoteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String customerUuid, String content, bool isCritical});
}

/// @nodoc
class __$$AddNoteImplCopyWithImpl<$Res>
    extends _$CustomerEventCopyWithImpl<$Res, _$AddNoteImpl>
    implements _$$AddNoteImplCopyWith<$Res> {
  __$$AddNoteImplCopyWithImpl(
      _$AddNoteImpl _value, $Res Function(_$AddNoteImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerUuid = null,
    Object? content = null,
    Object? isCritical = null,
  }) {
    return _then(_$AddNoteImpl(
      null == customerUuid
          ? _value.customerUuid
          : customerUuid // ignore: cast_nullable_to_non_nullable
              as String,
      null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isCritical: null == isCritical
          ? _value.isCritical
          : isCritical // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AddNoteImpl implements AddNote {
  const _$AddNoteImpl(this.customerUuid, this.content,
      {required this.isCritical});

  @override
  final String customerUuid;
  @override
  final String content;
  @override
  final bool isCritical;

  @override
  String toString() {
    return 'CustomerEvent.addNote(customerUuid: $customerUuid, content: $content, isCritical: $isCritical)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddNoteImpl &&
            (identical(other.customerUuid, customerUuid) ||
                other.customerUuid == customerUuid) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isCritical, isCritical) ||
                other.isCritical == isCritical));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, customerUuid, content, isCritical);

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddNoteImplCopyWith<_$AddNoteImpl> get copyWith =>
      __$$AddNoteImplCopyWithImpl<_$AddNoteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) search,
    required TResult Function(CustomerSegment? segment) filterBySegment,
    required TResult Function(String uuid) selectCustomer,
    required TResult Function(
            String customerUuid, String content, bool isCritical)
        addNote,
    required TResult Function() refresh,
    required TResult Function(String name, String phone, String email)
        addCustomer,
  }) {
    return addNote(customerUuid, content, isCritical);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? search,
    TResult? Function(CustomerSegment? segment)? filterBySegment,
    TResult? Function(String uuid)? selectCustomer,
    TResult? Function(String customerUuid, String content, bool isCritical)?
        addNote,
    TResult? Function()? refresh,
    TResult? Function(String name, String phone, String email)? addCustomer,
  }) {
    return addNote?.call(customerUuid, content, isCritical);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? search,
    TResult Function(CustomerSegment? segment)? filterBySegment,
    TResult Function(String uuid)? selectCustomer,
    TResult Function(String customerUuid, String content, bool isCritical)?
        addNote,
    TResult Function()? refresh,
    TResult Function(String name, String phone, String email)? addCustomer,
    required TResult orElse(),
  }) {
    if (addNote != null) {
      return addNote(customerUuid, content, isCritical);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchCustomers value) search,
    required TResult Function(FilterBySegment value) filterBySegment,
    required TResult Function(SelectCustomer value) selectCustomer,
    required TResult Function(AddNote value) addNote,
    required TResult Function(RefreshCustomers value) refresh,
    required TResult Function(AddCustomer value) addCustomer,
  }) {
    return addNote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchCustomers value)? search,
    TResult? Function(FilterBySegment value)? filterBySegment,
    TResult? Function(SelectCustomer value)? selectCustomer,
    TResult? Function(AddNote value)? addNote,
    TResult? Function(RefreshCustomers value)? refresh,
    TResult? Function(AddCustomer value)? addCustomer,
  }) {
    return addNote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchCustomers value)? search,
    TResult Function(FilterBySegment value)? filterBySegment,
    TResult Function(SelectCustomer value)? selectCustomer,
    TResult Function(AddNote value)? addNote,
    TResult Function(RefreshCustomers value)? refresh,
    TResult Function(AddCustomer value)? addCustomer,
    required TResult orElse(),
  }) {
    if (addNote != null) {
      return addNote(this);
    }
    return orElse();
  }
}

abstract class AddNote implements CustomerEvent {
  const factory AddNote(final String customerUuid, final String content,
      {required final bool isCritical}) = _$AddNoteImpl;

  String get customerUuid;
  String get content;
  bool get isCritical;

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddNoteImplCopyWith<_$AddNoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshCustomersImplCopyWith<$Res> {
  factory _$$RefreshCustomersImplCopyWith(_$RefreshCustomersImpl value,
          $Res Function(_$RefreshCustomersImpl) then) =
      __$$RefreshCustomersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshCustomersImplCopyWithImpl<$Res>
    extends _$CustomerEventCopyWithImpl<$Res, _$RefreshCustomersImpl>
    implements _$$RefreshCustomersImplCopyWith<$Res> {
  __$$RefreshCustomersImplCopyWithImpl(_$RefreshCustomersImpl _value,
      $Res Function(_$RefreshCustomersImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshCustomersImpl implements RefreshCustomers {
  const _$RefreshCustomersImpl();

  @override
  String toString() {
    return 'CustomerEvent.refresh()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshCustomersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) search,
    required TResult Function(CustomerSegment? segment) filterBySegment,
    required TResult Function(String uuid) selectCustomer,
    required TResult Function(
            String customerUuid, String content, bool isCritical)
        addNote,
    required TResult Function() refresh,
    required TResult Function(String name, String phone, String email)
        addCustomer,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? search,
    TResult? Function(CustomerSegment? segment)? filterBySegment,
    TResult? Function(String uuid)? selectCustomer,
    TResult? Function(String customerUuid, String content, bool isCritical)?
        addNote,
    TResult? Function()? refresh,
    TResult? Function(String name, String phone, String email)? addCustomer,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? search,
    TResult Function(CustomerSegment? segment)? filterBySegment,
    TResult Function(String uuid)? selectCustomer,
    TResult Function(String customerUuid, String content, bool isCritical)?
        addNote,
    TResult Function()? refresh,
    TResult Function(String name, String phone, String email)? addCustomer,
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
    required TResult Function(SearchCustomers value) search,
    required TResult Function(FilterBySegment value) filterBySegment,
    required TResult Function(SelectCustomer value) selectCustomer,
    required TResult Function(AddNote value) addNote,
    required TResult Function(RefreshCustomers value) refresh,
    required TResult Function(AddCustomer value) addCustomer,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchCustomers value)? search,
    TResult? Function(FilterBySegment value)? filterBySegment,
    TResult? Function(SelectCustomer value)? selectCustomer,
    TResult? Function(AddNote value)? addNote,
    TResult? Function(RefreshCustomers value)? refresh,
    TResult? Function(AddCustomer value)? addCustomer,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchCustomers value)? search,
    TResult Function(FilterBySegment value)? filterBySegment,
    TResult Function(SelectCustomer value)? selectCustomer,
    TResult Function(AddNote value)? addNote,
    TResult Function(RefreshCustomers value)? refresh,
    TResult Function(AddCustomer value)? addCustomer,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class RefreshCustomers implements CustomerEvent {
  const factory RefreshCustomers() = _$RefreshCustomersImpl;
}

/// @nodoc
abstract class _$$AddCustomerImplCopyWith<$Res> {
  factory _$$AddCustomerImplCopyWith(
          _$AddCustomerImpl value, $Res Function(_$AddCustomerImpl) then) =
      __$$AddCustomerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, String phone, String email});
}

/// @nodoc
class __$$AddCustomerImplCopyWithImpl<$Res>
    extends _$CustomerEventCopyWithImpl<$Res, _$AddCustomerImpl>
    implements _$$AddCustomerImplCopyWith<$Res> {
  __$$AddCustomerImplCopyWithImpl(
      _$AddCustomerImpl _value, $Res Function(_$AddCustomerImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? email = null,
  }) {
    return _then(_$AddCustomerImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddCustomerImpl implements AddCustomer {
  const _$AddCustomerImpl(this.name, this.phone, this.email);

  @override
  final String name;
  @override
  final String phone;
  @override
  final String email;

  @override
  String toString() {
    return 'CustomerEvent.addCustomer(name: $name, phone: $phone, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCustomerImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, phone, email);

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCustomerImplCopyWith<_$AddCustomerImpl> get copyWith =>
      __$$AddCustomerImplCopyWithImpl<_$AddCustomerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) search,
    required TResult Function(CustomerSegment? segment) filterBySegment,
    required TResult Function(String uuid) selectCustomer,
    required TResult Function(
            String customerUuid, String content, bool isCritical)
        addNote,
    required TResult Function() refresh,
    required TResult Function(String name, String phone, String email)
        addCustomer,
  }) {
    return addCustomer(name, phone, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? search,
    TResult? Function(CustomerSegment? segment)? filterBySegment,
    TResult? Function(String uuid)? selectCustomer,
    TResult? Function(String customerUuid, String content, bool isCritical)?
        addNote,
    TResult? Function()? refresh,
    TResult? Function(String name, String phone, String email)? addCustomer,
  }) {
    return addCustomer?.call(name, phone, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? search,
    TResult Function(CustomerSegment? segment)? filterBySegment,
    TResult Function(String uuid)? selectCustomer,
    TResult Function(String customerUuid, String content, bool isCritical)?
        addNote,
    TResult Function()? refresh,
    TResult Function(String name, String phone, String email)? addCustomer,
    required TResult orElse(),
  }) {
    if (addCustomer != null) {
      return addCustomer(name, phone, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchCustomers value) search,
    required TResult Function(FilterBySegment value) filterBySegment,
    required TResult Function(SelectCustomer value) selectCustomer,
    required TResult Function(AddNote value) addNote,
    required TResult Function(RefreshCustomers value) refresh,
    required TResult Function(AddCustomer value) addCustomer,
  }) {
    return addCustomer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchCustomers value)? search,
    TResult? Function(FilterBySegment value)? filterBySegment,
    TResult? Function(SelectCustomer value)? selectCustomer,
    TResult? Function(AddNote value)? addNote,
    TResult? Function(RefreshCustomers value)? refresh,
    TResult? Function(AddCustomer value)? addCustomer,
  }) {
    return addCustomer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchCustomers value)? search,
    TResult Function(FilterBySegment value)? filterBySegment,
    TResult Function(SelectCustomer value)? selectCustomer,
    TResult Function(AddNote value)? addNote,
    TResult Function(RefreshCustomers value)? refresh,
    TResult Function(AddCustomer value)? addCustomer,
    required TResult orElse(),
  }) {
    if (addCustomer != null) {
      return addCustomer(this);
    }
    return orElse();
  }
}

abstract class AddCustomer implements CustomerEvent {
  const factory AddCustomer(
          final String name, final String phone, final String email) =
      _$AddCustomerImpl;

  String get name;
  String get phone;
  String get email;

  /// Create a copy of CustomerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddCustomerImplCopyWith<_$AddCustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
