// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_station_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchStationEvent {
  String get searchString => throw _privateConstructorUsedError;
  List<ChargestationsModel> get stations => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String searchString, List<ChargestationsModel> stations)
        findItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchString, List<ChargestationsModel> stations)?
        findItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchString, List<ChargestationsModel> stations)?
        findItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FindItemSearchStationEvent value) findItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FindItemSearchStationEvent value)? findItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FindItemSearchStationEvent value)? findItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStationEventCopyWith<SearchStationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStationEventCopyWith<$Res> {
  factory $SearchStationEventCopyWith(
          SearchStationEvent value, $Res Function(SearchStationEvent) then) =
      _$SearchStationEventCopyWithImpl<$Res, SearchStationEvent>;
  @useResult
  $Res call({String searchString, List<ChargestationsModel> stations});
}

/// @nodoc
class _$SearchStationEventCopyWithImpl<$Res, $Val extends SearchStationEvent>
    implements $SearchStationEventCopyWith<$Res> {
  _$SearchStationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchString = null,
    Object? stations = null,
  }) {
    return _then(_value.copyWith(
      searchString: null == searchString
          ? _value.searchString
          : searchString // ignore: cast_nullable_to_non_nullable
              as String,
      stations: null == stations
          ? _value.stations
          : stations // ignore: cast_nullable_to_non_nullable
              as List<ChargestationsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FindItemSearchStationEventCopyWith<$Res>
    implements $SearchStationEventCopyWith<$Res> {
  factory _$$_FindItemSearchStationEventCopyWith(
          _$_FindItemSearchStationEvent value,
          $Res Function(_$_FindItemSearchStationEvent) then) =
      __$$_FindItemSearchStationEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String searchString, List<ChargestationsModel> stations});
}

/// @nodoc
class __$$_FindItemSearchStationEventCopyWithImpl<$Res>
    extends _$SearchStationEventCopyWithImpl<$Res,
        _$_FindItemSearchStationEvent>
    implements _$$_FindItemSearchStationEventCopyWith<$Res> {
  __$$_FindItemSearchStationEventCopyWithImpl(
      _$_FindItemSearchStationEvent _value,
      $Res Function(_$_FindItemSearchStationEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchString = null,
    Object? stations = null,
  }) {
    return _then(_$_FindItemSearchStationEvent(
      searchString: null == searchString
          ? _value.searchString
          : searchString // ignore: cast_nullable_to_non_nullable
              as String,
      stations: null == stations
          ? _value._stations
          : stations // ignore: cast_nullable_to_non_nullable
              as List<ChargestationsModel>,
    ));
  }
}

/// @nodoc

class _$_FindItemSearchStationEvent implements _FindItemSearchStationEvent {
  _$_FindItemSearchStationEvent(
      {required this.searchString,
      required final List<ChargestationsModel> stations})
      : _stations = stations;

  @override
  final String searchString;
  final List<ChargestationsModel> _stations;
  @override
  List<ChargestationsModel> get stations {
    if (_stations is EqualUnmodifiableListView) return _stations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stations);
  }

  @override
  String toString() {
    return 'SearchStationEvent.findItem(searchString: $searchString, stations: $stations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FindItemSearchStationEvent &&
            (identical(other.searchString, searchString) ||
                other.searchString == searchString) &&
            const DeepCollectionEquality().equals(other._stations, _stations));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchString,
      const DeepCollectionEquality().hash(_stations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FindItemSearchStationEventCopyWith<_$_FindItemSearchStationEvent>
      get copyWith => __$$_FindItemSearchStationEventCopyWithImpl<
          _$_FindItemSearchStationEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String searchString, List<ChargestationsModel> stations)
        findItem,
  }) {
    return findItem(searchString, stations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String searchString, List<ChargestationsModel> stations)?
        findItem,
  }) {
    return findItem?.call(searchString, stations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String searchString, List<ChargestationsModel> stations)?
        findItem,
    required TResult orElse(),
  }) {
    if (findItem != null) {
      return findItem(searchString, stations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FindItemSearchStationEvent value) findItem,
  }) {
    return findItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FindItemSearchStationEvent value)? findItem,
  }) {
    return findItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FindItemSearchStationEvent value)? findItem,
    required TResult orElse(),
  }) {
    if (findItem != null) {
      return findItem(this);
    }
    return orElse();
  }
}

abstract class _FindItemSearchStationEvent implements SearchStationEvent {
  factory _FindItemSearchStationEvent(
          {required final String searchString,
          required final List<ChargestationsModel> stations}) =
      _$_FindItemSearchStationEvent;

