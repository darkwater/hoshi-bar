// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object dbus/org.bluez.obex.ObjectPush1.xml

import 'dart:io';
import 'package:dbus/dbus.dart';

class OrgBluezObexObjectPush1 extends DBusRemoteObject {
  OrgBluezObexObjectPush1(DBusClient client, String destination, DBusObjectPath path) : super(client, name: destination, path: path);

  /// Invokes org.bluez.obex.ObjectPush1.SendFile()
  Future<List<DBusValue>> callSendFile(String sourcefile, {bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod('org.bluez.obex.ObjectPush1', 'SendFile', [DBusString(sourcefile)], replySignature: DBusSignature('oa{sv}'), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues;
  }

  /// Invokes org.bluez.obex.ObjectPush1.PullBusinessCard()
  Future<List<DBusValue>> callPullBusinessCard(String targetfile, {bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod('org.bluez.obex.ObjectPush1', 'PullBusinessCard', [DBusString(targetfile)], replySignature: DBusSignature('oa{sv}'), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues;
  }

  /// Invokes org.bluez.obex.ObjectPush1.ExchangeBusinessCards()
  Future<List<DBusValue>> callExchangeBusinessCards(String clientfile, String targetfile, {bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod('org.bluez.obex.ObjectPush1', 'ExchangeBusinessCards', [DBusString(clientfile), DBusString(targetfile)], replySignature: DBusSignature('oa{sv}'), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues;
  }
}
