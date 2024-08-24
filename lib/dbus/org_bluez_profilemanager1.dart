// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object dbus/org.bluez.ProfileManager1.xml

import 'dart:io';
import 'package:dbus/dbus.dart';

class OrgBluezProfileManager1 extends DBusRemoteObject {
  OrgBluezProfileManager1(DBusClient client, String destination, DBusObjectPath path) : super(client, name: destination, path: path);

  /// Invokes org.bluez.ProfileManager1.RegisterProfile()
  Future<void> callRegisterProfile(DBusObjectPath profile, String UUID, Map<String, DBusValue> options, {bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.ProfileManager1', 'RegisterProfile', [profile, DBusString(UUID), DBusDict.stringVariant(options)], replySignature: DBusSignature(''), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.bluez.ProfileManager1.UnregisterProfile()
  Future<void> callUnregisterProfile(DBusObjectPath profile, {bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.ProfileManager1', 'UnregisterProfile', [profile], replySignature: DBusSignature(''), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
  }
}