  @override
  String get searchString;
  @override
  List<ChargestationsModel> get stations;
  @override
  @JsonKey(ignore: true)
  _$$_FindItemSearchStationEventCopyWith<_$_FindItemSearchStationEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchStationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ChargestationsModel> foundStations) found,
    required TResult Function(String error) error,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ChargestationsModel> foundStations)? found,
    TResult? Function(String error)? error,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ChargestationsModel> foundStations)? found,
    TResult Function(String error)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchStationStateInitial value) initial,
    required TResult Function(_SearchStationStateFound value) found,
    required TResult Function(_SearchStationStateError value) error,
    required TResult Function(_SearchStationStateLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchStationStateInitial value)? initial,
    TResult? Function(_SearchStationStateFound value)? found,
    TResult? Function(_SearchStationStateError value)? error,
    TResult? Function(_SearchStationStateLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchStationStateInitial value)? initial,
    TResult Function(_SearchStationStateFound value)? found,
    TResult Function(_SearchStationStateError value)? error,
    TResult Function(_SearchStationStateLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStationStateCopyWith<$Res> {
  factory $SearchStationStateCopyWith(
          SearchStationState value, $Res Function(SearchStationState) then) =
      _$SearchStationStateCopyWithImpl<$Res, SearchStationState>;
}

/// @nodoc
class _$SearchStationStateCopyWithImpl<$Res, $Val extends SearchStationState>
    implements $SearchStationStateCopyWith<$Res> {
  _$SearchStationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SearchStationStateInitialCopyWith<$Res> {
  factory _$$_SearchStationStateInitialCopyWith(
          _$_SearchStationStateInitial value,
          $Res Function(_$_SearchStationStateInitial) then) =
      __$$_SearchStationStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SearchStationStateInitialCopyWithImpl<$Res>
    extends _$SearchStationStateCopyWithImpl<$Res, _$_SearchStationStateInitial>
    implements _$$_SearchStationStateInitialCopyWith<$Res> {
  __$$_SearchStationStateInitialCopyWithImpl(
      _$_SearchStationStateInitial _value,
      $Res Function(_$_SearchStationStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SearchStationStateInitial implements _SearchStationStateInitial {
  const _$_SearchStationStateInitial();

  @override
  String toString() {
    return 'SearchStationState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchStationStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ChargestationsModel> foundStations) found,
    required TResult Function(String error) error,
    required TResult Function() loading,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ChargestationsModel> foundStations)? found,
    TResult? Function(String error)? error,
    TResult? Function()? loading,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ChargestationsModel> foundStations)? found,
    TResult Function(String error)? error,
    TResult Function()? loading,
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
    required TResult Function(_SearchStationStateInitial value) initial,
    required TResult Function(_SearchStationStateFound value) found,
    required TResult Function(_SearchStationStateError value) error,
    required TResult Function(_SearchStationStateLoading value) loading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchStationStateInitial value)? initial,
    TResult? Function(_SearchStationStateFound value)? found,
    TResult? Function(_SearchStationStateError value)? error,
    TResult? Function(_SearchStationStateLoading value)? loading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchStationStateInitial value)? initial,
    TResult Function(_SearchStationStateFound value)? found,
    TResult Function(_SearchStationStateError value)? error,
    TResult Function(_SearchStationStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SearchStationStateInitial implements SearchStationState {
  const factory _SearchStationStateInitial() = _$_SearchStationStateInitial;
}

/// @nodoc
abstract class _$$_SearchStationStateFoundCopyWith<$Res> {
  factory _$$_SearchStationStateFoundCopyWith(_$_SearchStationStateFound value,
          $Res Function(_$_SearchStationStateFound) then) =
      __$$_SearchStationStateFoundCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ChargestationsModel> foundStations});
}

/// @nodoc
class __$$_SearchStationStateFoundCopyWithImpl<$Res>
    extends _$SearchStationStateCopyWithImpl<$Res, _$_SearchStationStateFound>
    implements _$$_SearchStationStateFoundCopyWith<$Res> {
  __$$_SearchStationStateFoundCopyWithImpl(_$_SearchStationStateFound _value,
      $Res Function(_$_SearchStationStateFound) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foundStations = null,
  }) {
    return _then(_$_SearchStationStateFound(
      foundStations: null == foundStations
          ? _value._foundStations
          : foundStations // ignore: cast_nullable_to_non_nullable
              as List<ChargestationsModel>,
    ));
  }
}

/// @nodoc

class _$_SearchStationStateFound implements _SearchStationStateFound {
  const _$_SearchStationStateFound(
      {required final List<ChargestationsModel> foundStations})
      : _foundStations = foundStations;

  final List<ChargestationsModel> _foundStations;
  @override
  List<ChargestationsModel> get foundStations {
    if (_foundStations is EqualUnmodifiableListView) return _foundStations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foundStations);
  }

  @override
  String toString() {
    return 'SearchStationState.found(foundStations: $foundStations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchStationStateFound &&
            const DeepCollectionEquality()
                .equals(other._foundStations, _foundStations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_foundStations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchStationStateFoundCopyWith<_$_SearchStationStateFound>
      get copyWith =>
          __$$_SearchStationStateFoundCopyWithImpl<_$_SearchStationStateFound>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ChargestationsModel> foundStations) found,
    required TResult Function(String error) error,
    required TResult Function() loading,
  }) {
    return found(foundStations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ChargestationsModel> foundStations)? found,
    TResult? Function(String error)? error,
    TResult? Function()? loading,
  }) {
    return found?.call(foundStations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ChargestationsModel> foundStations)? found,
    TResult Function(String error)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (found != null) {
      return found(foundStations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchStationStateInitial value) initial,
    required TResult Function(_SearchStationStateFound value) found,
    required TResult Function(_SearchStationStateError value) error,
    required TResult Function(_SearchStationStateLoading value) loading,
  }) {
    return found(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchStationStateInitial value)? initial,
    TResult? Function(_SearchStationStateFound value)? found,
    TResult? Function(_SearchStationStateError value)? error,
    TResult? Function(_SearchStationStateLoading value)? loading,
  }) {
    return found?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchStationStateInitial value)? initial,
    TResult Function(_SearchStationStateFound value)? found,
    TResult Function(_SearchStationStateError value)? error,
    TResult Function(_SearchStationStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if (found != null) {
      return found(this);
    }
    return orElse();
  }
}

