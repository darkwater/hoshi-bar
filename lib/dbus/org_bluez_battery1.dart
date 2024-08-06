// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object dbus/org.bluez.Battery1.xml

import 'dart:io';
import 'package:dbus/dbus.dart';

class OrgBluezBattery1 extends DBusRemoteObject {
  OrgBluezBattery1(DBusClient client, String destination, DBusObjectPath path)
      : super(client, name: destination, path: path);

  /// Gets org.bluez.Battery1.Percentage
  Future<int> getPercentage() async {
    var value = await getProperty('org.bluez.Battery1', 'Percentage',
        signature: DBusSignature('y'));
    return value.asByte();
  }
}
