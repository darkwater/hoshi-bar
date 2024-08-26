// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$temperatureStreamHash() => r'4c4cae6715107f85ba153442a963208edc130fe0';

/// See also [temperatureStream].
@ProviderFor(temperatureStream)
final temperatureStreamProvider =
    AutoDisposeStreamProvider<History<(SysfsHwmon, String), double>>.internal(
  temperatureStream,
  name: r'temperatureStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$temperatureStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TemperatureStreamRef
    = AutoDisposeStreamProviderRef<History<(SysfsHwmon, String), double>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
