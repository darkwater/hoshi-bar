// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object dbus/org.bluez.Input1.xml

import 'dart:io';
import 'package:dbus/dbus.dart';

class OrgBluezInput1 extends DBusRemoteObject {
  OrgBluezInput1(DBusClient client, String destination, DBusObjectPath path)
      : super(client, name: destination, path: path);

  /// Gets org.bluez.Input1.ReconnectMode
  Future<String> getReconnectMode() async {
    var value = await getProperty('org.bluez.Input1', 'ReconnectMode',
        signature: DBusSignature('s'));
    return value.asString();
  }
}
