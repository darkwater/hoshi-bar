// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object dbus/org.bluez.obex.Session1.xml

import 'dart:io';
import 'package:dbus/dbus.dart';

class OrgBluezObexSession1 extends DBusRemoteObject {
  OrgBluezObexSession1(DBusClient client, String destination, DBusObjectPath path) : super(client, name: destination, path: path);

  /// Invokes org.bluez.obex.Session1.GetCapabilities()
  Future<String> callGetCapabilities({bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod('org.bluez.obex.Session1', 'GetCapabilities', [], replySignature: DBusSignature('s'), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues[0].asString();
  }
}
