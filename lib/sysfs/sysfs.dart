import 'dart:io';

abstract class SysfsClass {
  final String klass;
  final String id;

  SysfsClass(this.id, this.klass);

  String getString(String property) {
    return File("/sys/class/$klass/$id/$property").readAsStringSync().trim();
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
}

Future<List<String>> listSysfsNames(String klass) async {
  return await Directory("/sys/class/$klass")
      .list()
      .map((e) => e.path.split("/").last)
      .toList();
}
