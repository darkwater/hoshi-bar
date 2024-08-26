import 'sysfs.dart';

class SysfsNet extends SysfsClass {
  static const _klass = "net";
  SysfsNet._(super.id, super.klass);

  static Future<List<SysfsNet>> list() async =>
      (await listSysfsNames(_klass)).map((e) => SysfsNet._(e, _klass)).toList();

  Future<int> get rxBytes => getInt("statistics/rx_bytes");
  Future<int> get txBytes => getInt("statistics/tx_bytes");

  @override
  String toString() {
    return "SysfsNet($id)";
  }
}
