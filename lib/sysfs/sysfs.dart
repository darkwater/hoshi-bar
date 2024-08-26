import 'dart:io';

abstract class SysfsClass {
  final String klass;
  final String id;

  SysfsClass(this.id, this.klass);

  File _file(String property) {
    return File("/sys/class/$klass/$id/$property");
  }

  Future<String> getString(String property) async {
    return (await _file(property).readAsString()).trim();
  }

  Future<int> getInt(String property) async {
    return int.parse(await getString(property));
  }

  Future<double> getDouble(String property) async {
    return double.parse(await getString(property));
  }

  Future<bool> getBool(String property) async {
    return await getString(property) == "1";
  }

  Future<T?> optional<T>(Future<T> Function() f) async {
    try {
      return await f();
    } catch (e) {
      return null;
    }
  }

  Future<void> setString(String property, String value) async {
    _file(property).writeAsString(value);
  }

  Future<void> setInt(String property, int value) async {
    setString(property, value.toString());
  }

  Future<void> setDouble(String property, double value) async {
    setString(property, value.toString());
  }

  Future<void> setBool(String property, bool value) async {
    setString(property, value ? "1" : "0");
  }
}

Future<List<String>> listSysfsNames(String klass) async {
  return await Directory("/sys/class/$klass")
      .list()
      .map((e) => e.path.split("/").last)
      .toList();
}
