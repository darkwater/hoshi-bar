import 'package:fdls/constants.dart';
import 'package:fdls/sysfs/backlight.dart';
import 'package:fdls/widgets/component.dart';
import 'package:fdls/widgets/slider.dart';
import 'package:fdls/widgets/two_row.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'backlight.g.dart';
part 'backlight.freezed.dart';

@riverpod
Stream<List<Backlight>> backlightStream(BacklightStreamRef ref) async* {
  final backlights = await SysfsBacklight.list();

  while (true) {
    final out = <Backlight>[];
    for (final backlight in backlights) {
      out.add(Backlight(
        sysfs: backlight,
        brightness: await backlight.brightness,
        brightnessFraction: await backlight.brightnessFraction,
        maxBrightness: await backlight.maxBrightness,
      ));
    }

    yield out;

    await Future.delayed(fdlsUpdateFrequency);
  }
}

@freezed
abstract class Backlight with _$Backlight {
  const factory Backlight({
    required SysfsBacklight sysfs,
    required double brightnessFraction,
    required int brightness,
    required int maxBrightness,
  }) = _Backlight;
}

class BacklightComponent extends ConsumerWidget {
  const BacklightComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backlights = ref.watch(backlightStreamProvider);

    return Row(
      children: [
        ...(backlights.valueOrNull ?? []).map((backlight) {
          return Component(
            primaryColor: Colors.yellow,
            width: fdlsSmallComponentWidth,
            child: BarSlider(
              onChanged: (newBrightness) async {
                // TODO: use dbus instead
                // https://github.com/Alexays/Waybar/blob/master/src/util/backlight_backend.cpp#L266

                backlight.sysfs.setBrightness(
                  (newBrightness * backlight.maxBrightness).round(),
                );

                ref.invalidate(backlightStreamProvider);
              },
              value: backlight.brightnessFraction,
              builder: (context, brightness) => (
                const Icon(Icons.light_mode),
                Text("${(brightness * 100).round()}%"),
              ),
            ),
          );
        }),
      ],
    );
  }
}
