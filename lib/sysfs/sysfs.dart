import 'dart:io';

abstract class SysfsClass {
  final String klass;
  final String id;

  SysfsClass(this.id, this.klass);

  File _file(String property) {
    return File("/sys/class/$klass/$id/$property");
  }

  String getString(String property) {
    return _file(property).readAsStringSync().trim();
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

  T? optional<T>(T Function() f) {
    try {
      return f();
    } catch (e) {
      return null;
    }
  }

  void setString(String property, String value) {
    _file(property).writeAsStringSync(value);
  }

  void setInt(String property, int value) {
    setString(property, value.toString());
  }

  void setDouble(String property, double value) {
    setString(property, value.toString());
  }

  void setBool(String property, bool value) {
    setString(property, value ? "1" : "0");
  }
}

Future<List<String>> listSysfsNames(String klass) async {
  return await Directory("/sys/class/$klass")
      .list()
      .map((e) => e.path.split("/").last)
      .toList();
}
