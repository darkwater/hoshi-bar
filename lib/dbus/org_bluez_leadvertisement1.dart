// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object dbus/org.bluez.LEAdvertisement1.xml

import 'dart:io';
import 'package:dbus/dbus.dart';

class OrgBluezLEAdvertisement1 extends DBusRemoteObject {
  OrgBluezLEAdvertisement1(
      DBusClient client, String destination, DBusObjectPath path)
      : super(client, name: destination, path: path);

  /// Invokes org.bluez.LEAdvertisement1.Release()
  Future<void> callRelease(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.LEAdvertisement1', 'Release', [],
        replySignature: DBusSignature(''),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
  }
}
