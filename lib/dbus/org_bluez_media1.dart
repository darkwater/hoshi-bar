// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object dbus/org.bluez.Media1.xml

import 'dart:io';
import 'package:dbus/dbus.dart';

class OrgBluezMedia1 extends DBusRemoteObject {
  OrgBluezMedia1(DBusClient client, String destination, DBusObjectPath path)
      : super(client, name: destination, path: path);

  /// Invokes org.bluez.Media1.RegisterEndpoint()
  Future<void> callRegisterEndpoint(
      DBusObjectPath endpoint, Map<String, DBusValue> properties,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.Media1', 'RegisterEndpoint',
        [endpoint, DBusDict.stringVariant(properties)],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.bluez.Media1.UnregisterEndpoint()
  Future<void> callUnregisterEndpoint(DBusObjectPath endpoint,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.Media1', 'UnregisterEndpoint', [endpoint],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }
}
