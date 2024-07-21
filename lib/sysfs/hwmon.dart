import 'sysfs.dart';

class SysfsHwmon extends SysfsClass {
  static const _klass = "hwmon";
  SysfsHwmon._(super.id, super.klass);

  static Future<List<SysfsHwmon>> list() async => (await listSysfsNames(_klass))
      .map((e) => SysfsHwmon._(e, _klass))
      .toList();

  String get name => getString("name");
  double? tempInput(int n) => optional(() => getInt("temp${n}_input") / 1000);

  List<double>? get temps {
    final temps = <double>[];
    for (var i = 1; i < 10; i++) {
      final temp = tempInput(i);
      if (temp == null) break;
      temps.add(temp);
    }
    if (temps.isEmpty) return null;
    return temps;
  }

  double? get avgTemp {
    final temps = this.temps;
    if (temps == null) return null;
    return temps.reduce((a, b) => a + b) / temps.length;
  }

  double? get maxTemp {
    final temps = this.temps;
    if (temps == null) return null;
    return temps.reduce((a, b) => a > b ? a : b);
  }

  @override
  String toString() {
    return "SysfsHwmon($id)";
  }
}
