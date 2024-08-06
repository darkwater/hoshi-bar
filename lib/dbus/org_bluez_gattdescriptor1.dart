// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object dbus/org.bluez.GattDescriptor1.xml

import 'dart:io';
import 'package:dbus/dbus.dart';

class OrgBluezGattDescriptor1 extends DBusRemoteObject {
  OrgBluezGattDescriptor1(
      DBusClient client, String destination, DBusObjectPath path)
      : super(client, name: destination, path: path);

  /// Invokes org.bluez.GattDescriptor1.ReadValue()
  Future<List<int>> callReadValue(Map<String, DBusValue> options,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod('org.bluez.GattDescriptor1', 'ReadValue',
        [DBusDict.stringVariant(options)],
        replySignature: DBusSignature('ay'),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues[0].asByteArray().toList();
  }

  /// Invokes org.bluez.GattDescriptor1.WriteValue()
  Future<void> callWriteValue(List<int> value, Map<String, DBusValue> options,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.GattDescriptor1', 'WriteValue',
        [DBusArray.byte(value), DBusDict.stringVariant(options)],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }
}
