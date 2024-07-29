import 'sysfs.dart';

class SysfsBacklight extends SysfsClass {
  static const _klass = "backlight";
  SysfsBacklight._(super.id, super.klass);

  static Future<List<SysfsBacklight>> list() async =>
      (await listSysfsNames(_klass))
          .map((e) => SysfsBacklight._(e, _klass))
          .toList();

  int get actualBrightness => getInt("actual_brightness");
  int get brightness => getInt("brightness");
  int get maxBrightness => getInt("max_brightness");
  double get brightnessFraction => brightness / maxBrightness;

  set brightness(int value) {
    setInt("brightness", value);
  }

  @override
  String toString() {
    return "SysfsBacklight($id)";
  }
}
