import 'sysfs.dart';

class SysfsPowerSupply extends SysfsClass {
  static const _klass = "power_supply";
  SysfsPowerSupply._(super.id, super.klass);

  static Future<List<SysfsPowerSupply>> list() async =>
      (await listSysfsNames(_klass))
          .map((e) => SysfsPowerSupply._(e, _klass))
          .toList();

  Future<SysfsPowerSupplyType> get type async =>
      switch (await getString("type")) {
        "Battery" => SysfsPowerSupplyType.battery,
        "UPS" => SysfsPowerSupplyType.ups,
        "Mains" => SysfsPowerSupplyType.mains,
        "USB" => SysfsPowerSupplyType.usb,
        "Wireless" => SysfsPowerSupplyType.wireless,
        final other => throw "Unknown power supply type: $other",
      };

  Future<SysfsPowerSupplyStatus> get status async =>
      switch (await getString("status")) {
        "Charging" => SysfsPowerSupplyStatus.charging,
        "Discharging" => SysfsPowerSupplyStatus.discharging,
        "Not charging" => SysfsPowerSupplyStatus.notCharging,
        "Full" => SysfsPowerSupplyStatus.full,
        final other => throw "Unknown power supply status: $other",
      };

  Future<double> get capacity async => (await getInt("capacity")) / 100;

  @override
  String toString() {
    return "SysfsPowerSupply($id)";
  }
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
