// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object dbus/org.bluez.obex.Client1.xml

import 'dart:io';
import 'package:dbus/dbus.dart';

class OrgBluezObexClient1 extends DBusRemoteObject {
  OrgBluezObexClient1(
      DBusClient client, String destination, DBusObjectPath path)
      : super(client, name: destination, path: path);

  /// Invokes org.bluez.obex.Client1.CreateSession()
  Future<DBusObjectPath> callCreateSession(
      String destination, Map<String, DBusValue> args,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod('org.bluez.obex.Client1', 'CreateSession',
        [DBusString(destination), DBusDict.stringVariant(args)],
        replySignature: DBusSignature('o'),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues[0].asObjectPath();
  }

  /// Invokes org.bluez.obex.Client1.RemoveSession()
  Future<void> callRemoveSession(DBusObjectPath session,
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.obex.Client1', 'RemoveSession', [session],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }
}
