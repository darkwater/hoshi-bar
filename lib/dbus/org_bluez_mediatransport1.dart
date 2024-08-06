// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object dbus/org.bluez.MediaTransport1.xml

import 'dart:io';
import 'package:dbus/dbus.dart';

class OrgBluezMediaTransport1 extends DBusRemoteObject {
  OrgBluezMediaTransport1(
      DBusClient client, String destination, DBusObjectPath path)
      : super(client, name: destination, path: path);

  /// Gets org.bluez.MediaTransport1.Device
  Future<DBusObjectPath> getDevice() async {
    var value = await getProperty('org.bluez.MediaTransport1', 'Device',
        signature: DBusSignature('o'));
    return value.asObjectPath();
  }

  /// Gets org.bluez.MediaTransport1.UUID
  Future<String> getUUID() async {
    var value = await getProperty('org.bluez.MediaTransport1', 'UUID',
        signature: DBusSignature('s'));
    return value.asString();
  }

  /// Gets org.bluez.MediaTransport1.Codec
  Future<int> getCodec() async {
    var value = await getProperty('org.bluez.MediaTransport1', 'Codec',
        signature: DBusSignature('y'));
    return value.asByte();
  }

  /// Gets org.bluez.MediaTransport1.Configuration
  Future<List<int>> getConfiguration() async {
    var value = await getProperty('org.bluez.MediaTransport1', 'Configuration',
        signature: DBusSignature('ay'));
    return value.asByteArray().toList();
  }

  /// Gets org.bluez.MediaTransport1.State
  Future<String> getState() async {
    var value = await getProperty('org.bluez.MediaTransport1', 'State',
        signature: DBusSignature('s'));
    return value.asString();
  }

  /// Gets org.bluez.MediaTransport1.Delay
  Future<int> getDelay() async {
    var value = await getProperty('org.bluez.MediaTransport1', 'Delay',
        signature: DBusSignature('q'));
    return value.asUint16();
  }

  /// Gets org.bluez.MediaTransport1.Volume
  Future<int> getVolume() async {
    var value = await getProperty('org.bluez.MediaTransport1', 'Volume',
        signature: DBusSignature('q'));
    return value.asUint16();
  }

  /// Sets org.bluez.MediaTransport1.Volume
  Future<void> setVolume(int value) async {
    await setProperty('org.bluez.MediaTransport1', 'Volume', DBusUint16(value));
  }

  /// Invokes org.bluez.MediaTransport1.Acquire()
  Future<List<DBusValue>> callAcquire(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod('org.bluez.MediaTransport1', 'Acquire', [],
        replySignature: DBusSignature('hqq'),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues;
  }

  /// Invokes org.bluez.MediaTransport1.TryAcquire()
  Future<List<DBusValue>> callTryAcquire(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod('org.bluez.MediaTransport1', 'TryAcquire', [],
        replySignature: DBusSignature('hqq'),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues;
  }

  /// Invokes org.bluez.MediaTransport1.Release()
  Future<void> callRelease(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.MediaTransport1', 'Release', [],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }
}
