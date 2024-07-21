import 'sysfs.dart';

class SysfsHwmon extends SysfsClass {
  static const _klass = "hwmon";
  SysfsHwmon._(super.id, super.klass);

  static Future<List<SysfsHwmon>> list() async => (await listSysfsNames(_klass))
      .map((e) => SysfsHwmon._(e, _klass))
      .toList();

  String get name => getString("name");
  double? get temp1Input => optional(() => getInt("temp1_input") / 1000);

  @override
  String toString() {
    return "SysfsHwmon($id)";
  }
}
