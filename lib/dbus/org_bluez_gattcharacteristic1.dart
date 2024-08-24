// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object dbus/org.bluez.GattCharacteristic1.xml

import 'dart:io';
import 'package:dbus/dbus.dart';

class OrgBluezGattCharacteristic1 extends DBusRemoteObject {
  OrgBluezGattCharacteristic1(DBusClient client, String destination, DBusObjectPath path) : super(client, name: destination, path: path);

  /// Invokes org.bluez.GattCharacteristic1.ReadValue()
  Future<List<int>> callReadValue(Map<String, DBusValue> options, {bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod('org.bluez.GattCharacteristic1', 'ReadValue', [DBusDict.stringVariant(options)], replySignature: DBusSignature('ay'), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues[0].asByteArray().toList();
  }

  /// Invokes org.bluez.GattCharacteristic1.WriteValue()
  Future<void> callWriteValue(List<int> value, Map<String, DBusValue> options, {bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.GattCharacteristic1', 'WriteValue', [DBusArray.byte(value), DBusDict.stringVariant(options)], replySignature: DBusSignature(''), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.bluez.GattCharacteristic1.StartNotify()
  Future<void> callStartNotify({bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.GattCharacteristic1', 'StartNotify', [], replySignature: DBusSignature(''), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.bluez.GattCharacteristic1.StopNotify()
  Future<void> callStopNotify({bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.GattCharacteristic1', 'StopNotify', [], replySignature: DBusSignature(''), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.bluez.GattCharacteristic1.Confirm()
  Future<void> callConfirm({bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.GattCharacteristic1', 'Confirm', [], replySignature: DBusSignature(''), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
  }
}
