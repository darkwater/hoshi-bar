import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme.g.dart';

@riverpod
MaterialColor themeColor(ThemeColorRef ref) {
  return Colors.blue;
}
