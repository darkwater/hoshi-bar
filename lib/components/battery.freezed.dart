// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Battery {
  String get id => throw _privateConstructorUsedError;
  double get capacity => throw _privateConstructorUsedError;
  SysfsPowerSupplyStatus get status => throw _privateConstructorUsedError;
  bool get hid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BatteryCopyWith<Battery> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatteryCopyWith<$Res> {
  factory $BatteryCopyWith(Battery value, $Res Function(Battery) then) =
      _$BatteryCopyWithImpl<$Res, Battery>;
  @useResult
  $Res call(
      {String id, double capacity, SysfsPowerSupplyStatus status, bool hid});
}

/// @nodoc
class _$BatteryCopyWithImpl<$Res, $Val extends Battery>
    implements $BatteryCopyWith<$Res> {
  _$BatteryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? capacity = null,
    Object? status = null,
    Object? hid = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SysfsPowerSupplyStatus,
      hid: null == hid
          ? _value.hid
          : hid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BatteryImplCopyWith<$Res> implements $BatteryCopyWith<$Res> {
  factory _$$BatteryImplCopyWith(
          _$BatteryImpl value, $Res Function(_$BatteryImpl) then) =
      __$$BatteryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, double capacity, SysfsPowerSupplyStatus status, bool hid});
}

/// @nodoc
class __$$BatteryImplCopyWithImpl<$Res>
    extends _$BatteryCopyWithImpl<$Res, _$BatteryImpl>
    implements _$$BatteryImplCopyWith<$Res> {
  __$$BatteryImplCopyWithImpl(
      _$BatteryImpl _value, $Res Function(_$BatteryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? capacity = null,
    Object? status = null,
    Object? hid = null,
  }) {
    return _then(_$BatteryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SysfsPowerSupplyStatus,
      hid: null == hid
          ? _value.hid
          : hid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BatteryImpl implements _Battery {
  const _$BatteryImpl(
      {required this.id,
      required this.capacity,
      required this.status,
      required this.hid});

  @override
  final String id;
  @override
  final double capacity;
  @override
  final SysfsPowerSupplyStatus status;
  @override
  final bool hid;

  @override
  String toString() {
    return 'Battery(id: $id, capacity: $capacity, status: $status, hid: $hid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BatteryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.hid, hid) || other.hid == hid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, capacity, status, hid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BatteryImplCopyWith<_$BatteryImpl> get copyWith =>
      __$$BatteryImplCopyWithImpl<_$BatteryImpl>(this, _$identity);
}

abstract class _Battery implements Battery {
  const factory _Battery(
      {required final String id,
      required final double capacity,
      required final SysfsPowerSupplyStatus status,
      required final bool hid}) = _$BatteryImpl;

  @override
  String get id;
  @override
  double get capacity;
  @override
  SysfsPowerSupplyStatus get status;
  @override
  bool get hid;
  @override
  @JsonKey(ignore: true)
  _$$BatteryImplCopyWith<_$BatteryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
