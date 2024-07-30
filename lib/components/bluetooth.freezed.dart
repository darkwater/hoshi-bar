// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bluetooth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Bluetooth {
  List<BluetoothAdapter> get adapters => throw _privateConstructorUsedError;
  List<BluetoothDevice> get devices => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BluetoothCopyWith<Bluetooth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BluetoothCopyWith<$Res> {
  factory $BluetoothCopyWith(Bluetooth value, $Res Function(Bluetooth) then) =
      _$BluetoothCopyWithImpl<$Res, Bluetooth>;
  @useResult
  $Res call({List<BluetoothAdapter> adapters, List<BluetoothDevice> devices});
}

/// @nodoc
class _$BluetoothCopyWithImpl<$Res, $Val extends Bluetooth>
    implements $BluetoothCopyWith<$Res> {
  _$BluetoothCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adapters = null,
    Object? devices = null,
  }) {
    return _then(_value.copyWith(
      adapters: null == adapters
          ? _value.adapters
          : adapters // ignore: cast_nullable_to_non_nullable
              as List<BluetoothAdapter>,
      devices: null == devices
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<BluetoothDevice>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BluetoothImplCopyWith<$Res>
    implements $BluetoothCopyWith<$Res> {
  factory _$$BluetoothImplCopyWith(
          _$BluetoothImpl value, $Res Function(_$BluetoothImpl) then) =
      __$$BluetoothImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BluetoothAdapter> adapters, List<BluetoothDevice> devices});
}

/// @nodoc
class __$$BluetoothImplCopyWithImpl<$Res>
    extends _$BluetoothCopyWithImpl<$Res, _$BluetoothImpl>
    implements _$$BluetoothImplCopyWith<$Res> {
  __$$BluetoothImplCopyWithImpl(
      _$BluetoothImpl _value, $Res Function(_$BluetoothImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adapters = null,
    Object? devices = null,
  }) {
    return _then(_$BluetoothImpl(
      adapters: null == adapters
          ? _value._adapters
          : adapters // ignore: cast_nullable_to_non_nullable
              as List<BluetoothAdapter>,
      devices: null == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<BluetoothDevice>,
    ));
  }
}

/// @nodoc

class _$BluetoothImpl extends _Bluetooth {
  const _$BluetoothImpl(
      {required final List<BluetoothAdapter> adapters,
      required final List<BluetoothDevice> devices})
      : _adapters = adapters,
        _devices = devices,
        super._();

  final List<BluetoothAdapter> _adapters;
  @override
  List<BluetoothAdapter> get adapters {
    if (_adapters is EqualUnmodifiableListView) return _adapters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_adapters);
  }

  final List<BluetoothDevice> _devices;
  @override
  List<BluetoothDevice> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  String toString() {
    return 'Bluetooth(adapters: $adapters, devices: $devices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BluetoothImpl &&
            const DeepCollectionEquality().equals(other._adapters, _adapters) &&
            const DeepCollectionEquality().equals(other._devices, _devices));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_adapters),
      const DeepCollectionEquality().hash(_devices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BluetoothImplCopyWith<_$BluetoothImpl> get copyWith =>
      __$$BluetoothImplCopyWithImpl<_$BluetoothImpl>(this, _$identity);
}

abstract class _Bluetooth extends Bluetooth {
  const factory _Bluetooth(
      {required final List<BluetoothAdapter> adapters,
      required final List<BluetoothDevice> devices}) = _$BluetoothImpl;
  const _Bluetooth._() : super._();

