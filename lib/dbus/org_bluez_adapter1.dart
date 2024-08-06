// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object dbus/org.bluez.Adapter1.xml

import 'dart:io';
import 'package:dbus/dbus.dart';

class OrgBluezAdapter1 extends DBusRemoteObject {
  OrgBluezAdapter1(DBusClient client, String destination, DBusObjectPath path)
      : super(client, name: destination, path: path);

  /// Invokes org.bluez.Adapter1.StartDiscovery()
  Future<void> callStartDiscovery(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.Adapter1', 'StartDiscovery', [],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.bluez.Adapter1.StopDiscovery()
  Future<void> callStopDiscovery(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.Adapter1', 'StopDiscovery', [],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.bluez.Adapter1.RemoveDevice()
  Future<void> callRemoveDevice(DBusObjectPath device,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.Adapter1', 'RemoveDevice', [device],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.bluez.Adapter1.SetDiscoveryFilter()
  Future<void> callSetDiscoveryFilter(Map<String, DBusValue> options,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.Adapter1', 'SetDiscoveryFilter',
        [DBusDict.stringVariant(options)],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.bluez.Adapter1.GetDiscoveryFilters()
  Future<List<String>> callGetDiscoveryFilters(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod(
        'org.bluez.Adapter1', 'GetDiscoveryFilters', [],
        replySignature: DBusSignature('as'),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues[0].asStringArray().toList();
  }
}
