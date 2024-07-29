// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backlight.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Backlight {
  SysfsBacklight get sysfs => throw _privateConstructorUsedError;
  double get brightnessFraction => throw _privateConstructorUsedError;
  int get brightness => throw _privateConstructorUsedError;
  int get maxBrightness => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BacklightCopyWith<Backlight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BacklightCopyWith<$Res> {
  factory $BacklightCopyWith(Backlight value, $Res Function(Backlight) then) =
      _$BacklightCopyWithImpl<$Res, Backlight>;
  @useResult
  $Res call(
      {SysfsBacklight sysfs,
      double brightnessFraction,
      int brightness,
      int maxBrightness});
}

/// @nodoc
class _$BacklightCopyWithImpl<$Res, $Val extends Backlight>
    implements $BacklightCopyWith<$Res> {
  _$BacklightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sysfs = null,
    Object? brightnessFraction = null,
    Object? brightness = null,
    Object? maxBrightness = null,
  }) {
    return _then(_value.copyWith(
      sysfs: null == sysfs
          ? _value.sysfs
          : sysfs // ignore: cast_nullable_to_non_nullable
              as SysfsBacklight,
      brightnessFraction: null == brightnessFraction
          ? _value.brightnessFraction
          : brightnessFraction // ignore: cast_nullable_to_non_nullable
              as double,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as int,
      maxBrightness: null == maxBrightness
          ? _value.maxBrightness
          : maxBrightness // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BacklightImplCopyWith<$Res>
    implements $BacklightCopyWith<$Res> {
  factory _$$BacklightImplCopyWith(
          _$BacklightImpl value, $Res Function(_$BacklightImpl) then) =
      __$$BacklightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SysfsBacklight sysfs,
      double brightnessFraction,
      int brightness,
      int maxBrightness});
}

/// @nodoc
class __$$BacklightImplCopyWithImpl<$Res>
    extends _$BacklightCopyWithImpl<$Res, _$BacklightImpl>
    implements _$$BacklightImplCopyWith<$Res> {
  __$$BacklightImplCopyWithImpl(
      _$BacklightImpl _value, $Res Function(_$BacklightImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sysfs = null,
    Object? brightnessFraction = null,
    Object? brightness = null,
    Object? maxBrightness = null,
  }) {
    return _then(_$BacklightImpl(
      sysfs: null == sysfs
          ? _value.sysfs
          : sysfs // ignore: cast_nullable_to_non_nullable
              as SysfsBacklight,
      brightnessFraction: null == brightnessFraction
          ? _value.brightnessFraction
          : brightnessFraction // ignore: cast_nullable_to_non_nullable
              as double,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as int,
      maxBrightness: null == maxBrightness
          ? _value.maxBrightness
          : maxBrightness // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$BacklightImpl implements _Backlight {
  const _$BacklightImpl(
      {required this.sysfs,
      required this.brightnessFraction,
      required this.brightness,
      required this.maxBrightness});

  @override
  final SysfsBacklight sysfs;
  @override
  final double brightnessFraction;
  @override
  final int brightness;
  @override
  final int maxBrightness;

  @override
  String toString() {
    return 'Backlight(sysfs: $sysfs, brightnessFraction: $brightnessFraction, brightness: $brightness, maxBrightness: $maxBrightness)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BacklightImpl &&
            (identical(other.sysfs, sysfs) || other.sysfs == sysfs) &&
            (identical(other.brightnessFraction, brightnessFraction) ||
                other.brightnessFraction == brightnessFraction) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness) &&
            (identical(other.maxBrightness, maxBrightness) ||
                other.maxBrightness == maxBrightness));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, sysfs, brightnessFraction, brightness, maxBrightness);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BacklightImplCopyWith<_$BacklightImpl> get copyWith =>
      __$$BacklightImplCopyWithImpl<_$BacklightImpl>(this, _$identity);
}

abstract class _Backlight implements Backlight {
  const factory _Backlight(
      {required final SysfsBacklight sysfs,
      required final double brightnessFraction,
      required final int brightness,
      required final int maxBrightness}) = _$BacklightImpl;

  @override
  SysfsBacklight get sysfs;
  @override
  double get brightnessFraction;
  @override
  int get brightness;
  @override
  int get maxBrightness;
  @override
  @JsonKey(ignore: true)
  _$$BacklightImplCopyWith<_$BacklightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
