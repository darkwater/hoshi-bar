// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object dbus/org.bluez.obex.AgentManager1.xml

import 'dart:io';
import 'package:dbus/dbus.dart';

class OrgBluezObexAgentManager1 extends DBusRemoteObject {
  OrgBluezObexAgentManager1(
      DBusClient client, String destination, DBusObjectPath path)
      : super(client, name: destination, path: path);

  /// Invokes org.bluez.obex.AgentManager1.RegisterAgent()
  Future<void> callRegisterAgent(DBusObjectPath agent,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.obex.AgentManager1', 'RegisterAgent', [agent],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.bluez.obex.AgentManager1.UnregisterAgent()
  Future<void> callUnregisterAgent(DBusObjectPath agent,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.obex.AgentManager1', 'UnregisterAgent', [agent],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }
}