  @override
  List<BluetoothAdapter> get adapters;
  @override
  List<BluetoothDevice> get devices;
  @override
  @JsonKey(ignore: true)
  _$$BluetoothImplCopyWith<_$BluetoothImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BluetoothAdapter {
  DBusObjectPath get objectPath => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get powered => throw _privateConstructorUsedError;
  bool get discoverable => throw _privateConstructorUsedError;
  bool get discovering => throw _privateConstructorUsedError;
  bool get pairable => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BluetoothAdapterCopyWith<BluetoothAdapter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BluetoothAdapterCopyWith<$Res> {
  factory $BluetoothAdapterCopyWith(
          BluetoothAdapter value, $Res Function(BluetoothAdapter) then) =
      _$BluetoothAdapterCopyWithImpl<$Res, BluetoothAdapter>;
  @useResult
  $Res call(
      {DBusObjectPath objectPath,
      String address,
      String name,
      bool powered,
      bool discoverable,
      bool discovering,
      bool pairable});
}

/// @nodoc
class _$BluetoothAdapterCopyWithImpl<$Res, $Val extends BluetoothAdapter>
    implements $BluetoothAdapterCopyWith<$Res> {
  _$BluetoothAdapterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectPath = null,
    Object? address = null,
    Object? name = null,
    Object? powered = null,
    Object? discoverable = null,
    Object? discovering = null,
    Object? pairable = null,
  }) {
    return _then(_value.copyWith(
      objectPath: null == objectPath
          ? _value.objectPath
          : objectPath // ignore: cast_nullable_to_non_nullable
              as DBusObjectPath,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      powered: null == powered
          ? _value.powered
          : powered // ignore: cast_nullable_to_non_nullable
              as bool,
      discoverable: null == discoverable
          ? _value.discoverable
          : discoverable // ignore: cast_nullable_to_non_nullable
              as bool,
      discovering: null == discovering
          ? _value.discovering
          : discovering // ignore: cast_nullable_to_non_nullable
              as bool,
      pairable: null == pairable
          ? _value.pairable
          : pairable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BluetoothAdapterImplCopyWith<$Res>
    implements $BluetoothAdapterCopyWith<$Res> {
  factory _$$BluetoothAdapterImplCopyWith(_$BluetoothAdapterImpl value,
          $Res Function(_$BluetoothAdapterImpl) then) =
      __$$BluetoothAdapterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DBusObjectPath objectPath,
      String address,
      String name,
      bool powered,
      bool discoverable,
      bool discovering,
      bool pairable});
}

/// @nodoc
class __$$BluetoothAdapterImplCopyWithImpl<$Res>
    extends _$BluetoothAdapterCopyWithImpl<$Res, _$BluetoothAdapterImpl>
    implements _$$BluetoothAdapterImplCopyWith<$Res> {
  __$$BluetoothAdapterImplCopyWithImpl(_$BluetoothAdapterImpl _value,
      $Res Function(_$BluetoothAdapterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectPath = null,
    Object? address = null,
    Object? name = null,
    Object? powered = null,
    Object? discoverable = null,
    Object? discovering = null,
    Object? pairable = null,
  }) {
    return _then(_$BluetoothAdapterImpl(
      objectPath: null == objectPath
          ? _value.objectPath
          : objectPath // ignore: cast_nullable_to_non_nullable
              as DBusObjectPath,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      powered: null == powered
          ? _value.powered
          : powered // ignore: cast_nullable_to_non_nullable
              as bool,
      discoverable: null == discoverable
          ? _value.discoverable
          : discoverable // ignore: cast_nullable_to_non_nullable
              as bool,
      discovering: null == discovering
          ? _value.discovering
          : discovering // ignore: cast_nullable_to_non_nullable
              as bool,
      pairable: null == pairable
          ? _value.pairable
          : pairable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BluetoothAdapterImpl extends _BluetoothAdapter {
  const _$BluetoothAdapterImpl(
      {required this.objectPath,
      required this.address,
      required this.name,
      required this.powered,
      required this.discoverable,
      required this.discovering,
      required this.pairable})
      : super._();

  @override
  final DBusObjectPath objectPath;
  @override
  final String address;
  @override
  final String name;
  @override
  final bool powered;
  @override
  final bool discoverable;
  @override
  final bool discovering;
  @override
  final bool pairable;

  @override
  String toString() {
    return 'BluetoothAdapter(objectPath: $objectPath, address: $address, name: $name, powered: $powered, discoverable: $discoverable, discovering: $discovering, pairable: $pairable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BluetoothAdapterImpl &&
            (identical(other.objectPath, objectPath) ||
                other.objectPath == objectPath) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.powered, powered) || other.powered == powered) &&
            (identical(other.discoverable, discoverable) ||
                other.discoverable == discoverable) &&
            (identical(other.discovering, discovering) ||
                other.discovering == discovering) &&
            (identical(other.pairable, pairable) ||
                other.pairable == pairable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, objectPath, address, name,
      powered, discoverable, discovering, pairable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BluetoothAdapterImplCopyWith<_$BluetoothAdapterImpl> get copyWith =>
      __$$BluetoothAdapterImplCopyWithImpl<_$BluetoothAdapterImpl>(
          this, _$identity);
}

abstract class _BluetoothAdapter extends BluetoothAdapter {
  const factory _BluetoothAdapter(
      {required final DBusObjectPath objectPath,
      required final String address,
      required final String name,
      required final bool powered,
      required final bool discoverable,
      required final bool discovering,
      required final bool pairable}) = _$BluetoothAdapterImpl;
  const _BluetoothAdapter._() : super._();

  @override
  DBusObjectPath get objectPath;
  @override
  String get address;
  @override
  String get name;
  @override
  bool get powered;
  @override
  bool get discoverable;
  @override
  bool get discovering;
  @override
  bool get pairable;
  @override
  @JsonKey(ignore: true)
  _$$BluetoothAdapterImplCopyWith<_$BluetoothAdapterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BluetoothDevice {
  DBusObjectPath get objectPath => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  bool get paired => throw _privateConstructorUsedError;
  bool get connected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BluetoothDeviceCopyWith<BluetoothDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BluetoothDeviceCopyWith<$Res> {
  factory $BluetoothDeviceCopyWith(
          BluetoothDevice value, $Res Function(BluetoothDevice) then) =
      _$BluetoothDeviceCopyWithImpl<$Res, BluetoothDevice>;
  @useResult
  $Res call(
      {DBusObjectPath objectPath,
      String address,
      String name,
      String? icon,
      bool paired,
      bool connected});
}

/// @nodoc
class _$BluetoothDeviceCopyWithImpl<$Res, $Val extends BluetoothDevice>
    implements $BluetoothDeviceCopyWith<$Res> {
  _$BluetoothDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectPath = null,
    Object? address = null,
    Object? name = null,
    Object? icon = freezed,
    Object? paired = null,
    Object? connected = null,
  }) {
    return _then(_value.copyWith(
      objectPath: null == objectPath
          ? _value.objectPath
          : objectPath // ignore: cast_nullable_to_non_nullable
              as DBusObjectPath,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      paired: null == paired
          ? _value.paired
          : paired // ignore: cast_nullable_to_non_nullable
              as bool,
      connected: null == connected
          ? _value.connected
          : connected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BluetoothDeviceImplCopyWith<$Res>
    implements $BluetoothDeviceCopyWith<$Res> {
  factory _$$BluetoothDeviceImplCopyWith(_$BluetoothDeviceImpl value,
          $Res Function(_$BluetoothDeviceImpl) then) =
      __$$BluetoothDeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DBusObjectPath objectPath,
      String address,
      String name,
      String? icon,
      bool paired,
      bool connected});
}

/// @nodoc
class __$$BluetoothDeviceImplCopyWithImpl<$Res>
    extends _$BluetoothDeviceCopyWithImpl<$Res, _$BluetoothDeviceImpl>
    implements _$$BluetoothDeviceImplCopyWith<$Res> {
  __$$BluetoothDeviceImplCopyWithImpl(
      _$BluetoothDeviceImpl _value, $Res Function(_$BluetoothDeviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectPath = null,
    Object? address = null,
    Object? name = null,
    Object? icon = freezed,
    Object? paired = null,
    Object? connected = null,
  }) {
    return _then(_$BluetoothDeviceImpl(
      objectPath: null == objectPath
          ? _value.objectPath
          : objectPath // ignore: cast_nullable_to_non_nullable
              as DBusObjectPath,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      paired: null == paired
          ? _value.paired
          : paired // ignore: cast_nullable_to_non_nullable
              as bool,
      connected: null == connected
          ? _value.connected
          : connected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BluetoothDeviceImpl extends _BluetoothDevice {
  const _$BluetoothDeviceImpl(
      {required this.objectPath,
      required this.address,
      required this.name,
      required this.icon,
      required this.paired,
      required this.connected})
      : super._();

  @override
  final DBusObjectPath objectPath;
  @override
  final String address;
  @override
  final String name;
  @override
  final String? icon;
  @override
  final bool paired;
  @override
  final bool connected;

  @override
  String toString() {
    return 'BluetoothDevice(objectPath: $objectPath, address: $address, name: $name, icon: $icon, paired: $paired, connected: $connected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BluetoothDeviceImpl &&
            (identical(other.objectPath, objectPath) ||
                other.objectPath == objectPath) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.paired, paired) || other.paired == paired) &&
            (identical(other.connected, connected) ||
                other.connected == connected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, objectPath, address, name, icon, paired, connected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BluetoothDeviceImplCopyWith<_$BluetoothDeviceImpl> get copyWith =>
      __$$BluetoothDeviceImplCopyWithImpl<_$BluetoothDeviceImpl>(
          this, _$identity);
}

abstract class _BluetoothDevice extends BluetoothDevice {
  const factory _BluetoothDevice(
      {required final DBusObjectPath objectPath,
      required final String address,
      required final String name,
      required final String? icon,
      required final bool paired,
      required final bool connected}) = _$BluetoothDeviceImpl;
  const _BluetoothDevice._() : super._();

  @override
  DBusObjectPath get objectPath;
  @override
  String get address;
  @override
  String get name;
  @override
  String? get icon;
  @override
  bool get paired;
  @override
  bool get connected;
  @override
  @JsonKey(ignore: true)
  _$$BluetoothDeviceImplCopyWith<_$BluetoothDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
