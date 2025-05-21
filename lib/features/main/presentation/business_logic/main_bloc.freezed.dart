// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainEvent {
  String? get tab => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, String? tab) tabChanged,
    required TResult Function(String? tab) deepLinkReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index, String? tab)? tabChanged,
    TResult? Function(String? tab)? deepLinkReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, String? tab)? tabChanged,
    TResult Function(String? tab)? deepLinkReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MainTabChanged value) tabChanged,
    required TResult Function(MainDeepLinkReceived value) deepLinkReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MainTabChanged value)? tabChanged,
    TResult? Function(MainDeepLinkReceived value)? deepLinkReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MainTabChanged value)? tabChanged,
    TResult Function(MainDeepLinkReceived value)? deepLinkReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of MainEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MainEventCopyWith<MainEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainEventCopyWith<$Res> {
  factory $MainEventCopyWith(MainEvent value, $Res Function(MainEvent) then) =
      _$MainEventCopyWithImpl<$Res, MainEvent>;
  @useResult
  $Res call({String? tab});
}

/// @nodoc
class _$MainEventCopyWithImpl<$Res, $Val extends MainEvent>
    implements $MainEventCopyWith<$Res> {
  _$MainEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tab = freezed,
  }) {
    return _then(_value.copyWith(
      tab: freezed == tab
          ? _value.tab
          : tab // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainTabChangedImplCopyWith<$Res>
    implements $MainEventCopyWith<$Res> {
  factory _$$MainTabChangedImplCopyWith(_$MainTabChangedImpl value,
          $Res Function(_$MainTabChangedImpl) then) =
      __$$MainTabChangedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index, String? tab});
}

/// @nodoc
class __$$MainTabChangedImplCopyWithImpl<$Res>
    extends _$MainEventCopyWithImpl<$Res, _$MainTabChangedImpl>
    implements _$$MainTabChangedImplCopyWith<$Res> {
  __$$MainTabChangedImplCopyWithImpl(
      _$MainTabChangedImpl _value, $Res Function(_$MainTabChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? tab = freezed,
  }) {
    return _then(_$MainTabChangedImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      tab: freezed == tab
          ? _value.tab
          : tab // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MainTabChangedImpl implements MainTabChanged {
  const _$MainTabChangedImpl({required this.index, this.tab});

  @override
  final int index;
  @override
  final String? tab;

  @override
  String toString() {
    return 'MainEvent.tabChanged(index: $index, tab: $tab)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainTabChangedImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.tab, tab) || other.tab == tab));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, tab);

  /// Create a copy of MainEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MainTabChangedImplCopyWith<_$MainTabChangedImpl> get copyWith =>
      __$$MainTabChangedImplCopyWithImpl<_$MainTabChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, String? tab) tabChanged,
    required TResult Function(String? tab) deepLinkReceived,
  }) {
    return tabChanged(index, tab);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index, String? tab)? tabChanged,
    TResult? Function(String? tab)? deepLinkReceived,
  }) {
    return tabChanged?.call(index, tab);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, String? tab)? tabChanged,
    TResult Function(String? tab)? deepLinkReceived,
    required TResult orElse(),
  }) {
    if (tabChanged != null) {
      return tabChanged(index, tab);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MainTabChanged value) tabChanged,
    required TResult Function(MainDeepLinkReceived value) deepLinkReceived,
  }) {
    return tabChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MainTabChanged value)? tabChanged,
    TResult? Function(MainDeepLinkReceived value)? deepLinkReceived,
  }) {
    return tabChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MainTabChanged value)? tabChanged,
    TResult Function(MainDeepLinkReceived value)? deepLinkReceived,
    required TResult orElse(),
  }) {
    if (tabChanged != null) {
      return tabChanged(this);
    }
    return orElse();
  }
}

abstract class MainTabChanged implements MainEvent {
  const factory MainTabChanged({required final int index, final String? tab}) =
      _$MainTabChangedImpl;

  int get index;
  @override
  String? get tab;

  /// Create a copy of MainEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainTabChangedImplCopyWith<_$MainTabChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MainDeepLinkReceivedImplCopyWith<$Res>
    implements $MainEventCopyWith<$Res> {
  factory _$$MainDeepLinkReceivedImplCopyWith(_$MainDeepLinkReceivedImpl value,
          $Res Function(_$MainDeepLinkReceivedImpl) then) =
      __$$MainDeepLinkReceivedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? tab});
}

