// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loadavg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoadAvg {
  double get min1 => throw _privateConstructorUsedError;
  double get min5 => throw _privateConstructorUsedError;
  double get min15 => throw _privateConstructorUsedError;
  int get running => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get pid => throw _privateConstructorUsedError;
  int get numCpu => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoadAvgCopyWith<LoadAvg> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadAvgCopyWith<$Res> {
  factory $LoadAvgCopyWith(LoadAvg value, $Res Function(LoadAvg) then) =
      _$LoadAvgCopyWithImpl<$Res, LoadAvg>;
  @useResult
  $Res call(
      {double min1,
      double min5,
      double min15,
      int running,
      int total,
      int pid,
      int numCpu});
}

/// @nodoc
class _$LoadAvgCopyWithImpl<$Res, $Val extends LoadAvg>
    implements $LoadAvgCopyWith<$Res> {
  _$LoadAvgCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min1 = null,
    Object? min5 = null,
    Object? min15 = null,
    Object? running = null,
    Object? total = null,
    Object? pid = null,
    Object? numCpu = null,
  }) {
    return _then(_value.copyWith(
      min1: null == min1
          ? _value.min1
          : min1 // ignore: cast_nullable_to_non_nullable
              as double,
      min5: null == min5
          ? _value.min5
          : min5 // ignore: cast_nullable_to_non_nullable
              as double,
      min15: null == min15
          ? _value.min15
          : min15 // ignore: cast_nullable_to_non_nullable
              as double,
      running: null == running
          ? _value.running
          : running // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      pid: null == pid
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as int,
      numCpu: null == numCpu
          ? _value.numCpu
          : numCpu // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadAvgImplCopyWith<$Res> implements $LoadAvgCopyWith<$Res> {
  factory _$$LoadAvgImplCopyWith(
          _$LoadAvgImpl value, $Res Function(_$LoadAvgImpl) then) =
      __$$LoadAvgImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double min1,
      double min5,
      double min15,
      int running,
      int total,
      int pid,
      int numCpu});
}

/// @nodoc
class __$$LoadAvgImplCopyWithImpl<$Res>
    extends _$LoadAvgCopyWithImpl<$Res, _$LoadAvgImpl>
    implements _$$LoadAvgImplCopyWith<$Res> {
  __$$LoadAvgImplCopyWithImpl(
      _$LoadAvgImpl _value, $Res Function(_$LoadAvgImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? min1 = null,
    Object? min5 = null,
    Object? min15 = null,
    Object? running = null,
    Object? total = null,
    Object? pid = null,
    Object? numCpu = null,
  }) {
    return _then(_$LoadAvgImpl(
      min1: null == min1
          ? _value.min1
          : min1 // ignore: cast_nullable_to_non_nullable
              as double,
      min5: null == min5
          ? _value.min5
          : min5 // ignore: cast_nullable_to_non_nullable
              as double,
      min15: null == min15
          ? _value.min15
          : min15 // ignore: cast_nullable_to_non_nullable
              as double,
      running: null == running
          ? _value.running
          : running // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      pid: null == pid
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as int,
      numCpu: null == numCpu
          ? _value.numCpu
          : numCpu // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadAvgImpl implements _LoadAvg {
  const _$LoadAvgImpl(
      {required this.min1,
      required this.min5,
      required this.min15,
      required this.running,
      required this.total,
      required this.pid,
      required this.numCpu});

  @override
  final double min1;
  @override
  final double min5;
  @override
  final double min15;
  @override
  final int running;
  @override
  final int total;
  @override
  final int pid;
  @override
  final int numCpu;

  @override
  String toString() {
    return 'LoadAvg(min1: $min1, min5: $min5, min15: $min15, running: $running, total: $total, pid: $pid, numCpu: $numCpu)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadAvgImpl &&
            (identical(other.min1, min1) || other.min1 == min1) &&
            (identical(other.min5, min5) || other.min5 == min5) &&
            (identical(other.min15, min15) || other.min15 == min15) &&
            (identical(other.running, running) || other.running == running) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.pid, pid) || other.pid == pid) &&
            (identical(other.numCpu, numCpu) || other.numCpu == numCpu));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, min1, min5, min15, running, total, pid, numCpu);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadAvgImplCopyWith<_$LoadAvgImpl> get copyWith =>
      __$$LoadAvgImplCopyWithImpl<_$LoadAvgImpl>(this, _$identity);
}

abstract class _LoadAvg implements LoadAvg {
  const factory _LoadAvg(
      {required final double min1,
      required final double min5,
      required final double min15,
      required final int running,
      required final int total,
      required final int pid,
      required final int numCpu}) = _$LoadAvgImpl;

  @override
  double get min1;
  @override
  double get min5;
  @override
  double get min15;
  @override
  int get running;
  @override
  int get total;
  @override
  int get pid;
  @override
  int get numCpu;
  @override
  @JsonKey(ignore: true)
  _$$LoadAvgImplCopyWith<_$LoadAvgImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
