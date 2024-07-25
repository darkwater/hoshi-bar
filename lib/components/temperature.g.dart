// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$temperatureStreamHash() => r'301431a7df95ab77717d45c08bf597bc9e0887c2';

/// See also [temperatureStream].
@ProviderFor(temperatureStream)
final temperatureStreamProvider =
    AutoDisposeStreamProvider<History<SysfsHwmon, double>>.internal(
  temperatureStream,
  name: r'temperatureStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$temperatureStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TemperatureStreamRef
    = AutoDisposeStreamProviderRef<History<SysfsHwmon, double>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
