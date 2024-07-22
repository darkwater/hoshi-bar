// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspaces.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$hyprlandHash() => r'c48958c17a415ba0ccb578eddc27ec5585580aca';

/// See also [hyprland].
@ProviderFor(hyprland)
final hyprlandProvider = AutoDisposeFutureProvider<HyprlandIPC>.internal(
  hyprland,
  name: r'hyprlandProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$hyprlandHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HyprlandRef = AutoDisposeFutureProviderRef<HyprlandIPC>;
String _$workspacesHash() => r'8770d6fb27dfa1d62dde4de9d5cb959bface6cf6';

/// See also [workspaces].
@ProviderFor(workspaces)
final workspacesProvider = AutoDisposeStreamProvider<List<Workspace>>.internal(
  workspaces,
  name: r'workspacesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$workspacesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WorkspacesRef = AutoDisposeStreamProviderRef<List<Workspace>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
