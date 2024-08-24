// This file was generated using the following command and may be overwritten.
// dart-dbus generate-remote-object dbus/org.bluez.obex.FileTransfer1.xml

import 'dart:io';
import 'package:dbus/dbus.dart';

class OrgBluezObexFileTransfer1 extends DBusRemoteObject {
  OrgBluezObexFileTransfer1(DBusClient client, String destination, DBusObjectPath path) : super(client, name: destination, path: path);

  /// Invokes org.bluez.obex.FileTransfer1.ChangeFolder()
  Future<void> callChangeFolder(String folder, {bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.obex.FileTransfer1', 'ChangeFolder', [DBusString(folder)], replySignature: DBusSignature(''), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.bluez.obex.FileTransfer1.CreateFolder()
  Future<void> callCreateFolder(String folder, {bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.obex.FileTransfer1', 'CreateFolder', [DBusString(folder)], replySignature: DBusSignature(''), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.bluez.obex.FileTransfer1.ListFolder()
  Future<List<Map<String, DBusValue>>> callListFolder({bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod('org.bluez.obex.FileTransfer1', 'ListFolder', [], replySignature: DBusSignature('aa{sv}'), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues[0].asArray().map((child) => child.asStringVariantDict()).toList();
  }

  /// Invokes org.bluez.obex.FileTransfer1.GetFile()
  Future<List<DBusValue>> callGetFile(String targetfile, String sourcefile, {bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod('org.bluez.obex.FileTransfer1', 'GetFile', [DBusString(targetfile), DBusString(sourcefile)], replySignature: DBusSignature('oa{sv}'), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues;
  }

  /// Invokes org.bluez.obex.FileTransfer1.PutFile()
  Future<List<DBusValue>> callPutFile(String sourcefile, String targetfile, {bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod('org.bluez.obex.FileTransfer1', 'PutFile', [DBusString(sourcefile), DBusString(targetfile)], replySignature: DBusSignature('oa{sv}'), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues;
  }

  /// Invokes org.bluez.obex.FileTransfer1.CopyFile()
  Future<void> callCopyFile(String sourcefile, String targetfile, {bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.obex.FileTransfer1', 'CopyFile', [DBusString(sourcefile), DBusString(targetfile)], replySignature: DBusSignature(''), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.bluez.obex.FileTransfer1.MoveFile()
  Future<void> callMoveFile(String sourcefile, String targetfile, {bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.obex.FileTransfer1', 'MoveFile', [DBusString(sourcefile), DBusString(targetfile)], replySignature: DBusSignature(''), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
  }

  /// Invokes org.bluez.obex.FileTransfer1.Delete()
  Future<void> callDelete(String file, {bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
    await callMethod('org.bluez.obex.FileTransfer1', 'Delete', [DBusString(file)], replySignature: DBusSignature(''), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
  }
}
