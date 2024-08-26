import 'package:dbus/dbus.dart';
import 'package:fdls/constants.dart';
import 'package:fdls/dbus/org_bluez_device1.dart';
import 'package:fdls/dbus/org_freedesktop_dbus_objectmanager.dart';
import 'package:fdls/widgets/component.dart';
import 'package:fdls/widgets/component_hover_popup.dart';
import 'package:fdls/widgets/two_row.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bluetooth.g.dart';
part 'bluetooth.freezed.dart';

final dbusSystemProvider = Provider((ref) => DBusClient.system());

@riverpod
Stream<Bluetooth> bluetoothStream(BluetoothStreamRef ref) async* {
  final dbus = ref.read(dbusSystemProvider);

  final bluez = OrgFreedesktopDBusObjectManager(
    dbus,
    "org.bluez",
    DBusObjectPath.root,
  );

  while (true) {
    try {
      final objects = await bluez.callGetManagedObjects();

      yield Bluetooth(
        adapters: objects.entries
            .where((e) => e.value.containsKey("org.bluez.Adapter1"))
            .map((e) {
          final properties = e.value["org.bluez.Adapter1"]!;

          return BluetoothAdapter(
            objectPath: e.key,
            address: properties["Address"]!.asString(),
            name: properties["Name"]!.asString(),
            powered: properties["Powered"]!.asBoolean(),
            discoverable: properties["Discoverable"]!.asBoolean(),
            discovering: properties["Discovering"]!.asBoolean(),
            pairable: properties["Pairable"]!.asBoolean(),
          );
        }).toList(),
        devices: objects.entries
            .where((e) => e.value.containsKey("org.bluez.Device1"))
            .map((e) {
          final properties = e.value["org.bluez.Device1"]!;

          return BluetoothDevice(
            objectPath: e.key,
            address: properties["Address"]!.asString(),
            name: properties["Name"]?.asString(),
            icon: properties["Icon"]?.asString(),
            paired: properties["Paired"]!.asBoolean(),
            connected: properties["Connected"]!.asBoolean(),
          );
        }).toList(),
      );
    } catch (e) {
      print(e);
    }

    await Future.delayed(fdlsUpdateFrequency);
  }
}

@riverpod
List<BluetoothDevice> pairedDevices(PairedDevicesRef ref) {
  final devices = ref.watch(bluetoothStreamProvider).value?.devices ?? [];
  return devices.where((d) => d.paired).toList();
}

class BluetoothComponent extends ConsumerWidget {
  const BluetoothComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bluetooth = ref.watch(bluetoothStreamProvider);

    return Component.asyncValue(
      primaryColor: Colors.blue,
      width: fdlsSmallComponentWidth,
      value: bluetooth,
      popup: const BluetoothHover(),
      builder: (context, history) {
        return Stack(
          children: [
            Positioned.fill(
              child: TwoRow(
                icon: const Icon(Icons.bluetooth),
                top: Text(
                  history.devices.where((d) => d.connected).length.toString(),
                ),
                bottom: const SizedBox(),
              ),
            ),
          ],
        );
      },
    );
  }
}

class BluetoothHover extends ConsumerWidget {
  const BluetoothHover({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bluetooth = ref.watch(pairedDevicesProvider);

    return ComponentHoverPopup(
      icon: Icons.bluetooth,
      title: "Bluetooth",
      body: ListView.builder(
        primary: true,
        itemCount: bluetooth.length,
        itemBuilder: (context, index) {
          final device = bluetooth[index];

          return ListTile(
            leading: Icon(device.iconData),
            title: Text(device.name ?? device.address),
            trailing: IconButton(
              icon: Icon(
                device.connected ? Icons.link_off : Icons.link,
              ),
              onPressed: () async {
                final dev = OrgBluezDevice1(
                  ref.read(dbusSystemProvider),
                  "org.bluez",
                  device.objectPath,
                );

                if (device.connected) {
                  await dev.callDisconnect();
                } else {
                  await dev.callConnect();
                }
              },
            ),
          );
        },
      ),
    );
  }
}

@freezed
class Bluetooth with _$Bluetooth {
  const Bluetooth._();

  const factory Bluetooth({
    required List<BluetoothAdapter> adapters,
    required List<BluetoothDevice> devices,
  }) = _Bluetooth;
}

@freezed
class BluetoothAdapter with _$BluetoothAdapter {
  const BluetoothAdapter._();

  const factory BluetoothAdapter({
    required DBusObjectPath objectPath,
    required String address,
    required String name,
    required bool powered,
    required bool discoverable,
    required bool discovering,
    required bool pairable,
  }) = _BluetoothAdapter;
}

@freezed
class BluetoothDevice with _$BluetoothDevice {
  const BluetoothDevice._();

  const factory BluetoothDevice({
    required DBusObjectPath objectPath,
    required String address,
    required String? name,
    required String? icon,
    required bool paired,
    required bool connected,
  }) = _BluetoothDevice;

  IconData get iconData => switch (icon) {
        "audio-card" => Icons.audiotrack,
        "audio-headphones" => Icons.headphones,
        "audio-headset" => Icons.headset,
        "audio-speaker" => Icons.speaker,
        "audio-x-generic" => Icons.audiotrack,
        "input-keyboard" => Icons.keyboard,
        "input-mouse" => Icons.mouse,
        "input-gaming" => Icons.videogame_asset,
        "input-tablet" => Icons.tablet,
        "input-touchpad" => Icons.touch_app,
        "input-touchscreen" => Icons.touch_app,
        "phone" => Icons.phone,
        "phone-mobile" => Icons.phone_android,
        "phone-smartphone" => Icons.phone_android,
        "phone-x-generic" => Icons.phone,
        "video-display" => Icons.tv,
        _ => Icons.bluetooth,
      };
}
