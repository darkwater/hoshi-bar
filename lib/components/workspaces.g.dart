// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspaces.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$hyprlandHash() => r'5442e3ac54c2ee93a2df363effcb8328379c56bf';

/// See also [hyprland].
@ProviderFor(hyprland)
final hyprlandProvider = FutureProvider<HyprlandIPC>.internal(
  hyprland,
  name: r'hyprlandProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$hyprlandHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HyprlandRef = FutureProviderRef<HyprlandIPC>;
String _$workspacesHash() => r'da11754cc0ed6dd12602a724b251789c165fd6ff';

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
