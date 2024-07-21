import 'dart:io';

sealed class SysfsClass {
  final String klass;
  final String name;

  SysfsClass(this.name, this.klass);

  String getString(String property) {
    return File("/sys/class/$klass/$name/$property").readAsStringSync().trim();
  }

  int getInt(String property) {
    return int.parse(getString(property));
  }

  double getDouble(String property) {
    return double.parse(getString(property));
  }

  bool getBool(String property) {
    return getString(property) == "1";
  }
}

class SysfsPowerSupply extends SysfsClass {
  static const _klass = "power_supply";
  SysfsPowerSupply._(super.name, super.klass);

  static Future<List<SysfsPowerSupply>> list() async =>
      (await _listNames(_klass))
          .map((e) => SysfsPowerSupply._(e, _klass))
          .toList();

  SysfsPowerSupplyType get type => switch (getString("type")) {
        "Battery" => SysfsPowerSupplyType.battery,
        "UPS" => SysfsPowerSupplyType.ups,
        "Mains" => SysfsPowerSupplyType.mains,
        "USB" => SysfsPowerSupplyType.usb,
        "Wireless" => SysfsPowerSupplyType.wireless,
        final other => throw "Unknown power supply type: $other",
      };

  SysfsPowerSupplyStatus get status => switch (getString("status")) {
        "Charging" => SysfsPowerSupplyStatus.charging,
        "Discharging" => SysfsPowerSupplyStatus.discharging,
        "Not charging" => SysfsPowerSupplyStatus.notCharging,
        "Full" => SysfsPowerSupplyStatus.full,
        final other => throw "Unknown power supply status: $other",
      };

  int get capacity => getInt("capacity");

  @override
  String toString() {
    return "SysfsPowerSupply($name)";
  }
}

Future<List<String>> _listNames(String klass) async {
  return await Directory("/sys/class/$klass")
      .list()
      .map((e) => e.path.split("/").last)
      .toList();
}

enum SysfsPowerSupplyType {
  battery,
  ups,
  mains,
  usb,
  wireless,
  unknown,
}

enum SysfsPowerSupplyStatus {
  charging,
  discharging,
  notCharging,
  full,
  unknown,
}
