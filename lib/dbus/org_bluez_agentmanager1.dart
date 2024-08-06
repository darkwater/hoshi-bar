// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object dbus/org.bluez.AgentManager1.xml

import 'dart:io';
import 'package:dbus/dbus.dart';

class OrgBluezAgentManager1 extends DBusRemoteObject {
  OrgBluezAgentManager1(
      DBusClient client, String destination, DBusObjectPath path)
      : super(client, name: destination, path: path);

  /// Invokes org.bluez.AgentManager1.RegisterAgent()
  Future<void> callRegisterAgent(DBusObjectPath agent, String capability,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.AgentManager1', 'RegisterAgent',
        [agent, DBusString(capability)],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.bluez.AgentManager1.UnregisterAgent()
  Future<void> callUnregisterAgent(DBusObjectPath agent,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.AgentManager1', 'UnregisterAgent', [agent],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.bluez.AgentManager1.RequestDefaultAgent()
  Future<void> callRequestDefaultAgent(DBusObjectPath agent,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.AgentManager1', 'RequestDefaultAgent', [agent],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }
}
