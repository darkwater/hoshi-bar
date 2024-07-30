// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object dbus/org.bluez.Device1.xml

import 'dart:io';
import 'package:dbus/dbus.dart';

class OrgBluezDevice1 extends DBusRemoteObject {
  OrgBluezDevice1(DBusClient client, String destination, DBusObjectPath path) : super(client, name: destination, path: path);

  /// Invokes org.bluez.Device1.Disconnect()
  Future<void> callDisconnect({bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.Device1', 'Disconnect', [], replySignature: DBusSignature(''), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.bluez.Device1.Connect()
  Future<void> callConnect({bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.Device1', 'Connect', [], replySignature: DBusSignature(''), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.bluez.Device1.ConnectProfile()
  Future<void> callConnectProfile(String UUID, {bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.Device1', 'ConnectProfile', [DBusString(UUID)], replySignature: DBusSignature(''), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.bluez.Device1.DisconnectProfile()
  Future<void> callDisconnectProfile(String UUID, {bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.Device1', 'DisconnectProfile', [DBusString(UUID)], replySignature: DBusSignature(''), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.bluez.Device1.Pair()
  Future<void> callPair({bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.Device1', 'Pair', [], replySignature: DBusSignature(''), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.bluez.Device1.CancelPairing()
  Future<void> callCancelPairing({bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.Device1', 'CancelPairing', [], replySignature: DBusSignature(''), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
  }
}
