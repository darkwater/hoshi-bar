import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final screenSizeProvider = StateProvider<Size>((ref) => Size.zero);
final popupProvider = StateProvider<Widget?>((ref) => null);
final popupAnchorRectProvider = StateProvider<Rect>((ref) => Rect.zero);
final popupSizeProvider = StateProvider<Size>((ref) => Size.zero);
final popupThemeProvider = StateProvider<ThemeData>((ref) => ThemeData());
final popupExpandedProvider = StateProvider<bool>((ref) => false);
