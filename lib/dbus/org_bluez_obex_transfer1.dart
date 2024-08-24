// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object dbus/org.bluez.obex.Transfer1.xml

import 'dart:io';
import 'package:dbus/dbus.dart';

class OrgBluezObexTransfer1 extends DBusRemoteObject {
  OrgBluezObexTransfer1(DBusClient client, String destination, DBusObjectPath path) : super(client, name: destination, path: path);

  /// Invokes org.bluez.obex.Transfer1.Cancel()
  Future<void> callCancel({bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.obex.Transfer1', 'Cancel', [], replySignature: DBusSignature(''), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.bluez.obex.Transfer1.Suspend()
  Future<void> callSuspend({bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.obex.Transfer1', 'Suspend', [], replySignature: DBusSignature(''), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.bluez.obex.Transfer1.Resume()
  Future<void> callResume({bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.obex.Transfer1', 'Resume', [], replySignature: DBusSignature(''), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
  }
}
