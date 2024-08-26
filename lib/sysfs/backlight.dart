import 'sysfs.dart';

class SysfsBacklight extends SysfsClass {
  static const _klass = "backlight";
  SysfsBacklight._(super.id, super.klass);

  static Future<List<SysfsBacklight>> list() async =>
      (await listSysfsNames(_klass))
          .map((e) => SysfsBacklight._(e, _klass))
          .toList();

  Future<int> get actualBrightness => getInt("actual_brightness");
  Future<int> get brightness => getInt("brightness");
  Future<int> get maxBrightness => getInt("max_brightness");
  Future<double> get brightnessFraction async =>
      await brightness / await maxBrightness;

  Future<void> setBrightness(int value) => setInt("brightness", value);

  @override
  String toString() {
    return "SysfsBacklight($id)";
  }
}
