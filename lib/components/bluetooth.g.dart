// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bluetooth.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bluetoothStreamHash() => r'90fdf4b525cb2917c5c6109ba354f4edf388f9ca';

/// See also [bluetoothStream].
@ProviderFor(bluetoothStream)
final bluetoothStreamProvider = AutoDisposeStreamProvider<Bluetooth>.internal(
  bluetoothStream,
  name: r'bluetoothStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$bluetoothStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BluetoothStreamRef = AutoDisposeStreamProviderRef<Bluetooth>;
String _$pairedDevicesHash() => r'44ab21e0ba936e2e7076127be6eb26790a52faa1';

/// See also [pairedDevices].
@ProviderFor(pairedDevices)
final pairedDevicesProvider =
    AutoDisposeProvider<List<BluetoothDevice>>.internal(
  pairedDevices,
  name: r'pairedDevicesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pairedDevicesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PairedDevicesRef = AutoDisposeProviderRef<List<BluetoothDevice>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
