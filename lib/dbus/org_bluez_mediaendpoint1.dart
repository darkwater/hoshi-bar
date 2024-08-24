// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object dbus/org.bluez.MediaEndpoint1.xml

import 'dart:io';
import 'package:dbus/dbus.dart';

class OrgBluezMediaEndpoint1 extends DBusRemoteObject {
  OrgBluezMediaEndpoint1(DBusClient client, String destination, DBusObjectPath path) : super(client, name: destination, path: path);

  /// Invokes org.bluez.MediaEndpoint1.SetConfiguration()
  Future<void> callSetConfiguration(DBusObjectPath transport, Map<String, DBusValue> properties, {bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.MediaEndpoint1', 'SetConfiguration', [transport, DBusDict.stringVariant(properties)], replySignature: DBusSignature(''), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.bluez.MediaEndpoint1.SelectConfiguration()
  Future<List<int>> callSelectConfiguration(List<int> capabilities, {bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod('org.bluez.MediaEndpoint1', 'SelectConfiguration', [DBusArray.byte(capabilities)], replySignature: DBusSignature('ay'), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues[0].asByteArray().toList();
  }

  /// Invokes org.bluez.MediaEndpoint1.ClearConfiguration()
  Future<void> callClearConfiguration(DBusObjectPath transport, {bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.MediaEndpoint1', 'ClearConfiguration', [transport], replySignature: DBusSignature(''), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.bluez.MediaEndpoint1.Release()
  Future<void> callRelease({bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.MediaEndpoint1', 'Release', [], replySignature: DBusSignature(''), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
  }
}