/// @nodoc
class __$$MainDeepLinkReceivedImplCopyWithImpl<$Res>
    extends _$MainEventCopyWithImpl<$Res, _$MainDeepLinkReceivedImpl>
    implements _$$MainDeepLinkReceivedImplCopyWith<$Res> {
  __$$MainDeepLinkReceivedImplCopyWithImpl(_$MainDeepLinkReceivedImpl _value,
      $Res Function(_$MainDeepLinkReceivedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tab = freezed,
  }) {
    return _then(_$MainDeepLinkReceivedImpl(
      tab: freezed == tab
          ? _value.tab
          : tab // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MainDeepLinkReceivedImpl implements MainDeepLinkReceived {
  const _$MainDeepLinkReceivedImpl({this.tab});

  @override
  final String? tab;

  @override
  String toString() {
    return 'MainEvent.deepLinkReceived(tab: $tab)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainDeepLinkReceivedImpl &&
            (identical(other.tab, tab) || other.tab == tab));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tab);

  /// Create a copy of MainEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MainDeepLinkReceivedImplCopyWith<_$MainDeepLinkReceivedImpl>
      get copyWith =>
          __$$MainDeepLinkReceivedImplCopyWithImpl<_$MainDeepLinkReceivedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, String? tab) tabChanged,
    required TResult Function(String? tab) deepLinkReceived,
  }) {
    return deepLinkReceived(tab);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index, String? tab)? tabChanged,
    TResult? Function(String? tab)? deepLinkReceived,
  }) {
    return deepLinkReceived?.call(tab);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, String? tab)? tabChanged,
    TResult Function(String? tab)? deepLinkReceived,
    required TResult orElse(),
  }) {
    if (deepLinkReceived != null) {
      return deepLinkReceived(tab);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MainTabChanged value) tabChanged,
    required TResult Function(MainDeepLinkReceived value) deepLinkReceived,
  }) {
    return deepLinkReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MainTabChanged value)? tabChanged,
    TResult? Function(MainDeepLinkReceived value)? deepLinkReceived,
  }) {
    return deepLinkReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MainTabChanged value)? tabChanged,
    TResult Function(MainDeepLinkReceived value)? deepLinkReceived,
    required TResult orElse(),
  }) {
    if (deepLinkReceived != null) {
      return deepLinkReceived(this);
    }
    return orElse();
  }
}

abstract class MainDeepLinkReceived implements MainEvent {
  const factory MainDeepLinkReceived({final String? tab}) =
      _$MainDeepLinkReceivedImpl;

  @override
  String? get tab;

  /// Create a copy of MainEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainDeepLinkReceivedImplCopyWith<_$MainDeepLinkReceivedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MainState {
  int get selectedIndex => throw _privateConstructorUsedError;
  String? get currentTab => throw _privateConstructorUsedError;

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MainStateCopyWith<MainState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res, MainState>;
  @useResult
  $Res call({int selectedIndex, String? currentTab});
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res, $Val extends MainState>
    implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = null,
    Object? currentTab = freezed,
  }) {
    return _then(_value.copyWith(
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentTab: freezed == currentTab
          ? _value.currentTab
          : currentTab // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainStateImplCopyWith<$Res>
    implements $MainStateCopyWith<$Res> {
  factory _$$MainStateImplCopyWith(
          _$MainStateImpl value, $Res Function(_$MainStateImpl) then) =
      __$$MainStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int selectedIndex, String? currentTab});
}

/// @nodoc
class __$$MainStateImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$MainStateImpl>
    implements _$$MainStateImplCopyWith<$Res> {
  __$$MainStateImplCopyWithImpl(
      _$MainStateImpl _value, $Res Function(_$MainStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = null,
    Object? currentTab = freezed,
  }) {
    return _then(_$MainStateImpl(
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentTab: freezed == currentTab
          ? _value.currentTab
          : currentTab // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MainStateImpl implements _MainState {
  const _$MainStateImpl({this.selectedIndex = 0, this.currentTab});

  @override
  @JsonKey()
  final int selectedIndex;
  @override
  final String? currentTab;

  @override
  String toString() {
    return 'MainState(selectedIndex: $selectedIndex, currentTab: $currentTab)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainStateImpl &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.currentTab, currentTab) ||
                other.currentTab == currentTab));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedIndex, currentTab);

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      __$$MainStateImplCopyWithImpl<_$MainStateImpl>(this, _$identity);
}

abstract class _MainState implements MainState {
  const factory _MainState(
      {final int selectedIndex, final String? currentTab}) = _$MainStateImpl;

  @override
  int get selectedIndex;
  @override
  String? get currentTab;

  /// Create a copy of MainState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
