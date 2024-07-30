// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object dbus/org.bluez.LEAdvertisingManager1.xml

import 'dart:io';
import 'package:dbus/dbus.dart';

class OrgBluezLEAdvertisingManager1 extends DBusRemoteObject {
  OrgBluezLEAdvertisingManager1(DBusClient client, String destination, DBusObjectPath path) : super(client, name: destination, path: path);

  /// Invokes org.bluez.LEAdvertisingManager1.RegisterAdvertisement()
  Future<void> callRegisterAdvertisement(DBusObjectPath advertisement, Map<String, DBusValue> options, {bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.LEAdvertisingManager1', 'RegisterAdvertisement', [advertisement, DBusDict.stringVariant(options)], replySignature: DBusSignature(''), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.bluez.LEAdvertisingManager1.UnregisterAdvertisement()
  Future<void> callUnregisterAdvertisement(DBusObjectPath advertisement, {bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.LEAdvertisingManager1', 'UnregisterAdvertisement', [advertisement], replySignature: DBusSignature(''), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
  }
}
