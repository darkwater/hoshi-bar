// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$temperatureStreamHash() => r'9d322ceddd591a91f976e59a0cb970ee22961abc';

/// See also [temperatureStream].
@ProviderFor(temperatureStream)
final temperatureStreamProvider =
    AutoDisposeStreamProvider<Map<SysfsHwmon, List<Temperature>>>.internal(
  temperatureStream,
  name: r'temperatureStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$temperatureStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TemperatureStreamRef
    = AutoDisposeStreamProviderRef<Map<SysfsHwmon, List<Temperature>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
