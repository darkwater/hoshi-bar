import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const double hbSmallComponentWidth = 90;
const double hbMediumComponentWidth = 150;
const Color hbBackgroundColor = Color.fromRGBO(0x21, 0x27, 0x33, 0.8);

const Size hbPopupSize = Size(240, 140);
const Size hbPopupFullSize = Size(480, 300);

const double hbBarHeight = 64;

const Duration hbUpdateFrequency =
    kDebugMode ? Duration(seconds: 1) : Duration(seconds: 10);
const Duration hbGraphPer100Px =
    kDebugMode ? Duration(minutes: 1) : Duration(minutes: 5);

final Duration hbDefaultKeepHistory =
    hbGraphPer100Px * (hbPopupFullSize.width ~/ 100);
