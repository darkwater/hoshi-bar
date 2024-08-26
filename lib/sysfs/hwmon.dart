import 'sysfs.dart';

class SysfsHwmon extends SysfsClass {
  static const _klass = "hwmon";
  SysfsHwmon._(super.id, super.klass);

  static Future<List<SysfsHwmon>> list() async => (await listSysfsNames(_klass))
      .map((e) => SysfsHwmon._(e, _klass))
      .toList();

  Future<String> get name => getString("name");
  Future<double?> tempInput(int n) => optional(
        () async => (await getInt("temp${n}_input")) / 1000,
      );

  Future<List<double>?> get temps async {
    final temps = <double>[];
    for (var i = 1; i < 10; i++) {
      final temp = await tempInput(i);
      if (temp == null) break;
      temps.add(temp);
    }
    if (temps.isEmpty) return null;
    return temps;
  }

  Future<double?> get avgTemp async {
    final temps = await this.temps;
    if (temps == null) return null;
    return temps.reduce((a, b) => a + b) / temps.length;
  }

  Future<double?> get maxTemp async {
    final temps = await this.temps;
    if (temps == null) return null;
    return temps.reduce((a, b) => a > b ? a : b);
  }

  @override
  String toString() {
    return "SysfsHwmon($id)";
  }
}