abstract class _SearchStationStateFound implements SearchStationState {
  const factory _SearchStationStateFound(
          {required final List<ChargestationsModel> foundStations}) =
      _$_SearchStationStateFound;

  List<ChargestationsModel> get foundStations;
  @JsonKey(ignore: true)
  _$$_SearchStationStateFoundCopyWith<_$_SearchStationStateFound>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SearchStationStateErrorCopyWith<$Res> {
  factory _$$_SearchStationStateErrorCopyWith(_$_SearchStationStateError value,
          $Res Function(_$_SearchStationStateError) then) =
      __$$_SearchStationStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$_SearchStationStateErrorCopyWithImpl<$Res>
    extends _$SearchStationStateCopyWithImpl<$Res, _$_SearchStationStateError>
    implements _$$_SearchStationStateErrorCopyWith<$Res> {
  __$$_SearchStationStateErrorCopyWithImpl(_$_SearchStationStateError _value,
      $Res Function(_$_SearchStationStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_SearchStationStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchStationStateError implements _SearchStationStateError {
  const _$_SearchStationStateError({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'SearchStationState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchStationStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchStationStateErrorCopyWith<_$_SearchStationStateError>
      get copyWith =>
          __$$_SearchStationStateErrorCopyWithImpl<_$_SearchStationStateError>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ChargestationsModel> foundStations) found,
    required TResult Function(String error) error,
    required TResult Function() loading,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ChargestationsModel> foundStations)? found,
    TResult? Function(String error)? error,
    TResult? Function()? loading,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ChargestationsModel> foundStations)? found,
    TResult Function(String error)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchStationStateInitial value) initial,
    required TResult Function(_SearchStationStateFound value) found,
    required TResult Function(_SearchStationStateError value) error,
    required TResult Function(_SearchStationStateLoading value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchStationStateInitial value)? initial,
    TResult? Function(_SearchStationStateFound value)? found,
    TResult? Function(_SearchStationStateError value)? error,
    TResult? Function(_SearchStationStateLoading value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchStationStateInitial value)? initial,
    TResult Function(_SearchStationStateFound value)? found,
    TResult Function(_SearchStationStateError value)? error,
    TResult Function(_SearchStationStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _SearchStationStateError implements SearchStationState {
  const factory _SearchStationStateError({required final String error}) =
      _$_SearchStationStateError;

  String get error;
  @JsonKey(ignore: true)
  _$$_SearchStationStateErrorCopyWith<_$_SearchStationStateError>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SearchStationStateLoadingCopyWith<$Res> {
  factory _$$_SearchStationStateLoadingCopyWith(
          _$_SearchStationStateLoading value,
          $Res Function(_$_SearchStationStateLoading) then) =
      __$$_SearchStationStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SearchStationStateLoadingCopyWithImpl<$Res>
    extends _$SearchStationStateCopyWithImpl<$Res, _$_SearchStationStateLoading>
    implements _$$_SearchStationStateLoadingCopyWith<$Res> {
  __$$_SearchStationStateLoadingCopyWithImpl(
      _$_SearchStationStateLoading _value,
      $Res Function(_$_SearchStationStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SearchStationStateLoading implements _SearchStationStateLoading {
  const _$_SearchStationStateLoading();

  @override
  String toString() {
    return 'SearchStationState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchStationStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ChargestationsModel> foundStations) found,
    required TResult Function(String error) error,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ChargestationsModel> foundStations)? found,
    TResult? Function(String error)? error,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ChargestationsModel> foundStations)? found,
    TResult Function(String error)? error,
    TResult Function()? loading,
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
    required TResult Function(_SearchStationStateInitial value) initial,
    required TResult Function(_SearchStationStateFound value) found,
    required TResult Function(_SearchStationStateError value) error,
    required TResult Function(_SearchStationStateLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchStationStateInitial value)? initial,
    TResult? Function(_SearchStationStateFound value)? found,
    TResult? Function(_SearchStationStateError value)? error,
    TResult? Function(_SearchStationStateLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchStationStateInitial value)? initial,
    TResult Function(_SearchStationStateFound value)? found,
    TResult Function(_SearchStationStateError value)? error,
    TResult Function(_SearchStationStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SearchStationStateLoading implements SearchStationState {
  const factory _SearchStationStateLoading() = _$_SearchStationStateLoading;
}
