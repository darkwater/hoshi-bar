// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bluetooth.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bluetoothStreamHash() => r'd6da726e68cf0d8bc9b69591a43893c0189c2a62';

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
