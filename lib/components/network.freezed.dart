// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NetworkUsage {
  String get id => throw _privateConstructorUsedError;
  int get upBytes => throw _privateConstructorUsedError;
  int get downBytes => throw _privateConstructorUsedError;
  double get upRate => throw _privateConstructorUsedError;
  double get downRate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NetworkUsageCopyWith<NetworkUsage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkUsageCopyWith<$Res> {
  factory $NetworkUsageCopyWith(
          NetworkUsage value, $Res Function(NetworkUsage) then) =
      _$NetworkUsageCopyWithImpl<$Res, NetworkUsage>;
  @useResult
  $Res call(
      {String id, int upBytes, int downBytes, double upRate, double downRate});
}

/// @nodoc
class _$NetworkUsageCopyWithImpl<$Res, $Val extends NetworkUsage>
    implements $NetworkUsageCopyWith<$Res> {
  _$NetworkUsageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? upBytes = null,
    Object? downBytes = null,
    Object? upRate = null,
    Object? downRate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      upBytes: null == upBytes
          ? _value.upBytes
          : upBytes // ignore: cast_nullable_to_non_nullable
              as int,
      downBytes: null == downBytes
          ? _value.downBytes
          : downBytes // ignore: cast_nullable_to_non_nullable
              as int,
      upRate: null == upRate
          ? _value.upRate
          : upRate // ignore: cast_nullable_to_non_nullable
              as double,
      downRate: null == downRate
          ? _value.downRate
          : downRate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NetworkUsageImplCopyWith<$Res>
    implements $NetworkUsageCopyWith<$Res> {
  factory _$$NetworkUsageImplCopyWith(
          _$NetworkUsageImpl value, $Res Function(_$NetworkUsageImpl) then) =
      __$$NetworkUsageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, int upBytes, int downBytes, double upRate, double downRate});
}

/// @nodoc
class __$$NetworkUsageImplCopyWithImpl<$Res>
    extends _$NetworkUsageCopyWithImpl<$Res, _$NetworkUsageImpl>
    implements _$$NetworkUsageImplCopyWith<$Res> {
  __$$NetworkUsageImplCopyWithImpl(
      _$NetworkUsageImpl _value, $Res Function(_$NetworkUsageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? upBytes = null,
    Object? downBytes = null,
    Object? upRate = null,
    Object? downRate = null,
  }) {
    return _then(_$NetworkUsageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      upBytes: null == upBytes
          ? _value.upBytes
          : upBytes // ignore: cast_nullable_to_non_nullable
              as int,
      downBytes: null == downBytes
          ? _value.downBytes
          : downBytes // ignore: cast_nullable_to_non_nullable
              as int,
      upRate: null == upRate
          ? _value.upRate
          : upRate // ignore: cast_nullable_to_non_nullable
              as double,
      downRate: null == downRate
          ? _value.downRate
          : downRate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$NetworkUsageImpl extends _NetworkUsage {
  const _$NetworkUsageImpl(
      {required this.id,
      required this.upBytes,
      required this.downBytes,
      required this.upRate,
      required this.downRate})
      : super._();

  @override
  final String id;
  @override
  final int upBytes;
  @override
  final int downBytes;
  @override
  final double upRate;
  @override
  final double downRate;

  @override
  String toString() {
    return 'NetworkUsage(id: $id, upBytes: $upBytes, downBytes: $downBytes, upRate: $upRate, downRate: $downRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkUsageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.upBytes, upBytes) || other.upBytes == upBytes) &&
            (identical(other.downBytes, downBytes) ||
                other.downBytes == downBytes) &&
            (identical(other.upRate, upRate) || other.upRate == upRate) &&
            (identical(other.downRate, downRate) ||
                other.downRate == downRate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, upBytes, downBytes, upRate, downRate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkUsageImplCopyWith<_$NetworkUsageImpl> get copyWith =>
      __$$NetworkUsageImplCopyWithImpl<_$NetworkUsageImpl>(this, _$identity);
}

abstract class _NetworkUsage extends NetworkUsage {
  const factory _NetworkUsage(
      {required final String id,
      required final int upBytes,
      required final int downBytes,
      required final double upRate,
      required final double downRate}) = _$NetworkUsageImpl;
  const _NetworkUsage._() : super._();

  @override
  String get id;
  @override
  int get upBytes;
  @override
  int get downBytes;
  @override
  double get upRate;
  @override
  double get downRate;
  @override
  @JsonKey(ignore: true)
  _$$NetworkUsageImplCopyWith<_$NetworkUsageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
